package fr.clelia.jade2.business;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;


/**
 * The persistent class for the phone_call database table.
 * 
 */
@Entity
@Table(name="phone_call")
public class Appel implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="PHONECALLID")
	private int id;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="RECEIVEDON")
	//@NotNull(message="Merci de renseigner une date")
	private Date dateHeure;
	
	//@NotNull(message="Veuillez specifier votre nom")
	@Column(name="LASTNAME")
	private String nom;
	
	//@NotNull(message="Veuillez specifier votre prénom")
	@Column(name="FIRSTNAME")
	private String prenom;
	
	//@NotNull(message="Veuillez specifier le numéro de mobile")
	@Column(name="MOBILENUMBER")
	private String mobile;
	
	@Column(name="PHONENUMBER")
	private String telephone;
	
	//@NotNull(message="Veuillez specifier votre email")
	@Email(message="Merci de renseigner un email au bon format")
	@Column(name="EMAIL", unique=true)
	private String email;
	
	@Lob
	//@Size(min=6, message="Veuillez entrer un message d'au moins 6 caractères")
	//@NotNull(message="Veuillez specifier l'objet de l'appel")
	@Column(name="OBJECT")
	private String objet;
	
	//@NotNull(message="Veuillez specifier le nom du mandat")
	@Column(name="MANDATENAME")
	private String nomDuMandat;
	
	@Lob
	//@Size(min=3, message="Veuillez entrer un message d'au moins 3 caractères")
	@Column(name="FOLLOWUP")
	private String suivre;
	
	//@NotNull(message="Veuillez specifier votre adresse")
	@Column(name="ADDRESSLINE1")
	private String ligneAdresse1;

	//@Length(min=5, max=5, message="Le code postal doit contenir 5 chiffres")
	//@NotNull(message="Veuillez specifier votre code postal")
	@Column(name="POSTCODE")
	private String codePostal;
	
	//@NotNull(message="Veuillez specifier votre ville")
	@Column(name="TOWN")
	private String ville;
	
	//@NotNull(message="Veuillez specifier un code couleur")
	@Column(name="COLOURCODE")
	private String codeCouleur;
	
	@Column(name="ACKNOWLEDGED")
	private boolean estAccuse;
	
	@Column(name="DELETED")
	private boolean estSupprime;
	
	@Column(name="COMPLETE")
	private byte estTermine;
	
	//@NotNull(message="Veuillez specifier le type d'appel")
	@Column(name="CALLTYPE")
	private String typeAppel;

	
	/*---- RELATION ----*/
	//bi-directional many-to-one association to Advert
	@ManyToOne
	@JoinColumn(name="ADVERTID")
	private Annonce annonce;

	//bi-directional many-to-one association to Agency
	@ManyToOne
	@JoinColumn(name="AGENCYID")
	@NotNull(message="Veuillez renseigner une agence")
	private Agence agence;

	//bi-directional many-to-one association to CallerType
	@ManyToOne
	@JoinColumn(name="CALLERTYPEID")
	//@NotNull(message="Veuillez renseigner le type d'appelant")
	private TypeAppelant typeAppelant;

	//bi-directional many-to-one association to Source
	@ManyToOne
	@JoinColumn(name="SOURCEID")
	private Origine origine;

	
	/* ---- RELATION AVEC PERSONNE ---- */

	//bi-directional many-to-one association to Personne
	@ManyToOne
	@JoinColumn(name="NEGOCIATOR")
	private Personne negociateur;
	
	//bi-directional many-to-one association to Person
	@ManyToOne
	@JoinColumn(name="APPROVEDBY")
	private Personne approuverPar;

	//bi-directional many-to-one association to Personne
	@ManyToOne
	@JoinColumn(name="FOLLOWEDBY")
	private Personne suiviPar;
	
	//bi-directional many-to-one association to Personne
	@ManyToOne
	@JoinColumn(name="FOLLOWEDBY2")
	private Personne suiviPar2;

	//bi-directional many-to-one association to Personne
	@ManyToOne
	@JoinColumn(name="FOLLOWEDBY3")
	private Personne suiviPar3;

	//bi-directional many-to-one association to Personne
	@ManyToOne
	@JoinColumn(name="RECEIVEDBY")
	@NotNull(message="Veuillez renseigner la personne qui à reçu l'appel")
	private Personne recuPar;

	
	
	public Appel() {
		super();
	}
	
	public Appel(int id) {
		super();
		this.id = id;
	}

	public Appel(
			Personne suiviPar 
	) {
		super();
		this.suiviPar = suiviPar;
	}
	
	public Appel(
			int id, 
			Date dateHeure, 
			String nom,
			String prenom,
			String mobile, 
			String telephone,
			String email,
			String objet,
			String nomDuMandat,
			String suivre,
			String ligneAdresse1,
			String codePostal,
			String ville,
			String codeCouleur, 
			boolean estAccuse,
			boolean estSupprime, 
			byte estTermine,
			String typeAppel, 
			Annonce annonce,
			Agence agence,
			TypeAppelant typeAppelant, 
			Origine origine,
			Personne negociateur, 
			Personne approuverPar, 
			Personne suiviPar, 
			Personne suiviPar2, 
			Personne suiviPar3,
			Personne recuPar
	) {
		super();
		this.id = id;
		this.dateHeure = dateHeure;
		this.nom = nom;
		this.prenom = prenom;
		this.mobile = mobile;
		this.telephone = telephone;
		this.email = email;
		this.objet = objet;
		this.nomDuMandat = nomDuMandat;
		this.suivre = suivre;
		this.ligneAdresse1 = ligneAdresse1;
		this.codePostal = codePostal;
		this.ville = ville;
		this.codeCouleur = codeCouleur;
		this.estAccuse = estAccuse;
		this.estSupprime = estSupprime;
		this.estTermine = estTermine;
		this.typeAppel = typeAppel;
		this.annonce = annonce;
		this.agence = agence;
		this.typeAppelant = typeAppelant;
		this.origine = origine;
		this.negociateur = negociateur;
		this.approuverPar = approuverPar;
		this.suiviPar = suiviPar;
		this.suiviPar2 = suiviPar2;
		this.suiviPar3 = suiviPar3;
		this.recuPar = recuPar;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getDateHeure() {
		return dateHeure;
	}

	public void setDateHeure(Date dateHeure) {
		this.dateHeure = dateHeure;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getObjet() {
		return objet;
	}

	public void setObjet(String objet) {
		this.objet = objet;
	}

	public String getNomDuMandat() {
		return nomDuMandat;
	}

	public void setNomDuMandat(String nomDuMandat) {
		this.nomDuMandat = nomDuMandat;
	}

	public String getSuivre() {
		return suivre;
	}

	public void setSuivre(String suivre) {
		this.suivre = suivre;
	}

	public String getLigneAdresse1() {
		return ligneAdresse1;
	}

	public void setLigneAdresse1(String ligneAdresse1) {
		this.ligneAdresse1 = ligneAdresse1;
	}

	public String getCodePostal() {
		return codePostal;
	}

	public void setCodePostal(String codePostal) {
		this.codePostal = codePostal;
	}

	public String getVille() {
		return ville;
	}

	public void setVille(String ville) {
		this.ville = ville;
	}

	public String getCodeCouleur() {
		return codeCouleur;
	}

	public void setCodeCouleur(String codeCouleur) {
		this.codeCouleur = codeCouleur;
	}

	public boolean isEstAccuse() {
		return estAccuse;
	}

	public void setEstAccuse(boolean estAccuse) {
		this.estAccuse = estAccuse;
	}

	public boolean isEstSupprime() {
		return estSupprime;
	}

	public void setEstSupprime(boolean estSupprime) {
		this.estSupprime = estSupprime;
	}

	public byte getEstTermine() {
		return estTermine;
	}

	public void setEstTermine(byte estTermine) {
		this.estTermine = estTermine;
	}

	public String getTypeAppel() {
		return typeAppel;
	}

	public void setTypeAppel(String typeAppel) {
		this.typeAppel = typeAppel;
	}

	public Annonce getAnnonce() {
		return annonce;
	}

	public void setAnnonce(Annonce annonce) {
		this.annonce = annonce;
	}

	public Agence getAgence() {
		return agence;
	}

	public void setAgence(Agence agence) {
		this.agence = agence;
	}

	public TypeAppelant getTypeAppelant() {
		return typeAppelant;
	}

	public void setTypeAppelant(TypeAppelant typeAppelant) {
		this.typeAppelant = typeAppelant;
	}

	public Origine getOrigine() {
		return origine;
	}

	public void setOrigine(Origine origine) {
		this.origine = origine;
	}

	public Personne getNegociateur() {
		return negociateur;
	}

	public void setNegociateur(Personne negociateur) {
		this.negociateur = negociateur;
	}

	public Personne getApprouverPar() {
		return approuverPar;
	}

	public void setApprouverPar(Personne approuverPar) {
		this.approuverPar = approuverPar;
	}

	public Personne getSuiviPar() {
		return suiviPar;
	}

	public void setSuiviPar(Personne suiviPar) {
		this.suiviPar = suiviPar;
	}

	public Personne getSuiviPar2() {
		return suiviPar2;
	}

	public void setSuiviPar2(Personne suiviPar2) {
		this.suiviPar2 = suiviPar2;
	}

	public Personne getSuiviPar3() {
		return suiviPar3;
	}

	public void setSuiviPar3(Personne suiviPar3) {
		this.suiviPar3 = suiviPar3;
	}

	public Personne getRecuPar() {
		return recuPar;
	}

	public void setRecuPar(Personne recuPar) {
		this.recuPar = recuPar;
	}


	@Override
	public String toString() {
		return "Appel [id=" + id + ", dateHeure=" + dateHeure + ", nom=" + nom + ", prenom=" + prenom + ", mobile="
				+ mobile + ", telephone=" + telephone + ", email=" + email + ", objet=" + objet + ", nomDuMandat="
				+ nomDuMandat + ", suivre=" + suivre + ", ligneAdresse1=" + ligneAdresse1 + ", codePostal=" + codePostal
				+ ", ville=" + ville + ", codeCouleur=" + codeCouleur + ", estAccuse=" + estAccuse + ", estSupprime="
				+ estSupprime + ", estTermine=" + estTermine + ", typeAppel=" + typeAppel + "]";
	}
	
	
}