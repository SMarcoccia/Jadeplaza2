package fr.clelia.jade2.business;

import java.io.Serializable;
import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import java.util.Date;
import java.util.List;


/**
 * The persistent class for the person database table.
 * 
 */
@Entity
@Table(name="person")
public class Personne implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="PERSONID")
	private int id;

	@NotBlank(message="Veuillez spécifier votre prénom")
    @Column(name="FIRSTNAME")
	private String prenom;
	
	@NotBlank(message="Veuillez spécifier votre nom")
    @Column(name="LASTNAME")
	private String nom;
	
	@NotBlank(message="Veuillez spécifier votre email")
	@Email(message="Merci de renseigner un email au bon format")
    @Column(name="EMAIL", unique=true)
	private String email;
	
	@Temporal(TemporalType.TIMESTAMP)
	//@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name="CREATEDON")
	private Date dateHeureCreation;
	
	@NotBlank(message="Veuillez spécifier votre nom de compte")
	@Column(name="WEBACCOUNTNAME")
	private String login;
	
	@NotBlank(message="Veuillez renseigner le mot de passe")
	@Column(name="WEBACCOUNTPASSWORD")
	private String motDePasse;
	
	@Temporal(TemporalType.TIMESTAMP)
	//@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name="WEBLASTVISIT")
	private Date dateHeureDerniereVisite;
	
	@Temporal(TemporalType.TIMESTAMP)
	//@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name="WEBACCOUNTCREATIONDATE")
	private Date dateHeureCreationCompte;

    @Column(name="NBOFLOGIN")
	private int nbDeConnexions;

	@Column(name="DELETED")
	private boolean estSupprimee;

	@NotNull(message="Veuillez spécifier vos initiales")
    @Column(name="INITIALS")
	private String initiales;

	@Column(name="ACTIVERECORD")
	private boolean estActive;

	
	
	//bi-directional many-to-one association to PhoneCall
	@OneToMany(mappedBy="negociateur")
	private List<Appel> appelsDontLaPersonneEstNegociateur;

	//bi-directional many-to-one association to PhoneCall
	@OneToMany(mappedBy="approuverPar")
	private List<Appel> appelsQuiOnEteApprouverPar;

	//bi-directional many-to-one association to PhoneCall
	@OneToMany(mappedBy="suiviPar")
	private List<Appel> appelsQuiOnEteSuiviePar;

	//bi-directional many-to-one association to PhoneCall
	@OneToMany(mappedBy="suiviPar2")
	private List<Appel> appelsQuiOnEteSuiviePar2;

	//bi-directional many-to-one association to PhoneCall
	@OneToMany(mappedBy="suiviPar3")
	private List<Appel> appelsQuiOnEteSuiviePar3;

	//bi-directional many-to-one association to PhoneCall
	@OneToMany(mappedBy="recuPar")
	private List<Appel> appelsQuiOnEteRecuPar;

	public Personne() {
		super();
	}

	public Personne(
			int id, 
			String prenom,
			String nom,
			String email,
			Date dateHeureCreation, 
			String login,
			String motDePasse, 
			Date dateHeureDerniereVisite,
			Date dateHeureCreationCompte, 
			int nbDeConnexions, 
			boolean estSupprimee,
			String initiales, 
			boolean estActive,
			List<Appel> appelsDontLaPersonneEstNegociateur,
			List<Appel> appelsQuiOnEteApprouverPar,
			List<Appel> appelsQuiOnEteSuiviePar,
			List<Appel> appelsQuiOnEteSuiviePar2,
			List<Appel> appelsQuiOnEteSuiviePar3,
			List<Appel> appelsQuiOnEteRecuPar
	) {
		super();
		this.id = id;
		this.prenom = prenom;
		this.nom = nom;
		this.email = email;
		this.dateHeureCreation = dateHeureCreation;
		this.login = login;
		this.motDePasse = motDePasse;
		this.dateHeureDerniereVisite = dateHeureDerniereVisite;
		this.dateHeureCreationCompte = dateHeureCreationCompte;
		this.nbDeConnexions = nbDeConnexions;
		this.estSupprimee = estSupprimee;
		this.initiales = initiales;
		this.estActive = estActive;
		this.appelsDontLaPersonneEstNegociateur = appelsDontLaPersonneEstNegociateur;
		this.appelsQuiOnEteApprouverPar = appelsQuiOnEteApprouverPar;
		this.appelsQuiOnEteSuiviePar = appelsQuiOnEteSuiviePar;
		this.appelsQuiOnEteSuiviePar2 = appelsQuiOnEteSuiviePar2;
		this.appelsQuiOnEteSuiviePar3 = appelsQuiOnEteSuiviePar3;
		this.appelsQuiOnEteRecuPar = appelsQuiOnEteRecuPar;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getDateHeureCreation() {
		return dateHeureCreation;
	}

	public void setDateHeureCreation(Date dateHeureCreation) {
		this.dateHeureCreation = dateHeureCreation;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getMotDePasse() {
		return motDePasse;
	}

	public void setMotDePasse(String motDePasse) {
		this.motDePasse = motDePasse;
	}

	public Date getDateHeureDerniereVisite() {
		return dateHeureDerniereVisite;
	}

	public void setDateHeureDerniereVisite(Date dateHeureDerniereVisite) {
		this.dateHeureDerniereVisite = dateHeureDerniereVisite;
	}

	public Date getDateHeureCreationCompte() {
		return dateHeureCreationCompte;
	}

	public void setDateHeureCreationCompte(Date dateHeureCreationCompte) {
		this.dateHeureCreationCompte = dateHeureCreationCompte;
	}

	public int getNbDeConnexions() {
		return nbDeConnexions;
	}

	public void setNbDeConnexions(int nbDeConnexions) {
		this.nbDeConnexions = nbDeConnexions;
	}

	public boolean isEstSupprimee() {
		return estSupprimee;
	}

	public void setEstSupprimee(boolean estSupprimee) {
		this.estSupprimee = estSupprimee;
	}

	public String getInitiales() {
		return initiales;
	}

	public void setInitiales(String initiales) {
		this.initiales = initiales;
	}

	public boolean isEstActive() {
		return estActive;
	}

	public void setEstActive(boolean estActive) {
		this.estActive = estActive;
	}

	public List<Appel> getAppelsDontLaPersonneEstNegociateur() {
		return appelsDontLaPersonneEstNegociateur;
	}

	public void setAppelsDontLaPersonneEstNegociateur(List<Appel> appelsDontLaPersonneEstNegociateur) {
		this.appelsDontLaPersonneEstNegociateur = appelsDontLaPersonneEstNegociateur;
	}

	public List<Appel> getAppelsQuiOnEteApprouverPar() {
		return appelsQuiOnEteApprouverPar;
	}

	public void setAppelsQuiOnEteApprouverPar(List<Appel> appelsQuiOnEteApprouverPar) {
		this.appelsQuiOnEteApprouverPar = appelsQuiOnEteApprouverPar;
	}

	public List<Appel> getAppelsQuiOnEteSuiviePar() {
		return appelsQuiOnEteSuiviePar;
	}

	public void setAppelsQuiOnEteSuiviePar(List<Appel> appelsQuiOnEteSuiviePar) {
		this.appelsQuiOnEteSuiviePar = appelsQuiOnEteSuiviePar;
	}

	public List<Appel> getAppelsQuiOnEteSuiviePar2() {
		return appelsQuiOnEteSuiviePar2;
	}

	public void setAppelsQuiOnEteSuiviePar2(List<Appel> appelsQuiOnEteSuiviePar2) {
		this.appelsQuiOnEteSuiviePar2 = appelsQuiOnEteSuiviePar2;
	}

	public List<Appel> getAppelsQuiOnEteSuiviePar3() {
		return appelsQuiOnEteSuiviePar3;
	}

	public void setAppelsQuiOnEteSuiviePar3(List<Appel> appelsQuiOnEteSuiviePar3) {
		this.appelsQuiOnEteSuiviePar3 = appelsQuiOnEteSuiviePar3;
	}

	public List<Appel> getAppelsQuiOnEteRecuPar() {
		return appelsQuiOnEteRecuPar;
	}

	public void setAppelsQuiOnEteRecuPar(List<Appel> appelsQuiOnEteRecuPar) {
		this.appelsQuiOnEteRecuPar = appelsQuiOnEteRecuPar;
	}

	@Override
	public String toString() {
		return "Personne [id=" + id + ", prenom=" + prenom + ", nom=" + nom + ", email=" + email
				+ ", dateHeureCreation=" + dateHeureCreation + ", login=" + login + ", motDePasse=" + motDePasse
				+ ", dateHeureDerniereVisite=" + dateHeureDerniereVisite + ", dateHeureCreationCompte="
				+ dateHeureCreationCompte + ", nbDeConnexions=" + nbDeConnexions + ", estSupprimee=" + estSupprimee
				+ ", initiales=" + initiales + ", estActive=" + estActive + ", appelsDontLaPersonneEstNegociateur="
				+ appelsDontLaPersonneEstNegociateur + ", appelsQuiOnEteApprouverPar=" + appelsQuiOnEteApprouverPar
				+ ", appelsQuiOnEteSuiviePar=" + appelsQuiOnEteSuiviePar + ", appelsQuiOnEteSuiviePar2="
				+ appelsQuiOnEteSuiviePar2 + ", appelsQuiOnEteSuiviePar3=" + appelsQuiOnEteSuiviePar3
				+ ", appelsQuiOnEteRecuPar=" + appelsQuiOnEteRecuPar + "]";
	}
	
	
}