
package services;

import java.util.Calendar;
import java.util.Collection;

import javax.transaction.Transactional;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.Assert;

import utilities.AbstractTest;
import domain.Manager;

@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
public class ManagerServiceTest extends AbstractTest {

	// System under test ------------------------------------------------------

	@Autowired
	private ManagerService	managerService;


	// Tests ------------------------------------------------------------------

	// A continuación se van a realizar pruebas para comprobar el correcto funcionamiento de los casos de uso relacionados con Manager.

	// Registro de un manager:
	@Test
	public void driverCreate() {
		Calendar correctCalendar;
		Calendar wrongCalendar;

		correctCalendar = Calendar.getInstance();
		correctCalendar.set(1992, 9, 31);

		wrongCalendar = Calendar.getInstance();
		wrongCalendar.add(Calendar.YEAR, -17); // Hace 17 años

		wrongCalendar = Calendar.getInstance();

		final Object testingData[][] = {
			{	// Bien
				"prueba1", "3f1b7ccad63d40a7b4c27dda225bf941", "prueba", "apellido", "prueba1@gmail.com", "954668789", "Endesa", "123", null
			}, {// vatIncorrecto
				"prueba1", "3f1b7ccad63d40a7b4c27dda225bf941", "prueba", "apellido", "prueba1@gmail.com", "954668789", "Endesa", "12", null
			}
		};

		for (int i = 0; i < testingData.length; i++)
			this.testCreate((String) testingData[i][0], (String) testingData[i][1], (String) testingData[i][2], (String) testingData[i][3], (String) testingData[i][4], (String) testingData[i][5], (String) testingData[i][6], (String) testingData[i][7],
				(Class<?>) testingData[i][8]);
	}

	protected void testCreate(final String username, final String password, final String name, final String surname, final String email, final String phoneNumber, final String company, final String vatNumber, final Class<?> expected) {
		Class<?> caught;

		caught = null;
		try {
			Manager manager;

			manager = this.managerService.create();

			manager.getUserAccount().setUsername(username);
			manager.getUserAccount().setPassword(this.managerService.encryptPassword(password));
			manager.setName(name);
			manager.setSurname(surname);
			manager.setEmail(email);
			manager.setPhoneNumber(phoneNumber);
			manager.setCompany(company);
			manager.setVatNumber(vatNumber);

			manager = this.managerService.save(manager);

		} catch (final Throwable oops) {
			caught = oops.getClass();
		}

		this.checkExceptions(expected, caught);

	}

	/////////////// Sin driver:
	@Test
	public void testFindAll() {
		Collection<Manager> managers;

		managers = this.managerService.findAll();
		Assert.isTrue(managers.size() == 5);
	}

	@Test
	public void testFindByNumberEvents() {
		Collection<Object[]> results;

		results = this.managerService.findByNumberEvents();
		for (final Object[] o : results)
			System.out.println(o[0] + " -> " + o[1]);
		System.out.println("-------------------------------------");

	}

	@Test
	public void testFindByAmountFee() {
		Collection<Object[]> results;

		results = this.managerService.findByAmountFee();

		System.out.println("testFindByAmountFee()");
		for (final Object[] o : results)
			System.out.println(o[0] + " -> " + o[1]);
		System.out.println("-------------------------------------");

	}
}
