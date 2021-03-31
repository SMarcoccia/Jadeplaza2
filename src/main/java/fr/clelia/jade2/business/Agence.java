package fr.clelia.jade2.business;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the agency database table.
 * 
 */
@Entity
@Table(name="agency")
public class Agence implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="AGENCYID")
	private int id;

	@Column(name="NAME")
	private String nom;

	//bi-directional many-to-one association to PhoneCall
	@OneToMany(mappedBy="agence")
	private List<Appel> appels;


	public Agence() {
		super();
	}
	
	public Agence(int id, String nom, List<Appel> appels) {
		super();
		this.id = id;
		this.nom = nom;
		this.appels = appels;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public List<Appel> getAppels() {
		return appels;
	}

	public void setAppels(List<Appel> appels) {
		this.appels = appels;
	}

	
	@Override
	public String toString() {
		return "Agence [id=" + id + ", nom=" + nom + ", appels=" + appels + "]";
	}

	
}