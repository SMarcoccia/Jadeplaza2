package fr.clelia.jade2.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import fr.clelia.jade2.business.Agence;

public interface AgenceDao extends JpaRepository<Agence, Integer> {

}
