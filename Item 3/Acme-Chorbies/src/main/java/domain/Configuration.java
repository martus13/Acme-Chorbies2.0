
package domain;

import java.util.Date;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Access(AccessType.PROPERTY)
public class Configuration extends DomainEntity {

	// Constructors ----------------------------------------------------------
	public Configuration() {
		super();
	}


	// Attributes -------------------------------------------------------------
	private Date	cachedTime;
	private Double	managerFee;
	private Double	chorbiFee;


	@NotNull
	@Temporal(TemporalType.TIME)
	@DateTimeFormat(pattern = "HH:mm:ss")
	public Date getCachedTime() {
		return this.cachedTime;
	}

	public void setCachedTime(final Date cachedTime) {
		this.cachedTime = cachedTime;
	}

	@NotNull
	@Min(0)
	public Double getManagerFee() {
		return this.managerFee;
	}

	public void setManagerFee(final Double managerFee) {
		this.managerFee = managerFee;
	}

	@NotNull
	@Min(0)
	public Double getChorbiFee() {
		return this.chorbiFee;
	}

	public void setChorbiFee(final Double chorbiFee) {
		this.chorbiFee = chorbiFee;
	}

	// Relationships ----------------------------------------------------------

}
