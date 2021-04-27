package fr.clelia.jade2.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import fr.clelia.jade2.business.Appel;
import fr.clelia.jade2.business.Personne;
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

	
	
	@PostMapping({"/ajouter-un-compte", "/modifier-un-compte"})
	public ModelAndView comptePost(
		@Valid @ModelAttribute("personne") Personne personne,
		@RequestParam(required=false, value="idpersonne") String idpersonne,
		BindingResult result
	) {
		Personne personneValue = (Personne) httpSession.getAttribute("personne");
		if(personneValue != null && personneValue.getEmail().equals("fxcote@clelia.fr")) {
			if(result.hasErrors()) {
	    		ModelAndView mav = new ModelAndView();
	    		mav.addObject("idpersonne", idpersonne);
	    		mav.addObject("personne", personne);
	    		mav.setViewName("compte");
	    		return mav;
	    	}else {
	    		personne.setDateHeureCreation(new Date());
	    		personneService.ajouterPersonne(personne);
	    		ModelAndView mav = new ModelAndView("redirect:liste-des-comptes");
	    		return mav;
	    	}
		}else {
			return new ModelAndView("redirect:index");
		}
	}

	@GetMapping({"/ajouter-un-compte", "/modifier-un-compte"})
	public ModelAndView compteGet( 
		@ModelAttribute("personne") Personne personne, 
		@RequestParam(required=false, value="idPersonne") String idPersonne
	) {
		Personne personneValue = (Personne) httpSession.getAttribute("personne");
		if(personneValue != null && personneValue.getEmail().equals("fxcote@clelia.fr")) {
			ModelAndView mav = new ModelAndView();
			
			if(idPersonne != null) {
				mav.addObject("personne", personneService.recupererPersonneParId(Integer.parseInt(idPersonne)));
			}

			mav.addObject("idPersonne", idPersonne);
			mav.setViewName("compte");
			return mav;
		}else {
			return new ModelAndView("redirect:index");
		}
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
