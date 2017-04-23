
package services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.ManagerRepository;
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
}
