package fr.clelia.jade2.business;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the caller_type database table.
 * 
 */
@Entity
@Table(name="caller_type")
public class TypeAppelant implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="CALLERTYPEID")
	private int id;

	@Column(name="DISPLAYORDER")
	private int ordreAffichage;
	
	@Column(name="NAME")
	private String nom;

	@OneToMany(mappedBy="typeAppelant")
	private List<Appel> appels;


	
	public TypeAppelant() {
		super();
	}

	public TypeAppelant(int id, int ordreAffichage, String nom, List<Appel> appels) {
		super();
		this.id = id;
		this.ordreAffichage = ordreAffichage;
		this.nom = nom;
		this.appels = appels;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getOrdreAffichage() {
		return ordreAffichage;
	}

	public void setOrdreAffichage(int ordreAffichage) {
		this.ordreAffichage = ordreAffichage;
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
		return "TypeAppelant [id=" + id + ", ordreAffichage=" + ordreAffichage + ", nom=" + nom + ", appels=" + appels
				+ "]";
	}
	
	
}