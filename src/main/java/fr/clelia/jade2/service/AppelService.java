package fr.clelia.jade2.service;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import fr.clelia.jade2.business.Appel;

public interface AppelService {
	
	Page<Appel> recupererMesAppels(int id, Pageable pageable);

	List<Appel> recupererAppels();
	Page<Appel> recupererAppels(Pageable pageable);
	
	Appel recupererAppelParId(Integer id);
	
	Appel ajouterAppel(Appel appel);
	
	//Page<Appel> recupererAppelsFiltrer(Map<String, String> map, Pageable pageable);
	Page<Appel> recupererAppelsFiltrer(Map<String, String> map, Pageable pageable) throws ParseException;
}
