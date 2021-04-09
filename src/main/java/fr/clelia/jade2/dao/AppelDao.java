package fr.clelia.jade2.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import fr.clelia.jade2.business.Appel;


public interface AppelDao extends JpaRepository<Appel, Integer> {
	
	final String PHONECALLID = "PHONECALLID";
		
	@Query(value="SELECT * FROM phone_call ph_c WHERE ph_c." + PHONECALLID + " = :id", nativeQuery=true)
	Appel findAppel(@Param("id") Integer id);

	@Query(value="SELECT * FROM phone_call ph WHERE ph.followedby = :id", nativeQuery=true)
	Page<Appel> findAllById(@Param("id") int id, Pageable pageable);
}

