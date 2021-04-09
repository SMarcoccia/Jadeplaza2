package fr.clelia.jade2.controller;

import javax.servlet.http.HttpSession;

import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import fr.clelia.jade2.business.Personne;
import fr.clelia.jade2.service.AgenceService;
import fr.clelia.jade2.service.AnnonceService;
import fr.clelia.jade2.service.AppelService;
import fr.clelia.jade2.service.OrigineService;
import fr.clelia.jade2.service.PersonneService;
import fr.clelia.jade2.service.TypeAppelantService;

@Controller
public class AuthentificationController {
	
	private HttpSession httpSession;
	private AppelService appelService;
	private AgenceService agenceService; 
	private PersonneService personneService;
	private TypeAppelantService typeAppelantService;
	private AnnonceService annonceService;
	private OrigineService origineService;
	
	
	public AuthentificationController(HttpSession httpSession, AppelService appelService, AgenceService agenceService,
			PersonneService personneService, TypeAppelantService typeAppelantService, AnnonceService annonceService,
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

	
	
	@GetMapping({"index", "/"})
	public ModelAndView connectionGet() {
		return new ModelAndView("connexion");
	}
	
	@PostMapping("/connexion")
	public ModelAndView connectionPost(
		@RequestParam("email") String email,
		@RequestParam("motDePasse") String motDePasse,
		@PageableDefault(size = 20) Pageable pageable
	) {
		Personne personne = personneService.recupererPersonneParEmailEtMotDePasse(email, motDePasse);
		if(personne != null) {
			httpSession.setAttribute("personne", personne);	
			ModelAndView mav = new ModelAndView();
			mav.addObject("agences", agenceService.recupererAgences());
			mav.addObject("annonces", annonceService.recupererAnnonces());
			mav.addObject("origines", origineService.recupererOrigines());
			mav.addObject("personnes", personneService.recupererPersonnes());
			mav.addObject("typeAppelants", typeAppelantService.recupererTypeAppelants());
			mav.addObject("pageDAppels", appelService.recupererAppels(pageable));
			mav.setViewName("appels");
			return mav;	
		}
		else {
			ModelAndView mav = new ModelAndView("connexion");
			mav.addObject("notification", "Pseudo ou mot de passe incorrect.");
			return mav;
		}
	}
	
	@GetMapping("deconnexion")
	public ModelAndView deconnexionGet() {
		httpSession.invalidate();
		return new ModelAndView("redirect:index");
	}
}
