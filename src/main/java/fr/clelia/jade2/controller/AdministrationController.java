package fr.clelia.jade2.controller;

import javax.servlet.http.HttpSession;

import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import fr.clelia.jade2.service.AgenceService;
import fr.clelia.jade2.service.AnnonceService;
import fr.clelia.jade2.service.AppelService;
import fr.clelia.jade2.service.OrigineService;
import fr.clelia.jade2.service.PersonneService;
import fr.clelia.jade2.service.TypeAppelantService;

@Controller
public class AdministrationController {

	private HttpSession httpSession;
	private AppelService appelService;
	private AgenceService agenceService; 
	private PersonneService personneService;
	private TypeAppelantService typeAppelantService;
	private AnnonceService annonceService;
	private OrigineService origineService;
	
	public AdministrationController(
			HttpSession httpSession, 
			AppelService appelService, 
			AgenceService agenceService,
			PersonneService personneService, 
			TypeAppelantService typeAppelantService, 
			AnnonceService annonceService,
			OrigineService origineService) {
		super();
		this.httpSession = httpSession;
		this.appelService = appelService;
		this.agenceService = agenceService;
		this.personneService = personneService;
		this.typeAppelantService = typeAppelantService;
		this.annonceService = annonceService;
		this.origineService = origineService;
	}

	@GetMapping({"/liste-des-comptes"})
	public ModelAndView listeDesComptesGet(
		@PageableDefault(
			size = 20,
			sort = "nom",
			direction = Sort.Direction.ASC
		) Pageable pageable
	) {
		if(httpSession.getAttribute("personne") != null) {
			ModelAndView mav = new ModelAndView();
			mav.addObject("pageDeComptes", personneService.recupererPersonnes(pageable));
			mav.setViewName("comptes");
			return mav;
		} else {
			return new ModelAndView("redirect:index");
		}
	}
}
