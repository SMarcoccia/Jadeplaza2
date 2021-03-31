package fr.clelia.jade2.business;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the person database table.
 * 
 */
@Entity
@NamedQuery(name="Person.findAll", query="SELECT p FROM Person p")
public class Person implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int personid;

	private byte activerecord;

	@Temporal(TemporalType.TIMESTAMP)
	private Date createdon;

	private byte deleted;

	private String email;

	private String firstname;

	private String initials;

	private String lastname;

	private int nboflogin;

	@Temporal(TemporalType.TIMESTAMP)
	private Date webaccountcreationdate;

	private String webaccountname;

	private String webaccountpassword;

	@Temporal(TemporalType.TIMESTAMP)
	private Date weblastvisit;

	//bi-directional many-to-one association to PhoneCall
	@OneToMany(mappedBy="person1")
	private List<PhoneCall> phoneCalls1;

	//bi-directional many-to-one association to PhoneCall
	@OneToMany(mappedBy="person2")
	private List<PhoneCall> phoneCalls2;

	//bi-directional many-to-one association to PhoneCall
	@OneToMany(mappedBy="person3")
	private List<PhoneCall> phoneCalls3;

	//bi-directional many-to-one association to PhoneCall
	@OneToMany(mappedBy="person4")
	private List<PhoneCall> phoneCalls4;

	//bi-directional many-to-one association to PhoneCall
	@OneToMany(mappedBy="person5")
	private List<PhoneCall> phoneCalls5;

	//bi-directional many-to-one association to PhoneCall
	@OneToMany(mappedBy="person6")
	private List<PhoneCall> phoneCalls6;

	public Person() {
	}

	public int getPersonid() {
		return this.personid;
	}

	public void setPersonid(int personid) {
		this.personid = personid;
	}

	public byte getActiverecord() {
		return this.activerecord;
	}

	public void setActiverecord(byte activerecord) {
		this.activerecord = activerecord;
	}

	public Date getCreatedon() {
		return this.createdon;
	}

	public void setCreatedon(Date createdon) {
		this.createdon = createdon;
	}

	public byte getDeleted() {
		return this.deleted;
	}

	public void setDeleted(byte deleted) {
		this.deleted = deleted;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFirstname() {
		return this.firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getInitials() {
		return this.initials;
	}

	public void setInitials(String initials) {
		this.initials = initials;
	}

	public String getLastname() {
		return this.lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public int getNboflogin() {
		return this.nboflogin;
	}

	public void setNboflogin(int nboflogin) {
		this.nboflogin = nboflogin;
	}

	public Date getWebaccountcreationdate() {
		return this.webaccountcreationdate;
	}

	public void setWebaccountcreationdate(Date webaccountcreationdate) {
		this.webaccountcreationdate = webaccountcreationdate;
	}

	public String getWebaccountname() {
		return this.webaccountname;
	}

	public void setWebaccountname(String webaccountname) {
		this.webaccountname = webaccountname;
	}

	public String getWebaccountpassword() {
		return this.webaccountpassword;
	}

	public void setWebaccountpassword(String webaccountpassword) {
		this.webaccountpassword = webaccountpassword;
	}

	public Date getWeblastvisit() {
		return this.weblastvisit;
	}

	public void setWeblastvisit(Date weblastvisit) {
		this.weblastvisit = weblastvisit;
	}

	public List<PhoneCall> getPhoneCalls1() {
		return this.phoneCalls1;
	}

	public void setPhoneCalls1(List<PhoneCall> phoneCalls1) {
		this.phoneCalls1 = phoneCalls1;
	}

	public PhoneCall addPhoneCalls1(PhoneCall phoneCalls1) {
		getPhoneCalls1().add(phoneCalls1);
		phoneCalls1.setPerson1(this);

		return phoneCalls1;
	}

	public PhoneCall removePhoneCalls1(PhoneCall phoneCalls1) {
		getPhoneCalls1().remove(phoneCalls1);
		phoneCalls1.setPerson1(null);

		return phoneCalls1;
	}

	public List<PhoneCall> getPhoneCalls2() {
		return this.phoneCalls2;
	}

	public void setPhoneCalls2(List<PhoneCall> phoneCalls2) {
		this.phoneCalls2 = phoneCalls2;
	}

	public PhoneCall addPhoneCalls2(PhoneCall phoneCalls2) {
		getPhoneCalls2().add(phoneCalls2);
		phoneCalls2.setPerson2(this);

		return phoneCalls2;
	}

	public PhoneCall removePhoneCalls2(PhoneCall phoneCalls2) {
		getPhoneCalls2().remove(phoneCalls2);
		phoneCalls2.setPerson2(null);

		return phoneCalls2;
	}

	public List<PhoneCall> getPhoneCalls3() {
		return this.phoneCalls3;
	}

	public void setPhoneCalls3(List<PhoneCall> phoneCalls3) {
		this.phoneCalls3 = phoneCalls3;
	}

	public PhoneCall addPhoneCalls3(PhoneCall phoneCalls3) {
		getPhoneCalls3().add(phoneCalls3);
		phoneCalls3.setPerson3(this);

		return phoneCalls3;
	}

	public PhoneCall removePhoneCalls3(PhoneCall phoneCalls3) {
		getPhoneCalls3().remove(phoneCalls3);
		phoneCalls3.setPerson3(null);

		return phoneCalls3;
	}

	public List<PhoneCall> getPhoneCalls4() {
		return this.phoneCalls4;
	}

	public void setPhoneCalls4(List<PhoneCall> phoneCalls4) {
		this.phoneCalls4 = phoneCalls4;
	}

	public PhoneCall addPhoneCalls4(PhoneCall phoneCalls4) {
		getPhoneCalls4().add(phoneCalls4);
		phoneCalls4.setPerson4(this);

		return phoneCalls4;
	}

	public PhoneCall removePhoneCalls4(PhoneCall phoneCalls4) {
		getPhoneCalls4().remove(phoneCalls4);
		phoneCalls4.setPerson4(null);

		return phoneCalls4;
	}

	public List<PhoneCall> getPhoneCalls5() {
		return this.phoneCalls5;
	}

	public void setPhoneCalls5(List<PhoneCall> phoneCalls5) {
		this.phoneCalls5 = phoneCalls5;
	}

	public PhoneCall addPhoneCalls5(PhoneCall phoneCalls5) {
		getPhoneCalls5().add(phoneCalls5);
		phoneCalls5.setPerson5(this);

		return phoneCalls5;
	}

	public PhoneCall removePhoneCalls5(PhoneCall phoneCalls5) {
		getPhoneCalls5().remove(phoneCalls5);
		phoneCalls5.setPerson5(null);

		return phoneCalls5;
	}

	public List<PhoneCall> getPhoneCalls6() {
		return this.phoneCalls6;
	}

	public void setPhoneCalls6(List<PhoneCall> phoneCalls6) {
		this.phoneCalls6 = phoneCalls6;
	}

	public PhoneCall addPhoneCalls6(PhoneCall phoneCalls6) {
		getPhoneCalls6().add(phoneCalls6);
		phoneCalls6.setPerson6(this);

		return phoneCalls6;
	}

	public PhoneCall removePhoneCalls6(PhoneCall phoneCalls6) {
		getPhoneCalls6().remove(phoneCalls6);
		phoneCalls6.setPerson6(null);

		return phoneCalls6;
	}

}