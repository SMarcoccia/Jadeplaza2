package fr.clelia.jade2.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import fr.clelia.jade2.business.Agence;
import fr.clelia.jade2.dao.AgenceDao;
import fr.clelia.jade2.service.AgenceService;


@Service
public class AgenceServiceImpl implements AgenceService {
	
	private AgenceDao agenceDao;

	public AgenceServiceImpl(AgenceDao agenceDao) {
		super();
		this.agenceDao = agenceDao;
	}
	
	@Override
	public List<Agence> recupererAgences(){
		return agenceDao.findAll();
	}
}
