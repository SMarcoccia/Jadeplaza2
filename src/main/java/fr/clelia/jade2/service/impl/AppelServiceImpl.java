package fr.clelia.jade2.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import fr.clelia.jade2.business.Agence;
import fr.clelia.jade2.business.Annonce;
import fr.clelia.jade2.business.Appel;
import fr.clelia.jade2.business.Origine;
import fr.clelia.jade2.business.Personne;
import fr.clelia.jade2.business.TypeAppelant;
import fr.clelia.jade2.dao.AppelDao;
import fr.clelia.jade2.service.AppelService;


@Service
public class AppelServiceImpl implements AppelService {

	private AppelDao appelDao;
	private JdbcTemplate jdbcTemplate;

	
	public AppelServiceImpl(AppelDao appelDao, JdbcOperations jdbcOperations, JdbcTemplate jdbcTemplate) {
		super();
		this.appelDao = appelDao;
		this.jdbcTemplate = jdbcTemplate;
	}
	
	
	
	@Override
	public Page<Appel> recupererMesAppels(int id, Pageable pageable){
		return appelDao.findAllById(id, pageable);
	}
	
	@Override
	public List<Appel> recupererAppels(){
		return appelDao.findAll();
	}

	@Override
	public Page<Appel> recupererAppels(Pageable pageable){
		return appelDao.findAll(pageable);
	}
	
	@Override
	public Appel ajouterAppel(Appel appel) {
		return appelDao.save(appel);
	}
	
	@Override
	public Appel recupererAppelParId(Integer id) {
		//return appelDao.findAppel(id).orElse(null);
		return appelDao.findAppel(id);
	}
	
	//////////////////////////// * POUR LA REQUËTE DU FILTRE * /////////////////////////////
	
	@Override
	public List<Appel> recupererAppelsFiltrer(Map<String, String> map){
		
        String sql = "SELECT * FROM phone_call pc WHERE ";
	
        List<Appel> appels = jdbcTemplate.query(sql = concatFiltres(map, sql), rowMapperAppels());
        
        System.out.println(sql);
        
        return appels;
	}
	
	public RowMapper<Appel> rowMapperAppels(){
		RowMapper<Appel> rowMapper = (rs, rowNum) -> {
			Appel a = new Appel();
				a.setId(rs.getInt("PHONECALLID"));
				a.setDateHeure(rs.getDate("RECEIVEDON")); //Date et Heure
				a.setAgence(new Agence(rs.getInt("AGENCYID"))); // Agence
				a.setSuiviPar(new Personne(rs.getInt("FOLLOWEDBY"))); // Destinataire
				a.setTypeAppelant(new TypeAppelant(rs.getInt("CALLERTYPEID"))); // Type d'appelant
				a.setNom(rs.getString("LASTNAME"));
				a.setPrenom(rs.getString("FIRSTNAME"));	
				a.setMobile(rs.getString("MOBILENUMBER"));	
				a.setTelephone(rs.getString("PHONENUMBER"));	
				a.setEmail(rs.getString("EMAIL"));	
				a.setObjet(rs.getString("OBJECT"));	
				a.setAnnonce(new Annonce(rs.getInt("ADVERTID"))); // Support de pub (annonce).
				a.setOrigine(new Origine(rs.getInt("SOURCEID"))); // Source (origine du contact).
				a.setTypeAppel(rs.getString("CALLTYPE")); // (Type d'appelant) Type de contact.
				a.setNomDuMandat(rs.getString("MANDATENAME"));	
				a.setRecuPar(new Personne(rs.getInt("RECEIVEDBY"))); // Saisie par (reçuPar).
				a.setEstAccuse(rs.getBoolean("ACKNOWLEDGED"));	// Vu
				a.setSuivre(rs.getString("FOLLOWUP"));	// Action / Commentaire.
				a.setEstTermine(rs.getByte("COMPLETE")); // estTerminé (traité)
				a.setLigneAdresse1(rs.getString("ADDRESSLINE1"));
				a.setCodePostal(rs.getString("POSTCODE"));
				a.setVille(rs.getString("TOWN"));
				a.setCodeCouleur(rs.getString("COLOURCODE"));
				a.setEstSupprime(rs.getBoolean("DELETED"));	
				a.setSuiviPar2(new Personne(rs.getInt("FOLLOWEDBY2")));
				a.setSuiviPar3(new Personne(rs.getInt("FOLLOWEDBY3")));
				a.setNegociateur(new Personne(rs.getInt("NEGOCIATOR")));	
				a.setApprouverPar(new Personne(rs.getInt("APPROVEDBY")));
			return a;
		};
		return rowMapper;
	}
	
	public String concatFiltres(Map<String, String> map, String sql){
		boolean lastMySelectExist = false;
		
		if(map.containsKey("mySelect1")) {
			lastMySelectExist = true;
			String lastSql = sql;
			
			if(  map.get("AV1") != null &&  map.get("AV1Bis") != null){
		        sql += "RECEIVEDON BETWEEN \"" + map.get("AV1") + "00:00:00\" AND \"" + map.get("AV1Bis") + " 23:59:59\"";
		    }
		    if(  map.get("AV2") != null){
		        sql += "AGENCYID = " + map.get("AV2");
		    }
		    if(  map.get("AV3") != null){
		        sql += "RECEIVEDBY = " + map.get("AV3");
		    }
		    if(  map.get("AV4") != null){
		        sql += "CALLERTYPEID = " + map.get("AV4");
		    }
		    if(  map.get("AV5") != null){
		        sql += "LASTNAME LIKE \"%" + map.get("AV5") + "%\" ";
		    }
		    if(  map.get("AV6") != null){
		        sql += "FIRSTNAME LIKE \"%" + map.get("AV6") + "%\" ";
		    }
		    if(  map.get("AV7") != null){
		        sql += "MOBILENUMBER LIKE \"%" + map.get("AV7") + "%\" ";
		    }
		    if(  map.get("AV8") != null){
		        sql += "PHONENUMBER LIKE \"%" + map.get("AV8") + "%\" ";
		    }
		    if(  map.get("AV9") != null){
		        sql += "EMAIL LIKE \"%" + map.get("AV9") + "%\" ";
		    }
		    if(  map.get("AV10") != null){
		        sql += "OBJECT LIKE \"%" + map.get("AV10") + "%\" ";
		    }
		    if(  map.get("AV11") != null){
		        sql += "ADVERTID = " + map.get("AV11");
		    }
		    if(  map.get("AV12") != null){
		        sql += "SOURCEID = " + map.get("AV12");
		    }
		    if(  map.get("AV14") != null){
		        sql += "MANDATENAME LIKE \"%" + map.get("AV14") + "%\" ";
		    }
		    if(  map.get("AV15") != null){
		        sql += "RECEIVEDBY = " + map.get("AV15");
		    }
		    if(  map.get("AV16") != null){
		        sql += "ACKNOWLEDGED = " + map.get("AV16");
		    }
		    if(  map.get("AV17") != null){
		        sql += "FOLLOWUP LIKE \"%" + map.get("AV17") + "%\" ";
		    }
		    
		    if(sql.equals(lastSql))
		    	lastMySelectExist = false;
		}

	    // DEBUT FILTRE B
		if(map.containsKey("mySelect2")) {
			if(lastMySelectExist) {
				if( ! map.get("CP").equals("3"))
					sql += " AND ";
				else
					sql += " OR ";
			}
			
			String lastSql = sql;
			
			if( map.get("BV1") != null &&  map.get("BV1Bis") != null){
		        sql += "RECEIVEDON BETWEEN \"" + map.get("BV1") + "00:00:00\" AND \"" + map.get("BV1Bis") + " 23:59:59\"";	
		    }
		    if(  map.get("BV2") != null){
		        sql += "AGENCYID = " + map.get("BV2");
		    }
		    if(  map.get("BV3") != null){
		        sql += "RECEIVEDBY = " + map.get("BV3");
		    }
		    if(  map.get("BV4") != null){
		        sql += "CALLERTYPEID = " + map.get("BV4");
		    }
		    if(  map.get("BV5") != null){
		        sql += "LASTNAME LIKE \"%" + map.get("BV5") + "%\" ";
		    }
		    if(  map.get("BV6") != null){
		        sql += "FIRSTNAME LIKE \"%" + map.get("BV6") + "%\" ";
		    }
		    if(  map.get("BV7") != null){
		        sql += "MOBILENUMBER LIKE \"%" + map.get("BV7") + "%\" ";
		    }
		    if(  map.get("BV8") != null){
		        sql += "PHONENUMBER LIKE \"%" + map.get("BV8") + "%\" ";
		    }
		    if(  map.get("BV9") != null){
		        sql += "EMAIL LIKE \"%" + map.get("BV9") + "%\" ";
		    }
		    if(  map.get("BV10") != null){
		        sql += "OBJECT LIKE \"%" + map.get("BV10") + "%\" ";
		    }
		    if(  map.get("BV11") != null){
		        sql += "ADVERTID = " + map.get("BV11");
		    }
		    if(  map.get("BV12") != null){
		        sql += "SOURCEID = " + map.get("BV12");
		    }
		    if(  map.get("BV14") != null){
		        sql += "MANDATENAME LIKE \"%" + map.get("BV14") + "%\" ";
		    }
		    if(  map.get("BV15") != null){
		        sql += "RECEIVEDBY = " + map.get("BV15");
		    }
		    if(  map.get("BV16") != null){
		        sql += "ACKNOWLEDGED = " + map.get("BV16");
		    }
		    if(  map.get("BV17") != null){
		        sql += "FOLLOWUP LIKE \"%" + map.get("BV17") + "%\" ";
		    }

		    if(sql.equals(lastSql)) {
		    	if(lastMySelectExist) {
			    	if(sql.substring(sql.lastIndexOf(" ") + 1) == " AND ")
			    		sql.replace(" AND ", "");	
			    	else if(sql.substring(sql.lastIndexOf(" ") + 1) == " OR ")
			    		sql.replace(" OR ", "");		    		
		    	}
		    	lastMySelectExist = false;
		    } 
		    else
		    	lastMySelectExist = true;
		}

	    // DEBUT FILTRE C
		if(map.containsKey("mySelect3")) {
			if(lastMySelectExist) {
				if(map.get("CP") != "3")
					sql += " AND ";
				else
					sql += " OR ";
			}
			
			String lastSql = sql;
			
		    if( map.get("CV1") != null &&  map.get("CV1Bis") != null){
		        sql += "RECEIVEDON BETWEEN \"" + map.get("CV1") + "00:00:00\" AND \"" + map.get("CV1Bis") + " 23:59:59\"";	
		    }
		    if(  map.get("CV2") != null){
		        sql += "AGENCYID = " + map.get("CV2");
		    }
		    if(  map.get("CV3") != null){
		        sql += "RECEIVEDBY = " + map.get("CV3");
		    }
		    if(  map.get("CV4") != null){
		        sql += "CALLERTYPEID = " + map.get("CV4");
		    }
		    if(  map.get("CV5") != null){
		        sql += "LASTNAME LIKE \"%" + map.get("CV5") + "%\" ";
		    }
		    if(  map.get("CV6") != null){
		        sql += "FIRSTNAME LIKE \"%" + map.get("CV6") + "%\" ";
		    }
		    if(  map.get("CV7") != null){
		        sql += "MOBILENUMBER LIKE \"%" + map.get("CV7") + "%\" ";
		    }
		    if(  map.get("CV8") != null){
		        sql += "PHONENUMBER LIKE \"%" + map.get("CV8") + "%\" ";
		    }
		    if(  map.get("CV9") != null){
		        sql += "EMAIL LIKE \"%" + map.get("CV9") + "%\" ";
		    }
		    if(  map.get("CV10") != null){
		        sql += "OBJECT LIKE \"%" + map.get("CV10") + "%\" ";
		    }
		    if(  map.get("CV11") != null){
		        sql += "ADVERTID = " + map.get("CV11");
		    }
		    if(  map.get("CV12") != null){
		        sql += "SOURCEID = " + map.get("CV12");
		    }
		    if(  map.get("CV14") != null){
		        sql += "MANDATENAME LIKE \"%" + map.get("CV14") + "%\" ";
		    }
		    if(  map.get("CV15") != null){
		        sql += "RECEIVEDBY = " + map.get("CV15");
		    }
		    if(  map.get("CV16") != null){
		        sql += "ACKNOWLEDGED = " + map.get("CV16");
		    }
		    if(  map.get("CV17") != null){
		        sql += "FOLLOWUP LIKE \"%" + map.get("CV17") + "%\" ";
		    }
			
		    if(sql.equals(lastSql)) {
		    	if(lastMySelectExist) {
			    	if(sql.substring(sql.lastIndexOf(" ") + 1) == " AND ")
			    		sql.replace(" AND ", "");	
			    	else if(sql.substring(sql.lastIndexOf(" ") + 1) == " OR ")
			    		sql.replace(" OR ", "");		    		
		    	}
		    	lastMySelectExist = false;
		    }
		    else
		    	lastMySelectExist = true;
		}

		if( ! map.get("CP").equals("3"))
		{
			if(lastMySelectExist) {
				sql += " AND ";
			}
			sql += " COMPLETE = " + map.get("CP");
		} 
		else {
			String str = "";
			if( ! lastMySelectExist) {
				sql = sql.replace(sql.substring(sql.lastIndexOf("WHERE")), str);
	    	}				
		}
		
        return sql;
    }        
}
