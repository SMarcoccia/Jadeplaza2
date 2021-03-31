package fr.clelia.jade2.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import fr.clelia.jade2.business.Personne;



public interface PersonneDao extends JpaRepository<Personne, Integer> {
	
	Personne findByEmailAndMotDePasse(String email, String motDePasseCompteWeb);
}
