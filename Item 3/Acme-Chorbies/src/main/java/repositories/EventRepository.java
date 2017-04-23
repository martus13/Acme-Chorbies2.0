
package repositories;

import java.util.Collection;
import java.util.Date;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Event;

@Repository
public interface EventRepository extends JpaRepository<Event, Integer> {

	@Query("select e from Event e where e.availableSeats>0 and e.organisedMoment between ?1 and ?2")
	Collection<Event> findOrganisedBetweenDatesAvailableSeats(Date currentDate, Date oneMonth);

	@Query("select e from Event e join e.chorbies c on c.id=?1")
	Collection<Event> findByChorbiId(int chorbiId);

	@Query("select e from Event e where e.manager.id=?1")
	Collection<Event> findByManagerId(int managerId);

}
