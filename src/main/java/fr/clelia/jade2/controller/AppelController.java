package fr.clelia.jade2.controller;

import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

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
public class AppelController {
	private HttpSession httpSession;
	private AppelService appelService;
	private AgenceService agenceService; 
	private PersonneService personneService;
	private TypeAppelantService typeAppelantService;
	private AnnonceService annonceService;
	private OrigineService origineService;
	
	
	public AppelController(
		HttpSession httpSession,
		AppelService appelService, 
		AgenceService agenceService,             
		PersonneService personneService,
		TypeAppelantService typeAppelantService, 
		AnnonceService annonceService,           
		OrigineService origineService
	) {
		super();
		this.httpSession = httpSession;
		this.appelService = appelService;
		this.agenceService = agenceService;            
		this.personneService = personneService;        
		this.typeAppelantService = typeAppelantService;
		this.annonceService = annonceService;          
		this.origineService = origineService;          
	}

	
	@GetMapping("/mes-appels")
	public ModelAndView mesAppelsGet(
		@PageableDefault(
				size = 20,
				sort = "RECEIVEDON",
				direction = Sort.Direction.DESC
			) Pageable pageable
		) {
			Personne personne = (Personne) httpSession.getAttribute("personne"); 
			if( personne != null) {
				ModelAndView mav = new ModelAndView();
				mav.addObject("agences", agenceService.recupererAgences());
				mav.addObject("annonces", annonceService.recupererAnnonces());
				mav.addObject("origines", origineService.recupererOrigines());
				mav.addObject("personnes", personneService.recupererPersonnes());
				mav.addObject("typeAppelants", typeAppelantService.recupererTypeAppelants());
				mav.addObject("pageDAppels", appelService.recupererMesAppels(personne.getId(), pageable));
				mav.setViewName("appels");
				return mav;
			}
			else {
				return new ModelAndView("redirect:index");
			}
	}
	
	@PostMapping({"/ajouter-un-appel", "/modifier-un-appel"})
	public ModelAndView appelPost(
		@Valid @ModelAttribute("appel") Appel appel,
		@RequestParam(required=false, value="idAppel") String idAppel,
		BindingResult result
	) {
		if(httpSession.getAttribute("personne") != null) {
			if(result.hasErrors()) {
	    		ModelAndView mav = new ModelAndView();
	    		mav.addObject("idAppel", idAppel);
				mav.addObject("agences", agenceService.recupererAgences());
				mav.addObject("annonces", annonceService.recupererAnnonces());
				mav.addObject("origines", origineService.recupererOrigines());
				mav.addObject("personnes", personneService.recupererPersonnes());
				mav.addObject("typeAppelants", typeAppelantService.recupererTypeAppelants());
	    		mav.addObject("appel", appel);
	    		mav.setViewName("appel");
	    		return mav;
	    	}else {
	    		appel.setDateHeure(new Date());
	    		System.out.println("\n\n");
	    		System.out.println(appel.getId());
	    		System.out.println("\n\n");
	    		appelService.modifierAppel(appel);
	    		ModelAndView mav = new ModelAndView("redirect:appels");
	    		return mav;
	    	}
		}else {
			return new ModelAndView("redirect:index");
		}
	}

	@GetMapping({"/ajouter-un-appel", "/modifier-un-appel"})
	public ModelAndView appelGet( 
		@ModelAttribute("appel") Appel appel, 
		@RequestParam(required=false, value="idAppel") String idAppel
	) {
		if(httpSession.getAttribute("personne") != null) {
			ModelAndView mav = new ModelAndView();
			
			if(idAppel != null) {
				mav.addObject("appel", appelService.recupererAppelParId(Integer.parseInt(idAppel)));
			}
    		System.out.println("\n\n");
    		System.out.println(idAppel);
    		System.out.println("\n\n");
			mav.addObject("idAppel", idAppel);
			mav.addObject("agences", agenceService.recupererAgences());
			mav.addObject("annonces", annonceService.recupererAnnonces());
			mav.addObject("origines", origineService.recupererOrigines());
			mav.addObject("personnes", personneService.recupererPersonnes());
			mav.addObject("typeAppelants", typeAppelantService.recupererTypeAppelants());
			mav.setViewName("appel");
			return mav;
		}else {
			return new ModelAndView("redirect:index");
		}
	}
	
	/* Displays the list of calls and is used to refresh the filters  */
	@GetMapping({"/appels", "/rafraichir", "/enlever-filtre"})
	public ModelAndView appelsGet(
		@PageableDefault(
			size = 20, 
			sort = "dateHeure", 
			direction = Sort.Direction.DESC) Pageable pageable
	) {
		if(httpSession.getAttribute("personne") != null) {
			ModelAndView mav = new ModelAndView();
			mav.addObject("agences", agenceService.recupererAgences());
			mav.addObject("annonces", annonceService.recupererAnnonces());
			mav.addObject("origines", origineService.recupererOrigines());
			mav.addObject("personnes", personneService.recupererPersonnes());
			mav.addObject(
				"typeAppelants", 
				typeAppelantService.recupererTypeAppelants()
			);
			mav.addObject("pageDAppels", appelService.recupererAppels(pageable));
			mav.setViewName("appels");
			return mav;
		} else {
			return new ModelAndView("redirect:index");
		}
	}

	/*
	 * To sort the search results in descending or ascending order.  
	 */
	@GetMapping("/filtrer")
	public ModelAndView filtrerGet(
		@PageableDefault(size = 20, sort = "dateHeure", direction = Sort.Direction.DESC) Pageable pageable,
		@RequestParam Map<String, String> post
	) throws ParseException {
		if(httpSession.getAttribute("personne") != null) {
			//We only recover the keys / values which are not empty and equal to -1.
			Map<String, String> map = new HashMap<>();
			for(String cle : post.keySet()) {
				if(! (post.get(cle).isEmpty()) && ! post.get(cle).equals("-1")) {
					map.put(cle, post.get(cle));
				}
			}
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("pageDAppels", appelService.recupererAppelsFiltrer(saveMap, pageable));
			mav.addObject("agences", agenceService.recupererAgences());
			mav.addObject("annonces", annonceService.recupererAnnonces());
			mav.addObject("origines", origineService.recupererOrigines());
			mav.addObject("personnes", personneService.recupererPersonnes());
			mav.addObject("typeAppelants", typeAppelantService.recupererTypeAppelants());
			mav.setViewName("appels");
			return mav;
		} else {
			return new ModelAndView("redirect:index");
		}
	}
	
	/**
	 * Display of search results.
	 */

	static Map<String, String> saveMap;
	
	@PostMapping("/filtrer")
	public ModelAndView filtrerPost(
		@PageableDefault(
			size = 20,	sort = "dateHeure", direction = Sort.Direction.DESC
		) Pageable pageable,
		@RequestParam Map<String, String> post
	) throws ParseException {
		if(httpSession.getAttribute("personne") != null) {
			//We only recover the keys / values which are not empty and equal to -1. 
			Map<String, String> map = new HashMap<>();
			for(String cle : post.keySet()) {
				if(! (post.get(cle).isEmpty()) && ! post.get(cle).equals("-1")                                                   /*&& ! cle.substring(0, cle.length()-1).equals("mySelect")*/) {
					map.put(cle, post.get(cle));
				}
			}
			
			saveMap = map;
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("pageDAppels", appelService.recupererAppelsFiltrer(map, pageable));
			mav.addObject("agences", agenceService.recupererAgences());
			mav.addObject("annonces", annonceService.recupererAnnonces());
			mav.addObject("origines", origineService.recupererOrigines());
			mav.addObject("personnes", personneService.recupererPersonnes());
			mav.addObject("typeAppelants", typeAppelantService.recupererTypeAppelants());
			mav.setViewName("appels");
			return mav;
		} else {
			return new ModelAndView("redirect:index");
		}
	}
}


