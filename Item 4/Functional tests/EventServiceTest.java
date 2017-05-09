
package services;

import java.util.Calendar;
import java.util.Date;

import javax.transaction.Transactional;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import utilities.AbstractTest;
import domain.Event;

@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
public class EventServiceTest extends AbstractTest {

	// System under test ------------------------------------------------------

	@Autowired
	private EventService	eventService;


	// Tests ------------------------------------------------------------------

	// A continuación se van a realizar pruebas para comprobar el correcto funcionamiento de los casos de uso relacionados con Event.

	// Registro y edicion de un event:
	@Test
	public void driverCreateAndSave() {
		Calendar correctCalendar;
		Calendar wrongCalendar;

		correctCalendar = Calendar.getInstance();
		correctCalendar.set(2017, 9, 31, 12, 30, 00);

		wrongCalendar = Calendar.getInstance();
		wrongCalendar.set(2017, 3, 20, 9, 30, 00);

		final Object testingData[][] = {
			{	// Bien
				"manager1", "prueba1", correctCalendar.getTime(), "Descripcion prueba 1", "http://www.texasbungalow.com/events.jpg", 10, null
			}, {// Tarjeta de credito no valida
				"manager3", "prueba1", correctCalendar.getTime(), "Descripcion prueba 1", "http://www.texasbungalow.com/events.jpg", 10, IllegalArgumentException.class
			}, {// Fecha de organizacion pasada+Edicion de un evento de otro manager
				"manager1", "prueba1", wrongCalendar.getTime(), "Descripcion prueba 1", "http://www.texasbungalow.com/events.jpg", 10, IllegalArgumentException.class
			}
		};

		for (int i = 0; i < testingData.length; i++)
			this.testCreate((String) testingData[i][0], (String) testingData[i][1], (Date) testingData[i][2], (String) testingData[i][3], (String) testingData[i][4], (Integer) testingData[i][5], (Class<?>) testingData[i][6]);
	}

	@Test
	public void driverEdit() {
		Calendar correctCalendar;
		Calendar wrongCalendar;

		correctCalendar = Calendar.getInstance();
		correctCalendar.set(2017, 9, 31, 12, 30, 00);

		wrongCalendar = Calendar.getInstance();
		wrongCalendar.set(2017, 3, 20, 9, 30, 00);

		final Object testingData[][] = {
			{	// Bien
				"manager1", 70, "prueba1", correctCalendar.getTime(), "Descripcion prueba 1", "http://www.texasbungalow.com/events.jpg", 10, null
			}, {// Tarjeta de credito no valida
				"manager3", 70, "prueba1", correctCalendar.getTime(), "Descripcion prueba 1", "http://www.texasbungalow.com/events.jpg", 10, IllegalArgumentException.class
			}, {// Fecha de organizacion pasada
				"manager1", 70, "prueba1", wrongCalendar.getTime(), "Descripcion prueba 1", "http://www.texasbungalow.com/events.jpg", 10, IllegalArgumentException.class
			}, {// Edicion de un evento de otro manager
				"manager1", 72, "prueba1", wrongCalendar.getTime(), "Descripcion prueba 1", "http://www.texasbungalow.com/events.jpg", 10, IllegalArgumentException.class
			}, {// Menos asientos de los que ya estan registrados
				"manager1", 71, "prueba1", wrongCalendar.getTime(), "Descripcion prueba 1", "http://www.texasbungalow.com/events.jpg", 1, IllegalArgumentException.class
			}
		};

		for (int i = 0; i < testingData.length; i++)
			this.testEdit((String) testingData[i][0], (int) testingData[i][1], (String) testingData[i][2], (Date) testingData[i][3], (String) testingData[i][4], (String) testingData[i][5], (Integer) testingData[i][6], (Class<?>) testingData[i][7]);
	}

	// Eliminacion de un event:
	@Test
	public void driverDelete() {

		final Object testingData[][] = {
			{	// Bien
				"manager1", 70, null
			}, {// Manager sin autenticar
				null, 70, IllegalArgumentException.class
			}, {// Eliminacion de un evento de otro manager
				"manager1", 72, IllegalArgumentException.class
			}
		};

		for (int i = 0; i < testingData.length; i++)
			this.testDelete((String) testingData[i][0], (int) testingData[i][1], (Class<?>) testingData[i][2]);
	}

	// Inscripcion y cancelacion de la inscripcion a un event:
	@Test
	public void driverRegister() {

		final Object testingData[][] = {
			{	// Bien
				"chorbi1", 73, null
			}, {// Chorbi sin autenticar
				null, 73, IllegalArgumentException.class
			}, {// Register: no hay plazas libres; Unregister: no esta registrado
				"chorbi3", 71, IllegalArgumentException.class
			}
		};

		for (int i = 0; i < testingData.length; i++) {
			this.testRegister((String) testingData[i][0], (int) testingData[i][1], (Class<?>) testingData[i][2]);
			this.testUnregister((String) testingData[i][0], (int) testingData[i][1], (Class<?>) testingData[i][2]);
		}
	}

	protected void testCreate(final String username, final String title, final Date organisedMoment, final String description, final String picture, final Integer seatsNumber, final Class<?> expected) {
		Class<?> caught;

		caught = null;
		try {
			this.authenticate(username);

			Event event;

			event = this.eventService.create();

			event.setTitle(title);
			event.setOrganisedMoment(organisedMoment);
			event.setDescription(description);
			event.setPicture(picture);
			event.setSeatsNumber(seatsNumber);

			event = this.eventService.save(event);

			this.unauthenticate();

		} catch (final Throwable oops) {
			caught = oops.getClass();
		}

		this.checkExceptions(expected, caught);

	}

	protected void testEdit(final String username, final int eventId, final String title, final Date organisedMoment, final String description, final String picture, final Integer seatsNumber, final Class<?> expected) {
		Class<?> caught;

		caught = null;
		try {
			this.authenticate(username);

			Event event;

			event = this.eventService.findOne(eventId);

			event.setTitle(title);
			event.setOrganisedMoment(organisedMoment);
			event.setDescription(description);
			event.setPicture(picture);
			event.setSeatsNumber(seatsNumber);

			event = this.eventService.save(event);

			this.unauthenticate();

		} catch (final Throwable oops) {
			caught = oops.getClass();
		}

		this.checkExceptions(expected, caught);

	}

	protected void testDelete(final String username, final int eventId, final Class<?> expected) {
		Class<?> caught;

		caught = null;
		try {
			this.authenticate(username);

			Event event;

			event = this.eventService.findOne(eventId);

			this.eventService.delete(event);

			this.unauthenticate();

		} catch (final Throwable oops) {
			caught = oops.getClass();
		}

		this.checkExceptions(expected, caught);

	}

	protected void testRegister(final String username, final int eventId, final Class<?> expected) {
		Class<?> caught;

		caught = null;
		try {
			this.authenticate(username);

			Event event;

			event = this.eventService.findOne(eventId);

			this.eventService.register(event);

			this.unauthenticate();

		} catch (final Throwable oops) {
			caught = oops.getClass();
		}

		this.checkExceptions(expected, caught);

	}

	protected void testUnregister(final String username, final int eventId, final Class<?> expected) {
		Class<?> caught;

		caught = null;
		try {
			this.authenticate(username);

			Event event;

			event = this.eventService.findOne(eventId);

			this.eventService.unregister(event);

			this.unauthenticate();

		} catch (final Throwable oops) {
			caught = oops.getClass();
		}

		this.checkExceptions(expected, caught);

	}
}
