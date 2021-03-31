package fr.clelia.jade2.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import fr.clelia.jade2.business.Annonce;
import fr.clelia.jade2.dao.AnnonceDao;
import fr.clelia.jade2.service.AnnonceService;


@Service
public class AnnonceServiceImpl implements AnnonceService {
	
	private AnnonceDao annonceDao;

	public AnnonceServiceImpl(AnnonceDao annonceDao) {
		super();
		this.annonceDao = annonceDao;
	}
	
	@Override
	public List<Annonce> recupererAnnonces(){
		return annonceDao.findAll();
	}
}
