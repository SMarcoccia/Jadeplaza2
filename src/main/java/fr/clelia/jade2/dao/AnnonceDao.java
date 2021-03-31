package fr.clelia.jade2.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import fr.clelia.jade2.business.Annonce;

public interface AnnonceDao extends JpaRepository<Annonce, Integer> {

}
