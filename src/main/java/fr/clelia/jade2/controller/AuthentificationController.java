package fr.clelia.jade2.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import fr.clelia.jade2.business.Personne;
import fr.clelia.jade2.service.PersonneService;

@Controller
public class AuthentificationController {
	
	private HttpSession httpSession; 
	private PersonneService personneService;
	
	public AuthentificationController(
		HttpSession httpSession,
		PersonneService personneService
	) {
		super();
		this.httpSession = httpSession;
		this.personneService = personneService;
	}
	
	
	@GetMapping({"connexion", "/"})
	public ModelAndView connectionGet() {
		return new ModelAndView("connexion");
	}
	
	@PostMapping("connexion")
	public ModelAndView connectionPost(
		@RequestParam("email") String email,
		@RequestParam("motDePasse") String motDePasse
	) {
		Personne personne = personneService.recupererPersonneParEmailEtMotDePasse(email, motDePasse);
		if(personne != null) {
			httpSession.setAttribute("personne", personne);	
			return new ModelAndView("redirect:/appels");	
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
		return new ModelAndView("redirect:connexion");
	}
}
