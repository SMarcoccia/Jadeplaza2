package fr.clelia.jade2.service.impl;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import fr.clelia.jade2.business.Appel;
import fr.clelia.jade2.dao.AppelDao;
import fr.clelia.jade2.service.AppelService;


@Service
public class AppelServiceImpl implements AppelService {

	private AppelDao appelDao;

	
	public AppelServiceImpl(AppelDao appelDao) {
		super();
		this.appelDao = appelDao;
	}

	@Override
	public List<Appel> recupererAppels(){
		return appelDao.findAll();
	}

	@Override
	public List<Appel> recupererAppels(Integer id){
		System.out.println(appelDao.findAppels(id));
		return appelDao.findAppels(id);
	}
	
	@Override
	public Page<Appel> recupererAppels(Pageable pageable){
		return appelDao.findAll(pageable);
	}
	
	
	/*
	@Override
	public Page<Appel> recupererAppelsFiltrer(Map<String, String> map, Pageable pageable){
		String[] cles; 
		int i = 0;
		
		for(String cle: map.keySet()) {
			cles[i++] = cle;
		}
		
		testClesNomDesTables();
		return appelDao.findAppelsFiltrer(map);
	}
	
where
	PHONECALLID = 1
	NEGOCIATOR
	AGENCYID
	APPROVEDBY
	FOLLOWEDBY	
	FOLLOWEDBY2	
	FOLLOWEDBY3	
	RECEIVEDBY	
	RECEIVEDON	BETWEEN vari- av1 qui vaudra la date et av1bis
	FIRSTNAME	
	LASTNAME	
	MOBILENUMBER	
	PHONENUMBER	
	EMAIL	
	SOURCE	
	OBJECT	
	MANDATENAME	
	FOLLOWUP	
	CALLTYPE	
	ADDRESSLINE1	
	POSTCODE	
	TOWN	
	COLOURCODE	
	ACKNOWLEDGED	
	DELETED	
	COMPLETE	
	CALLERTYPE	
	ADVERT
			
	
		
	
	public String[] testClesNomDesTables(Map<String, String> map, String[] cles) {
		for(int i = 0; i < cles.length; i++) {
			// Pour avoir la bonne colonne.
			if("CP" == cles[i]) {
				COMPLETE=
			}
			if("AV1" == cles[i] || "AV1Bis" == cles[i]) {
				DATE1 DATE2 RECEIVEDON
				"DATE1=" + map.get(cles[i]);
			}
			if()
			{
			  AGENCE AV2 
			}

			if(3)
			{
			  DEST AV3
			}

			if(4)
			{
			  CALLERTYPE AV4 
			}

			if(5)
			{
			  LASTNAME AV5
			}

			if(6)
			{
			  FIRSTNAME AV6
			}

			if(7)
			{
			  MOBILENUMBER AV7
			}

			if(8)
			{
			  PHONENUMBER AV8
			}

			if(9)
			{
			  EMAIL AV9
			}

			if(10)
			{
			  OBJECT AV10

			}

			if(11)
			{
			  ADVERT AV11 
			}

			if(12)
			{
			  SOURCE AV12 

			}

			if(14)
			{
			  MANDATENAME AV14
			}

			if(15)
			{
			  RECEIVEDBY AV15 
			}

			if(16)
			{
				ACKNOWLEDGED AV16  
			}

			if(17)
			{
				FOLLOWUP AV17
			 
			}
		}
	}*/
}
