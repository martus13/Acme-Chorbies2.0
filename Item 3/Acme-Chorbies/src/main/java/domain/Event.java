
package domain;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.Valid;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.URL;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Access(AccessType.PROPERTY)
@Table(indexes = {
	@Index(columnList = "availableSeats"), @Index(columnList = "organisedMoment")
})
public class Event extends DomainEntity {

	// Constructors -----------------------------------------------------------
	public Event() {
		super();
	}


	// Attributes -------------------------------------------------------------
	private String	title;
	private Date	organisedMoment;
	private String	description;
	private String	picture;
	private Integer	seatsNumber;
	private Integer	availableSeats;


	@NotBlank
	public String getTitle() {
		return this.title;
	}

	public void setTitle(final String title) {
		this.title = title;
	}

	@NotNull
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "dd/MM/yyyy HH:mm:ss")
	public Date getOrganisedMoment() {
		return this.organisedMoment;
	}

	public void setOrganisedMoment(final Date organisedMoment) {
		this.organisedMoment = organisedMoment;
	}

	@NotBlank
	public String getDescription() {
		return this.description;
	}

	public void setDescription(final String description) {
		this.description = description;
	}

	@NotBlank
	@URL
	public String getPicture() {
		return this.picture;
	}

	public void setPicture(final String picture) {
		this.picture = picture;
	}

	@NotNull
	@Min(0)
	public Integer getSeatsNumber() {
		return this.seatsNumber;
	}

	public void setSeatsNumber(final Integer seatsNumber) {
		this.seatsNumber = seatsNumber;
	}

	@NotNull
	@Min(0)
	public Integer getAvailableSeats() {
		return this.availableSeats;
	}

	public void setAvailableSeats(final Integer availableSeats) {
		this.availableSeats = availableSeats;
	}


	// Relationships ----------------------------------------------------------

	private Manager				manager;
	private Collection<Chorbi>	chorbies;


	@NotNull
	@Valid
	@ManyToOne(optional = false)
	public Manager getManager() {
		return this.manager;
	}

	public void setManager(final Manager manager) {
		this.manager = manager;
	}

	@NotNull
	@Valid
	@ManyToMany()
	public Collection<Chorbi> getChorbies() {
		return this.chorbies;
	}

	public void setChorbies(final Collection<Chorbi> chorbies) {
		this.chorbies = chorbies;
	}

	public void addChorbi(final Chorbi chorbi) {
		this.chorbies.add(chorbi);
	}

	public void removeChorbi(final Chorbi chorbi) {
		this.chorbies.remove(chorbi);
	}

}
