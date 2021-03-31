package fr.clelia.jade2.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import fr.clelia.jade2.business.Origine;

public interface OrigineDao extends JpaRepository<Origine, Integer> {
	
	List<Origine> recupererOrigines();
}
