package fr.clelia.jade2.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import fr.clelia.jade2.business.TypeAppelant;
import fr.clelia.jade2.dao.TypeAppelantDao;
import fr.clelia.jade2.service.TypeAppelantService;


@Service
public class TypeAppelantServiceImpl implements TypeAppelantService {
	
	private TypeAppelantDao typeAppelantDao;
	
	
	public TypeAppelantServiceImpl(TypeAppelantDao typeAppelantDao) {
		super();
		this.typeAppelantDao = typeAppelantDao;
	}

	@Override
	public List<TypeAppelant> recupererTypeAppelants(){
		return typeAppelantDao.findAll();
	}
}
