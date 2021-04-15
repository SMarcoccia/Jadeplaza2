package fr.clelia.jade2.service.impl;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import fr.clelia.jade2.business.Personne;
import fr.clelia.jade2.dao.PersonneDao;
import fr.clelia.jade2.service.PersonneService;


@Service
public class PersonneServiceImpl implements PersonneService {
	
	private PersonneDao personneDao;
	
	PersonneServiceImpl(PersonneDao personneDao){
		super();
		this.personneDao = personneDao;
	}
	
	@Override
	public Personne recupererPersonneParEmailEtMotDePasse(String email, String motDePasse) {
		
		return personneDao.findByEmailAndMotDePasse(email, motDePasse);
	}
	
	@Override
	public Page<Personne> recupererPersonnes(Pageable pageable){
		return personneDao.findAll(pageable);
	}
	
	@Override
	public List<Personne> recupererPersonnes(){
		return personneDao.findAll();
	}
}
