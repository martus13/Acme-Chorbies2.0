
package repositories;

import java.util.Collection;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Chorbi;

@Repository
public interface ChorbiRepository extends JpaRepository<Chorbi, Integer> {

	@Query("select c from Chorbi c join c.events e where e.id=?1")
	Page<Chorbi> findByEventIdPaged(int eventId, Pageable pageRequest);

	@Query("select c from Chorbi c where c.userAccount.id = ?1")
	Chorbi findByUserAccountId(int userAccountId);

	@Query("select c from Chorbi c where c.banned=false")
	Collection<Chorbi> findNotBanned();

	@Query("select l.givenBy from Like l where l.givenTo.id = ?1")
	Collection<Chorbi> findChorbiesLikedMe(int myId);

	@Query("select 0.1*e.chorbies.size from Event e where e.id=?1")
	Double find10percentChorbiesByEventId(int eventId);

	// C1: A listing with the number of chorbies per country and city.
	@Query("select c.coordinates.country, c.coordinates.city, count(c) from Chorbi c group by c.coordinates.country, c.coordinates.city")
	Collection<Object[]> findGroupByCountryAndCity();

	// C2: The minimum, the maximum, and the average ages of the chorbies.
	@Query("select min(DATE_FORMAT(FROM_DAYS(DATEDIFF(current_timestamp, c.birthDate)), '%y')), max(DATE_FORMAT(FROM_DAYS(DATEDIFF(current_timestamp, c.birthDate)), '%y')), avg(DATE_FORMAT(FROM_DAYS(DATEDIFF(current_timestamp, c.birthDate)), '%y')) from Chorbi c")
	Object[] findMinMaxAvgAges();

	// C3: The ratio of chorbies who have not registered a credit card or have registered an invalid credit card.
	@Query("select 100*count(c)/(select count(c1) from Chorbi c1) from Chorbi c where c.id not in (select d.actor.id from CreditCard d) or c.id in (select d1.actor.id from CreditCard d1 where d1.expirationYear<?1 or (d1.expirationYear=?1 and d1.expirationMonth<=?2))")
	Double findRatioInvalidCreditCard(Integer year, Integer month);

	// C4: The ratios of chorbies who search for "activities", "friendship", and "love".
	//activities
	@Query("select 100*count(c)/(select count(d) from Chorbi d) from Chorbi c where c.relationshipEngage='activities'")
	Double findRatioActivities();

	//friendship
	@Query("select 100*count(c)/(select count(d) from Chorbi d) from Chorbi c where c.relationshipEngage='friendship'")
	Double findRatioFriendship();

	//love
	@Query("select 100*count(c)/(select count(d) from Chorbi d) from Chorbi c where c.relationshipEngage='love'")
	Double findRatioLove();

	// B1: The list of chorbies, sorted by the number of likes they have got.
	@Query("select c from Chorbi c order by c.receivedLikes.size DESC")
	Collection<Chorbi> findAllSortedByReceivedLikes();

	// A3: The chorbies who have got more chirps.
	@Query("select count(c), c.recipient from Chirp c where c.copy=true group by c.recipient having count(c) >= ALL(select count(c1) from Chirp c1 where c1.copy=true group by c1.recipient)")
	Collection<Object[]> findChorbiWithMostReceivedChirps();

	// A4: The chorbies who have sent more chirps.
	@Query("select count(c), c.sender from Chirp c where c.copy=false group by c.sender having count(c) >= ALL(select count(c1) from Chirp c1 where c1.copy=false group by c1.sender)")
	Collection<Object[]> findChorbiWithMostSentChirps();

	//// Acme-Chorbies 2.0:

	// C3: A listing of chorbies sorted by the number of events to wich they have registered.
	@Query("select count(e), c from Event e join e.chorbies c group by c order by count(e)")
	Collection<Object[]> findOrderByRegisteredEvents();

	// C4: A listing of chorbies that includes the amount that they due in fees.
	@Query("select c, c.fee from Chorbi c")
	Collection<Object[]> findAllWithAmountFee();

	//B2: The list of chorbies, sorted by the average number of stars that they've got
	@Query("select c, avg(l.starsNumber) from Chorbi c left join c.receivedLikes l group by c order by avg(l.starsNumber) desc")
	Collection<Object[]> findChorbisSortedByAvgStars();

}
