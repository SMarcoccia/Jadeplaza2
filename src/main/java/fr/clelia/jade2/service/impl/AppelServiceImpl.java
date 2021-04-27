package fr.clelia.jade2.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.query.QueryUtils;
import org.springframework.stereotype.Service;

import fr.clelia.jade2.business.Appel;
import fr.clelia.jade2.dao.AppelDao;
import fr.clelia.jade2.service.AppelService;


@Service
public class AppelServiceImpl implements AppelService {

	private final int MAX_RESULT_FILTRE = 20;
	private AppelDao appelDao;

	@PersistenceContext
	private EntityManager em;
	
	public AppelServiceImpl(
		AppelDao appelDao
	) {
		super();
		this.appelDao = appelDao;
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
	public Appel modifierAppel(Appel appel) {
		return appelDao.save(appel);
	}
		
	@Override
	public Appel ajouterAppel(Appel appel) {
		return appelDao.save(appel);
	}
	
	@Override
	public Appel recupererAppelParId(int id) {
		return appelDao.findById(id);
		//return appelDao.findAppel(id).orElse(null);
		//return appelDao.findAppel(id);
	}
	
	//////////////////////////// * POUR LA REQUËTE DU FILTRE * /////////////////////////////
	
	@Override
	public Page<Appel> recupererAppelsFiltrer(Map<String, String> map, Pageable pageable) throws ParseException{
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<Appel> cq = cb.createQuery(Appel.class);
		Root<Appel> appel = cq.from(Appel.class);
		List<Predicate> predicates = new ArrayList<Predicate>();
		
		cq.select(appel).where(ajouterFiltres(map, appel, predicates, cb).toArray(new Predicate[]{}));
		cq.orderBy(QueryUtils.toOrders(pageable.getSort(), appel, cb));
		TypedQuery<Appel> q = em.createQuery(cq);
		List<Appel> appels = q.getResultList();
		int nbTotalDAppels = appels.size();
		System.out.println(nbTotalDAppels);
		
		Long offset = pageable.getOffset();
		q.setFirstResult(offset.intValue());
		q.setMaxResults(MAX_RESULT_FILTRE);

		appels = q.getResultList();
		
		return new PageImpl<>(appels, pageable, nbTotalDAppels);
	}
		
	private List<Predicate> ajouterFiltres(Map<String, String> map, Root<Appel> appel, List<Predicate> predicates, CriteriaBuilder cb) throws ParseException{
		// DEBUT FILTRE A.
		if(map.containsKey("mySelect1")) {
			
		    if(  map.get("AV1") != null &&  map.get("AV1Bis") != null){
	
		        predicates.add(
	        		cb.between(appel.get("dateHeure"), 
    				new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(map.get("AV1")+" 00:00:00"), 
    				new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(map.get("AV1Bis") + " 23:59:59"))
	        	);
		    }
		    if(  map.get("AV2") != null){
		        predicates.add(cb.equal(appel.get("agence"), Integer.parseInt(map.get("AV2"))));
		    }	    	// Note the parse method throws an exception if it fails so we have to throw it. 
		    if(  map.get("AV3") != null){
		        predicates.add(cb.equal(appel.get("suiviPar"), Integer.parseInt(map.get("AV3"))));
		    }
		    if(  map.get("AV4") != null){
		        predicates.add(cb.equal(appel.get("typeAppelant"), Integer.parseInt(map.get("AV4"))));
		    }
		    if(  map.get("AV5") != null){
		        predicates.add(cb.like(appel.get("nom"), map.get("AV5")));
		    }
		    if(  map.get("AV6") != null){
		        predicates.add(cb.like(appel.get("prenom"), map.get("AV6")));
		    }
		    if(  map.get("AV7") != null){
		        predicates.add(cb.like(appel.get("mobile"), map.get("AV7")));
		    }
		    if(  map.get("AV8") != null){
		        predicates.add(cb.like(appel.get("telephone"), map.get("AV8")));
		    }
		    if(  map.get("AV9") != null){
		        predicates.add(cb.like(appel.get("email"), map.get("AV9")));
		    }
		    if(  map.get("AV10") != null){
		        predicates.add(cb.like(appel.get("objet"), map.get("AV10")));
		    }
		    if(  map.get("AV11") != null){
		        predicates.add(cb.equal(appel.get("annonce"), Integer.parseInt(map.get("AV11"))));
		    }
		    if(  map.get("AV12") != null){
		        predicates.add(cb.equal(appel.get("origine"), Integer.parseInt(map.get("AV12"))));
		    }
		    if(  map.get("AV14") != null){
		        predicates.add(cb.like(appel.get("nomDuMandat"), map.get("AV14")));
		    }
		    if(  map.get("AV15") != null){
		        predicates.add(cb.equal(appel.get("recuPar"), Integer.parseInt(map.get("AV15"))));
		    }
		    if(  map.get("AV16") != null){
		        predicates.add(cb.equal(appel.get("estAccuse"), 1));
		    }
		    if(  map.get("AV17") != null){
		        predicates.add(cb.like(appel.get("suivre"), map.get("AV17")));
		    }
		}
	
		// DEBUT FILTRE B
		System.out.println("\n\n");
    	System.out.println("mySelect2 : " + map.get("mySelect2"));
    	System.out.println("\n\n");
		if(map.containsKey("mySelect2")) {
		    if(  map.get("BV1") != null &&  map.get("BV1Bis") != null){
		    	predicates.add(cb.between(appel.get("dateHeure"),
	    				new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(map.get("BV1")+" 00:00:00"), 
	    				new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(map.get("BV1Bis") + " 23:59:59")));
		      //predicates.add(cb.between(appel.get("dateHeure"), map.get("AV1"), map.get("AV1Bis"))); //Génère une erreur de type format.
		    }
		    if(  map.get("BV2") != null){
		        predicates.add(cb.equal(appel.get("agence"), Integer.parseInt(map.get("BV2"))));
		    }
		    if(  map.get("BV3") != null){
		        predicates.add(cb.equal(appel.get("suiviPar"),  Integer.parseInt(map.get("BV3"))));
		    }
		    if(  map.get("BV4") != null){
		        predicates.add(cb.equal(appel.get("typeAppelant"),  Integer.parseInt(map.get("BV4"))));
		    }
		    if(  map.get("BV5") != null){
		        predicates.add(cb.like(appel.get("nom"), map.get("BV5")));
		    }
		    if(  map.get("BV6") != null){
		        predicates.add(cb.like(appel.get("prenom"), map.get("BV6")));
		    }
		    if(  map.get("BV7") != null){
		        predicates.add(cb.like(appel.get("mobile"), map.get("BV7")));
		    }
		    if(  map.get("BV8") != null){
		        predicates.add(cb.like(appel.get("telephone"), map.get("BV8")));
		    }
		    if(  map.get("BV9") != null){
		        predicates.add(cb.like(appel.get("email"), map.get("BV9")));
		    }
		    if(  map.get("BV10") != null){
		        predicates.add(cb.like(appel.get("objet"), map.get("BV10")));
		    }
		    if(  map.get("BV11") != null){
		        predicates.add(cb.equal(appel.get("annonce"), Integer.parseInt(map.get("BV11"))));
		    }
		    if(  map.get("BV12") != null){
		        predicates.add(cb.equal(appel.get("origine"), Integer.parseInt(map.get("BV12"))));
		    }
		    if(  map.get("BV14") != null){
		        predicates.add(cb.like(appel.get("nomDuMandat"), map.get("BV14")));
		    }
		    if(  map.get("BV15") != null){
		        predicates.add(cb.equal(appel.get("recuPar"), Integer.parseInt(map.get("BV15"))));
		    }
		    if(  map.get("BV16") != null){
		        predicates.add(cb.equal(appel.get("estAccuse"), 1));
		    }
		    if(  map.get("BV17") != null){
		        predicates.add(cb.like(appel.get("suivre"), map.get("BV17")));
		    }
		}
	
		// DEBUT FILTRE C
		System.out.println("\n\n");
    	System.out.println("mySelect3 : " + map.get("mySelect3"));
    	System.out.println("\n\n");
		if(map.containsKey("mySelect3")) {
		    if(  map.get("CV1") != null &&  map.get("CV1Bis") != null){
		        predicates.add(cb.between(appel.get("dateHeure"), 
	    			new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(map.get("CV1")+" 00:00:00"), 
	    			new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(map.get("CV1Bis") + " 23:59:59"))
		        );
		    }
		    if(  map.get("CV2") != null){
		        predicates.add(cb.equal(appel.get("agence"), Integer.parseInt(map.get("CV2"))));
		    }
		    if(  map.get("CV3") != null){
		        predicates.add(cb.equal(appel.get("suiviPar"), Integer.parseInt(map.get("CV3"))));
		    }
		    if(  map.get("CV4") != null){
		        predicates.add(cb.equal(appel.get("typeAppelant"), Integer.parseInt(map.get("CV4"))));
		    }
		    if(  map.get("CV5") != null){
		        predicates.add(cb.like(appel.get("nom"), map.get("CV5")));
		    }
		    if(  map.get("CV6") != null){
		        predicates.add(cb.like(appel.get("prenom"), map.get("CV6")));
		    }
		    if(  map.get("CV7") != null){
		        predicates.add(cb.like(appel.get("mobile"), map.get("CV7")));
		    }
		    if(  map.get("CV8") != null){
		        predicates.add(cb.like(appel.get("telephone"), map.get("CV8")));
		    }
		    if(  map.get("CV9") != null){
		        predicates.add(cb.like(appel.get("email"), map.get("CV9")));
		    }
		    if(  map.get("CV10") != null){
		        predicates.add(cb.like(appel.get("objet"), map.get("CV10")));
		    }
		    if(  map.get("CV11") != null){
		        predicates.add(cb.equal(appel.get("annonce"), Integer.parseInt(map.get("CV11"))));
		    }
		    if(  map.get("CV12") != null){
		        predicates.add(cb.equal(appel.get("origine"), Integer.parseInt(map.get("CV12"))));
		    }
		    if(  map.get("CV14") != null){
		        predicates.add(cb.like(appel.get("nomDuMandat"), map.get("CV14")));
		    }
		    if(  map.get("CV15") != null){
		        predicates.add(cb.equal(appel.get("recuPar"), Integer.parseInt(map.get("CV15"))));
		    }
		    if(  map.get("CV16") != null){
		        predicates.add(cb.equal(appel.get("estAccuse"), 1));
		    }
		    if(  map.get("CV17") != null){
		        predicates.add(cb.like(appel.get("suivre"), map.get("CV17")));
		    }
		}
		if(map.get("CP") != null && ! map.get("CP").equals("3")) {
			predicates.add(cb.equal(appel.get("estTermine"), map.get("CP")));			
		}
		
		return predicates;
	}

	/*
	@Override
	public Page<Appel> recupererAppelsFiltrer(Map<String, String> map, Pageable pageable){
		
        String sql = "SELECT * FROM phone_call pc WHERE ";
	
        List<Appel> appels = jdbcTemplate.query(sql = concatFiltres(map, sql, pageable), rowMapperAppels());
        System.out.println("\n\n");
        System.out.println(sql);
        System.out.println("\n\n");
        
        return new PageImpl<>(appels, pageable, count());
	}

	public int count() {
		// Pas bon si on change de bdd ex. PostGR marchera plus.
		return jdbcTemplate.queryForObject("SELECT count(*) FROM phone_call", Integer.class);
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
	
	public String concatFiltres(Map<String, String> map, String sql, Pageable pageable){
		boolean lastMySelectExist = false;
		
		if(map.containsKey("mySelect1")) {
			lastMySelectExist = true;
			String lastSql = sql;
			
			if(  map.get("AV1") != null &&  map.get("AV1Bis") != null){
		        sql += "RECEIVEDON BETWEEN \"" + map.get("AV1") + " 00:00:00\" AND \"" + map.get("AV1Bis") + " 23:59:59\"";
		    }
		    if(  map.get("AV2") != null){
		        sql += "AGENCYID = " + map.get("AV2");
		    }
		    if(  map.get("AV3") != null){
		        sql += "FOLLOWEDBY = " + map.get("AV3");
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
		        sql += "FOLLOWEDBY = " + map.get("BV3");
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
		        sql += "FOLLOWEDBY = " + map.get("CV3");
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
		
        return sql + " LIMIT " + pageable.getPageSize() + " " + "OFFSET " + pageable.getOffset();
    }     */   
}
