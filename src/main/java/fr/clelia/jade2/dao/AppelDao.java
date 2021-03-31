package fr.clelia.jade2.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import fr.clelia.jade2.business.Appel;

public interface AppelDao extends JpaRepository<Appel, Integer> {

	@Query(value="SELECT * FROM phone_call ph_c WHERE ph_c.PHONECALLID = :id", nativeQuery=true)
	List<Appel> findAppels(@Param("id") Integer id);
		
	//List<Appel> findAppelsFiltrer();
}
