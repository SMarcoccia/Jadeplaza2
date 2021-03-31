package fr.clelia.jade2.service;

import java.util.List;

import fr.clelia.jade2.business.Personne;

public interface PersonneService {

	Personne recupererPersonneParEmailEtMotDePasse(String email, String motDePasseCompteWeb);
	List<Personne> recupererPersonnes();
}
