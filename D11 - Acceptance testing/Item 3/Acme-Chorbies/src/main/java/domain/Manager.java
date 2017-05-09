
package domain;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Access(AccessType.PROPERTY)
public class Manager extends Actor {

	// Constructors -----------------------------------------------------------
	public Manager() {
		super();
	}


	// Attributes -------------------------------------------------------------
	private String	company;
	private String	vatNumber;
	private Double	fee;


	@NotBlank
	public String getCompany() {
		return this.company;
	}

	public void setCompany(final String company) {
		this.company = company;
	}

	@NotBlank
	@Size(min = 2, max = 13)
	public String getVatNumber() {
		return this.vatNumber;
	}

	public void setVatNumber(final String vatNumber) {
		this.vatNumber = vatNumber;
	}

	@NotNull
	@Min(0)
	public Double getFee() {
		return this.fee;
	}

	public void setFee(final Double fee) {
		this.fee = fee;
	}

	// Relationships ----------------------------------------------------------

}
