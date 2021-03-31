package fr.clelia.jade2.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import fr.clelia.jade2.service.AgenceService;
import fr.clelia.jade2.service.AnnonceService;
import fr.clelia.jade2.service.AppelService;
import fr.clelia.jade2.service.OrigineService;
import fr.clelia.jade2.service.PersonneService;
import fr.clelia.jade2.service.TypeAppelantService;

@Controller
public class AppelsController {
	private AppelService appelService;
	private AgenceService agenceService; 
	private PersonneService personneService;
	private TypeAppelantService typeAppelantService;
	private AnnonceService annonceService;
	private OrigineService origineService;
	
	
	public AppelsController(
		AppelService appelService, 
		AgenceService agenceService,             
		PersonneService personneService,
		TypeAppelantService typeAppelantService, 
		AnnonceService annonceService,           
		OrigineService origineService
	) {
		super();
		this.appelService = appelService;
		this.agenceService = agenceService;            
		this.personneService = personneService;        
		this.typeAppelantService = typeAppelantService;
		this.annonceService = annonceService;          
		this.origineService = origineService;          
	}

	
	@GetMapping( "/appels")
	public ModelAndView appelsGet(
		@PageableDefault(
			size = 10,
			sort = "dateHeure",
			direction = Sort.Direction.ASC
		) Pageable pageable
	) {
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
	
	/*
	@GetMapping("/appels")
	public ModelAndView appelsGet(
	) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("agences", agenceService.recupererAgences());
		mav.addObject("annonces", annonceService.recupererAnnonces());
		mav.addObject("origines", origineService.recupererOrigines());
		mav.addObject("personnes", personneService.recupererPersonnes());
		mav.addObject("typeAppelants", typeAppelantService.recupererTypeAppelants());
		mav.addObject("pageDAppels", appelService.recupererAppels(4453));
		mav.setViewName("appels");
		return mav;
	}*/
	
	@PostMapping("/filtrer")
	public ModelAndView filtrerPost(
		 @PageableDefault(
		 		size = 10,
		 		sort = "dateHeure",
			direction = Sort.Direction.ASC
		) Pageable pageable,
		@RequestParam Map<String, String> post
	) {
		Map<String, String> map = new HashMap<>();
		// On récupère uniquement les clés/valeurs qui ne sont pas vide et égale à -1.
		for(String cle : post.keySet()) {
			if(! (post.get(cle).isEmpty()) && ! post.get(cle).equals("-1")) {
				map.put(cle, post.get(cle));
				System.out.println(cle + " : " + post.get(cle));
			}
		}
		
		System.out.println("\n\n");
		System.out.println(map);
		System.out.println("\n\n");

		ModelAndView mav = new ModelAndView();
		//mav.addObject("pageDAppels", appelService.recupererAppelsFiltrer(map, pageable));
		mav.addObject("agences", agenceService.recupererAgences());
		mav.addObject("annonces", annonceService.recupererAnnonces());
		mav.addObject("origines", origineService.recupererOrigines());
		mav.addObject("personnes", personneService.recupererPersonnes());
		mav.addObject("typeAppelants", typeAppelantService.recupererTypeAppelants());
		mav.setViewName("appels");
		return mav;
	}
}


