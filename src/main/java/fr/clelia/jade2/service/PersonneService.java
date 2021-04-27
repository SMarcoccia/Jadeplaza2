package fr.clelia.jade2.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import fr.clelia.jade2.business.Personne;

public interface PersonneService {

	Personne recupererPersonneParEmailEtMotDePasse(String email, String motDePasseCompteWeb);
	List<Personne> recupererPersonnes();
	Page<Personne> recupererPersonnes(Pageable pageable);
	
	Personne recupererPersonneParId(int id);
	
	Personne ajouterPersonne(Personne personne );
}
