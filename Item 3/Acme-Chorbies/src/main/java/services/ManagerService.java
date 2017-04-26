
package services;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.ManagerRepository;
import security.Authority;
import security.LoginService;
import security.UserAccount;
import domain.Manager;

@Service
@Transactional
public class ManagerService {

	// Managed repository -----------------------------------------------------
	@Autowired
	private ManagerRepository	managerRepository;


	// Supporting services ----------------------------------------------------

	// Constructors -----------------------------------------------------------
	public ManagerService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------

	public Manager findOne(final int managerId) {
		Assert.isTrue(managerId != 0);

		Manager result;

		result = this.managerRepository.findOne(managerId);

		return result;
	}

	public Collection<Manager> findAll() {
		Collection<Manager> result;

		result = this.managerRepository.findAll();

		return result;
	}

	public Manager create() {
		Manager result;
		UserAccount userAccount;
		Authority authority;

		result = new Manager();

		userAccount = new UserAccount();
		authority = new Authority();

		authority.setAuthority("MANAGER");
		userAccount.getAuthorities().add(authority);

		result.setUserAccount(userAccount);
		result.setFee(0.0);

		return result;
	}

	public Manager save(final Manager manager) {
		Assert.notNull(manager);

		Manager result;
		result = this.managerRepository.save(manager);

		return result;
	}

	// Other business methods -------------------------------------------------
	public Manager findByPrincipal() {
		Manager result;
		UserAccount userAccount;

		userAccount = LoginService.getPrincipal();
		Assert.notNull(userAccount);

		result = this.findByUserAccountId(userAccount.getId());
		Assert.notNull(result);

		return result;
	}

	public Manager findByUserAccountId(final int userAccountId) {
		Assert.notNull(userAccountId);

		Manager result;

		result = this.managerRepository.findByUserAccountId(userAccountId);

		return result;
	}

	// Queries -----

	public Collection<Object[]> findByNumberEvents() {
		return this.managerRepository.findByNumberEvents();
	}

	public Collection<Object[]> findByAmountFee() {
		return this.managerRepository.findByAmountFee();
	}

}
