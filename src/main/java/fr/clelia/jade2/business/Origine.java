package fr.clelia.jade2.business;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the source database table.
 * 
 */
@Entity
@Table(name="source")
public class Origine implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="SOURCEID")
	private int id;

	@Column(name="DISPLAYORDER")
	private int ordreAffichage;

	@Column(name="NAME")
	private String nom;

	//bi-directional many-to-one association to PhoneCall
	@OneToMany(mappedBy="origine")
	private List<Appel> appels;

	public Origine() {
		super();
	}

	public Origine(int id) {
		super();
		this.id = id;
	}
	
	public Origine(int id, int ordreAffichage, String nom, List<Appel> appels) {
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
		return "Origine [id=" + id + ", ordreAffichage=" + ordreAffichage + ", nom=" + nom + "]";
	}

	
}