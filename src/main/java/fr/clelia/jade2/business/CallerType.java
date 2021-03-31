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
@NamedQuery(name="CallerType.findAll", query="SELECT c FROM CallerType c")
public class CallerType implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int callertypeid;

	private int displayorder;

	private String name;

	//bi-directional many-to-one association to PhoneCall
	@OneToMany(mappedBy="callerType")
	private List<PhoneCall> phoneCalls;

	public CallerType() {
	}

	public int getCallertypeid() {
		return this.callertypeid;
	}

	public void setCallertypeid(int callertypeid) {
		this.callertypeid = callertypeid;
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
		phoneCall.setCallerType(this);

		return phoneCall;
	}

	public PhoneCall removePhoneCall(PhoneCall phoneCall) {
		getPhoneCalls().remove(phoneCall);
		phoneCall.setCallerType(null);

		return phoneCall;
	}

}