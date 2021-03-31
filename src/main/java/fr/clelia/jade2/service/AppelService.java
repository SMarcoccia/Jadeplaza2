package fr.clelia.jade2.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import fr.clelia.jade2.business.Appel;

public interface AppelService {

	List<Appel> recupererAppels();
	List<Appel> recupererAppels(Integer id);
	Page<Appel> recupererAppels(Pageable pageable);

	//Page<Appel> recupererAppelsFiltrer(Map<String, String> map, Pageable pageable);
}
