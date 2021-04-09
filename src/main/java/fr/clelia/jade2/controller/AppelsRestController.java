package fr.clelia.jade2.controller;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import fr.clelia.jade2.business.Appel;
import fr.clelia.jade2.service.AppelService;

@RestController
public class AppelsRestController {
	
	private HttpSession httpSession;
	private AppelService appelService;

	public AppelsRestController(HttpSession httpSession, AppelService appelService) {
		super();
		this.httpSession = httpSession;
		this.appelService = appelService;
	}
	
	/*
	@GetMapping(value="/appels")
	public List<Appel> listeDesAppelsGet(){
		List<Appel> appels = appelService.recupererAppels();
		return appels;
	}*/
	
	/*
	@GetMapping(value="/ajouter-un-appel/{id}")
	public Appel appelGet(
		@PathVariable String id
	) {
		if(httpSession.getAttribute("personne") != null) {
			Appel appel = appelService.recupererAppelParId(Integer.parseInt(id));
			return appel;
		}
		return null;
	}*/
}
