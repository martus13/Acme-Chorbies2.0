
package services;

import java.util.Collection;

import javax.transaction.Transactional;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.Assert;

import utilities.AbstractTest;
import domain.Chorbi;
import domain.Like;

@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
public class LikeServiceTest extends AbstractTest {

	// System under test ------------------------------------------------------

	@Autowired
	private LikeService		likeService;

	@Autowired
	private ChorbiService	chorbiService;


	// Tests ------------------------------------------------------------------

	// A continuaci�n se van a realizar pruebas para comprobar el correcto funcionamiento de los casos de uso relacionados con Like.

	// Darle like a un chorbi:
	@Test
	public void driverCreateAndSave() {
		final Object testingData[][] = {
			{	// Bien
				"chorbi1", 76, "Test save",3, null
			}, {// No se puede dar like dos veces al mismo chorbi
				"chorbi1", 75, "Test save",3, IllegalArgumentException.class
			}, {// No se puede dar like a s� mismo
				"chorbi1", 74, "Test save",3, IllegalArgumentException.class
			}, {// Debe estar logueado
				null, 74, "Test save",3, IllegalArgumentException.class
			},{// La valoraci�n debe estar entre 0 y 3
				null, 74, "Test save",4, IllegalArgumentException.class
			}
		};

		for (int i = 0; i < testingData.length; i++) {
			this.testCreate((String) testingData[i][0], (int) testingData[i][1], (Class<?>) testingData[i][4]);
			this.testCreateAndSave((String) testingData[i][0], (int) testingData[i][1], (String) testingData[i][2], (int) testingData[i][3], (Class<?>) testingData[i][4]);
		}
	}

	// Eliminaci�n del like:
	@Test
	public void driverDelete() {
		final Object testingData[][] = {
			{	// Bien
				"chorbi1", 90, null
			}, {// Un chorbi solo puede eliminar los likes que ha dado
				"chorbi1", 93, IllegalArgumentException.class
			}, {// Debe estar logueado
				null, 90, IllegalArgumentException.class
			}
		};

		for (int i = 0; i < testingData.length; i++)
			this.testDelete((String) testingData[i][0], (int) testingData[i][1], (Class<?>) testingData[i][2]);
	}

	// Mostrar los likes que ha recibido y enviado un chorbi:
	@Test
	public void driverFind() {
		final Object testingData[][] = {
			{
				74, 75, null
			}
		};

		for (int i = 0; i < testingData.length; i++) {
			this.testFindByGivenToId((int) testingData[i][0], (Class<?>) testingData[i][2]);
			this.testFindByGivenById((int) testingData[i][0], (Class<?>) testingData[i][2]);
			this.testFindByGivenToIdAndGivenById((int) testingData[i][1], (int) testingData[i][0], (Class<?>) testingData[i][2]);
		}
	}
	protected void testCreate(final String username, final int chrobiId, final Class<?> expected) {
		Class<?> caught;

		caught = null;
		try {
			this.authenticate(username);

			Like like;
			Chorbi chorbi;

			chorbi = this.chorbiService.findOne(chrobiId);
			like = this.likeService.create(chorbi);
			Assert.notNull(like);

			this.unauthenticate();
		} catch (final Throwable oops) {
			caught = oops.getClass();
		}

		this.checkExceptions(expected, caught);

	}

	protected void testCreateAndSave(final String username, final int chrobiId, final String commentText, final int starsNumber, final Class<?> expected) {
		Class<?> caught;

		caught = null;
		try {
			this.authenticate(username);

			Like like;
			Chorbi chorbi;

			chorbi = this.chorbiService.findOne(chrobiId);
			like = this.likeService.create(chorbi);
			like.setComment(commentText);
			like.setStarsNumber(starsNumber);
			like = this.likeService.save(like);
			Assert.isTrue(!like.getComment().isEmpty());
			Assert.isTrue(like.getStarsNumber()<=3&&like.getStarsNumber()>=0);

			this.unauthenticate();
		} catch (final Throwable oops) {
			caught = oops.getClass();
		}

		this.checkExceptions(expected, caught);

	}

	protected void testDelete(final String username, final int likeId, final Class<?> expected) {
		Class<?> caught;

		caught = null;
		try {
			this.authenticate(username);

			Like like;
			Collection<Like> likes;

			like = this.likeService.findOne(likeId);
			this.likeService.delete(like);

			likes = this.likeService.findAll();
			Assert.isTrue(!likes.contains(like));

			this.unauthenticate();
		} catch (final Throwable oops) {
			caught = oops.getClass();
		}

		this.checkExceptions(expected, caught);

	}

	protected void testFindByGivenToId(final int chorbiId, final Class<?> expected) {
		Class<?> caught;

		caught = null;
		try {
			Collection<Like> likes;

			likes = this.likeService.findByGivenToId(chorbiId);
			System.out.println("Given to " + chorbiId + ": " + likes.size());

		} catch (final Throwable oops) {
			caught = oops.getClass();
		}

		this.checkExceptions(expected, caught);

	}

	protected void testFindByGivenById(final int chorbiId, final Class<?> expected) {
		Class<?> caught;

		caught = null;
		try {
			final Collection<Like> likes;

			likes = this.likeService.findByGivenById(chorbiId);
			System.out.println("Given to " + chorbiId + ": " + likes.size());

		} catch (final Throwable oops) {
			caught = oops.getClass();
		}

		this.checkExceptions(expected, caught);

	}

	protected void testFindByGivenToIdAndGivenById(final int chorbiToId, final int chorbiById, final Class<?> expected) {
		Class<?> caught;

		caught = null;
		try {
			final Like like;

			like = this.likeService.findByGivenToIdAndGivenById(chorbiToId, chorbiById);
			System.out.println("Like moment: " + like.getLikeMoment());

		} catch (final Throwable oops) {
			caught = oops.getClass();
		}

		this.checkExceptions(expected, caught);

	}

	@Test
	public void testFindMinMaxAvgReceivedPerChorbi() {
		Object[] result;

		result = this.likeService.findMinMaxAvgReceivedPerChorbi();
		System.out.println("Min: " + result[0] + ", Max: " + result[1] + ", Avg: " + result[2]);

	}
}
