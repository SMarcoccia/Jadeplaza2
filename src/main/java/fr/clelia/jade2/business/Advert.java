package fr.clelia.jade2.business;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the advert database table.
 * 
 */
@Entity
@NamedQuery(name="Advert.findAll", query="SELECT a FROM Advert a")
public class Advert implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int advertid;

	private int displayorder;

	private String name;

	//bi-directional many-to-one association to PhoneCall
	@OneToMany(mappedBy="advert")
	private List<PhoneCall> phoneCalls;

	public Advert() {
	}

	public int getAdvertid() {
		return this.advertid;
	}

	public void setAdvertid(int advertid) {
		this.advertid = advertid;
	}

	public int getDisplayorder() {
		return this.displayorder;
	}

	public void setDisplayorder(int displayorder) {
		this.displayorder = displayorder;
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
		phoneCall.setAdvert(this);

		return phoneCall;
	}

	public PhoneCall removePhoneCall(PhoneCall phoneCall) {
		getPhoneCalls().remove(phoneCall);
		phoneCall.setAdvert(null);

		return phoneCall;
	}

}