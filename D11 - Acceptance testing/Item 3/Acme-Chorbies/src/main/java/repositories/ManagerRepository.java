
package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Manager;

@Repository
public interface ManagerRepository extends JpaRepository<Manager, Integer> {

	@Query("select m from Manager m where m.userAccount.id = ?1")
	Manager findByUserAccountId(int userAccountId);

	//C1: A listing of managers sorted by the number of events that they organise.
	@Query("select count(e),e.manager from Event e group by e.manager order by count(e)")
	Collection<Object[]> findByNumberEvents();

	//C2: A listing of managers that includes the amount that they due in fees.
	@Query("select m, m.fee from Manager m")
	Collection<Object[]> findByAmountFee();
}
