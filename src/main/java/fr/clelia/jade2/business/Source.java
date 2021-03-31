package fr.clelia.jade2.business;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the source database table.
 * 
 */
@Entity
@NamedQuery(name="Source.findAll", query="SELECT s FROM Source s")
public class Source implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int sourceid;

	private int displayorder;

	private String name;

	//bi-directional many-to-one association to PhoneCall
	@OneToMany(mappedBy="source")
	private List<PhoneCall> phoneCalls;

	public Source() {
	}

	public int getSourceid() {
		return this.sourceid;
	}

	public void setSourceid(int sourceid) {
		this.sourceid = sourceid;
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
		phoneCall.setSource(this);

		return phoneCall;
	}

	public PhoneCall removePhoneCall(PhoneCall phoneCall) {
		getPhoneCalls().remove(phoneCall);
		phoneCall.setSource(null);

		return phoneCall;
	}

}