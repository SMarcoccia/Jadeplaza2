package fr.clelia.jade2.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import fr.clelia.jade2.business.Origine;
import fr.clelia.jade2.dao.OrigineDao;
import fr.clelia.jade2.service.OrigineService;


@Service
public class OrigineServiceImpl implements OrigineService {
	
	private OrigineDao origineDao;

	public OrigineServiceImpl(OrigineDao origineDao) {
		super();
		this.origineDao = origineDao;
	}
	
	@Override
	public List<Origine> recupererOrigines(){
		return origineDao.findAll();
	}
}
