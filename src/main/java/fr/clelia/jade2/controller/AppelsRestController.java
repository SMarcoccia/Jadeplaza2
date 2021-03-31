package fr.clelia.jade2.controller;

import org.springframework.stereotype.Controller;

import fr.clelia.jade2.service.AppelService;

@Controller
public class AppelsRestController {
	
	private AppelService appelService;

	public AppelsRestController(AppelService appelService) {
		super();
		this.appelService = appelService;
	}
	
	/*
	@GetMapping(value="/appels")
	public List<Appel> listeDesAppelsGet(){
		List<Appel> appels = appelService.recupererAppels();
		return appels;
	}*/
}
