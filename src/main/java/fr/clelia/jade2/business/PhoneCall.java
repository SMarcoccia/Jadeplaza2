package fr.clelia.jade2.business;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the phone_call database table.
 * 
 */
@Entity
@Table(name="phone_call")
@NamedQuery(name="PhoneCall.findAll", query="SELECT p FROM PhoneCall p")
public class PhoneCall implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int phonecallid;

	private byte acknowledged;

	private String addressline1;

	private String calltype;

	private String colourcode;

	private byte complete;

	private byte deleted;

	private String email;

	private String firstname;

	@Lob
	private String followup;

	private String lastname;

	private String mandatename;

	private String mobilenumber;

	@Lob
	private String object;

	private String phonenumber;

	private String postcode;

	@Temporal(TemporalType.TIMESTAMP)
	private Date receivedon;

	private String town;

	//bi-directional many-to-one association to Advert
	@ManyToOne
	@JoinColumn(name="ADVERTID")
	private Advert advert;

	//bi-directional many-to-one association to Agency
	@ManyToOne
	@JoinColumn(name="AGENCYID")
	private Agency agency;

	//bi-directional many-to-one association to CallerType
	@ManyToOne
	@JoinColumn(name="CALLERTYPEID")
	private CallerType callerType;

	//bi-directional many-to-one association to Person
	@ManyToOne
	@JoinColumn(name="APPROVEDBY")
	private Person person1;

	//bi-directional many-to-one association to Person
	@ManyToOne
	@JoinColumn(name="FOLLOWEDBY2")
	private Person person2;

	//bi-directional many-to-one association to Person
	@ManyToOne
	@JoinColumn(name="FOLLOWEDBY3")
	private Person person3;

	//bi-directional many-to-one association to Person
	@ManyToOne
	@JoinColumn(name="FOLLOWEDBY")
	private Person person4;

	//bi-directional many-to-one association to Person
	@ManyToOne
	@JoinColumn(name="NEGOCIATOR")
	private Person person5;

	//bi-directional many-to-one association to Person
	@ManyToOne
	@JoinColumn(name="RECEIVEDBY")
	private Person person6;

	//bi-directional many-to-one association to Source
	@ManyToOne
	@JoinColumn(name="SOURCEID")
	private Source source;

	public PhoneCall() {
	}

	public int getPhonecallid() {
		return this.phonecallid;
	}

	public void setPhonecallid(int phonecallid) {
		this.phonecallid = phonecallid;
	}

	public byte getAcknowledged() {
		return this.acknowledged;
	}

	public void setAcknowledged(byte acknowledged) {
		this.acknowledged = acknowledged;
	}

	public String getAddressline1() {
		return this.addressline1;
	}

	public void setAddressline1(String addressline1) {
		this.addressline1 = addressline1;
	}

	public String getCalltype() {
		return this.calltype;
	}

	public void setCalltype(String calltype) {
		this.calltype = calltype;
	}

	public String getColourcode() {
		return this.colourcode;
	}

	public void setColourcode(String colourcode) {
		this.colourcode = colourcode;
	}

	public byte getComplete() {
		return this.complete;
	}

	public void setComplete(byte complete) {
		this.complete = complete;
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

	public String getFollowup() {
		return this.followup;
	}

	public void setFollowup(String followup) {
		this.followup = followup;
	}

	public String getLastname() {
		return this.lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getMandatename() {
		return this.mandatename;
	}

	public void setMandatename(String mandatename) {
		this.mandatename = mandatename;
	}

	public String getMobilenumber() {
		return this.mobilenumber;
	}

	public void setMobilenumber(String mobilenumber) {
		this.mobilenumber = mobilenumber;
	}

	public String getObject() {
		return this.object;
	}

	public void setObject(String object) {
		this.object = object;
	}

	public String getPhonenumber() {
		return this.phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public String getPostcode() {
		return this.postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public Date getReceivedon() {
		return this.receivedon;
	}

	public void setReceivedon(Date receivedon) {
		this.receivedon = receivedon;
	}

	public String getTown() {
		return this.town;
	}

	public void setTown(String town) {
		this.town = town;
	}

	public Advert getAdvert() {
		return this.advert;
	}

	public void setAdvert(Advert advert) {
		this.advert = advert;
	}

	public Agency getAgency() {
		return this.agency;
	}

	public void setAgency(Agency agency) {
		this.agency = agency;
	}

	public CallerType getCallerType() {
		return this.callerType;
	}

	public void setCallerType(CallerType callerType) {
		this.callerType = callerType;
	}

	public Person getPerson1() {
		return this.person1;
	}

	public void setPerson1(Person person1) {
		this.person1 = person1;
	}

	public Person getPerson2() {
		return this.person2;
	}

	public void setPerson2(Person person2) {
		this.person2 = person2;
	}

	public Person getPerson3() {
		return this.person3;
	}

	public void setPerson3(Person person3) {
		this.person3 = person3;
	}

	public Person getPerson4() {
		return this.person4;
	}

	public void setPerson4(Person person4) {
		this.person4 = person4;
	}

	public Person getPerson5() {
		return this.person5;
	}

	public void setPerson5(Person person5) {
		this.person5 = person5;
	}

	public Person getPerson6() {
		return this.person6;
	}

	public void setPerson6(Person person6) {
		this.person6 = person6;
	}

	public Source getSource() {
		return this.source;
	}

	public void setSource(Source source) {
		this.source = source;
	}

}