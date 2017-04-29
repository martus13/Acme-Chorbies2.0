
package services;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.EventRepository;
import domain.Chorbi;
import domain.Configuration;
import domain.CreditCard;
import domain.Event;
import domain.Manager;

@Service
@Transactional
public class EventService {

	// Managed repository -----------------------------------------------------
	@Autowired
	private EventRepository			eventRepository;

	// Supporting services ----------------------------------------------------
	@Autowired
	private ManagerService			managerService;

	@Autowired
	private ChorbiService			chorbiService;

	@Autowired
	private ConfigurationService	configurationService;

	@Autowired
	private CreditCardService		creditCardService;

	@Autowired
	private ChirpService			chirpService;


	// Constructors -----------------------------------------------------------
	public EventService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------
	public Event findOne(final int eventId) {
		Assert.isTrue(eventId != 0);

		Event result;

		result = this.eventRepository.findOne(eventId);

		return result;
	}

	public Collection<Event> findAll() {
		Collection<Event> result;

		result = this.eventRepository.findAll();

		return result;
	}

	public Event create() {
		Event result;
		Manager manager;
		Collection<Chorbi> chorbies;
		CreditCard creditCard;

		manager = this.managerService.findByPrincipal();
		Assert.notNull(manager);

		// comprobar la validez de la creditCard:
		creditCard = this.creditCardService.findByActor(manager.getId());
		Assert.isTrue(this.creditCardService.checkValidation(creditCard));

		chorbies = new ArrayList<Chorbi>();

		result = new Event();
		result.setAvailableSeats(0);
		result.setManager(manager);
		result.setChorbies(chorbies);

		return result;
	}

	public Event save(Event event) {
		Assert.notNull(event);

		Manager manager;
		CreditCard creditCard;
		Boolean create = false;
		Calendar calendar;

		manager = this.managerService.findByPrincipal();
		Assert.isTrue(manager.equals(event.getManager()));
		// comprobar la validez de la creditCard:
		creditCard = this.creditCardService.findByActor(manager.getId());
		Assert.isTrue(this.creditCardService.checkValidation(creditCard));

		calendar = Calendar.getInstance();
		calendar.add(Calendar.MILLISECOND, -10);

		Assert.isTrue(event.getOrganisedMoment().after(calendar.getTime())); // Comprueba que se organice en el futuro

		if (event.getId() == 0) {
			create = true;
			event.setAvailableSeats(event.getSeatsNumber());

		} else {
			Collection<Chorbi> chorbies;

			chorbies = event.getChorbies();
			event.setAvailableSeats(event.getSeatsNumber() - chorbies.size());

		}

		event = this.eventRepository.save(event);

		if (create) {
			Configuration configuration;

			configuration = this.configurationService.findConfiguration();

			manager.setFee(manager.getFee() + configuration.getManagerFee());
			this.managerService.save(manager);
		} else
			this.chirpService.sendChorbiesRegistered(event, event.getTitle() + " changed.", "The event " + event.getTitle() + " has been modified by the manager who organizes it.");
		return event;
	}

	public void delete(final Event event) {
		Assert.notNull(event);
		Manager manager;

		manager = this.managerService.findByPrincipal();
		Assert.isTrue(manager.equals(event.getManager()));

		if (!event.getChorbies().isEmpty())
			this.unregisterAll(event);

		this.eventRepository.delete(event);

	}

	public Event register(Event event) {
		Chorbi chorbi;

		chorbi = this.chorbiService.findByPrincipal();
		Assert.notNull(chorbi);

		Assert.isTrue(event.getAvailableSeats() > 0);

		event.addChorbi(chorbi);
		event.setAvailableSeats(event.getAvailableSeats() - 1);
		event = this.eventRepository.save(event);

		return event;
	}

	public Event unregister(Event event) {
		Chorbi chorbi;

		chorbi = this.chorbiService.findByPrincipal();
		Assert.notNull(chorbi);

		event.removeChorbi(chorbi);
		event.setAvailableSeats(event.getAvailableSeats() + 1);
		event = this.eventRepository.save(event);

		return event;
	}

	public Event unregisterAll(Event event) {

		this.chirpService.sendChorbiesRegistered(event, event.getTitle() + " deleted.", "The event " + event.getTitle() + " has been deleted by the manager who organizes it.");

		Collection<Chorbi> chorbies;

		chorbies = event.getChorbies();
		for (final Chorbi c : chorbies) {
			c.getEvents().remove(event);
			this.chorbiService.save(c);
		}

		event.setChorbies(new ArrayList<Chorbi>());
		event.setAvailableSeats(event.getSeatsNumber());

		event = this.eventRepository.save(event);

		return event;
	}

	// Other business methods -------------------------------------------------

	public Collection<Event> findOrganisedBetweenDatesAvailableSeats() {
		Collection<Event> results;
		Calendar currentCalendar;
		Calendar currentPlusOneMonth;

		currentCalendar = Calendar.getInstance();
		currentCalendar.add(Calendar.MILLISECOND, -10);

		currentPlusOneMonth = Calendar.getInstance();
		currentPlusOneMonth.add(Calendar.MONTH, 1);

		results = this.eventRepository.findOrganisedBetweenDatesAvailableSeats(currentCalendar.getTime(), currentPlusOneMonth.getTime());

		return results;
	}

	public Collection<Event> findByChorbiId(final int chorbiId) {
		Collection<Event> results;

		results = this.eventRepository.findByChorbiId(chorbiId);

		return results;
	}

	public Collection<Event> findByManagerId(final int managerId) {
		Collection<Event> results;

		results = this.eventRepository.findByManagerId(managerId);

		return results;
	}
}
