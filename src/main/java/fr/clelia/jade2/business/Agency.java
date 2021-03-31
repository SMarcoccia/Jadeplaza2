package fr.clelia.jade2.business;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the agency database table.
 * 
 */
@Entity
@NamedQuery(name="Agency.findAll", query="SELECT a FROM Agency a")
public class Agency implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int agencyid;

	private String name;

	//bi-directional many-to-one association to PhoneCall
	@OneToMany(mappedBy="agency")
	private List<PhoneCall> phoneCalls;

	public Agency() {
	}

	public int getAgencyid() {
		return this.agencyid;
	}

	public void setAgencyid(int agencyid) {
		this.agencyid = agencyid;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<PhoneCall> getPhoneCalls() {
		return this.phoneCalls;
	}

	public void setPhoneCalls(List<PhoneCall> phoneCalls) {
		this.phoneCalls = phoneCalls;
	}

	public PhoneCall addPhoneCall(PhoneCall phoneCall) {
		getPhoneCalls().add(phoneCall);
		phoneCall.setAgency(this);

		return phoneCall;
	}

	public PhoneCall removePhoneCall(PhoneCall phoneCall) {
		getPhoneCalls().remove(phoneCall);
		phoneCall.setAgency(null);

		return phoneCall;
	}

}