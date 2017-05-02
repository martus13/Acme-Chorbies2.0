
package services;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.ManagerRepository;
import security.Authority;
import security.LoginService;
import security.UserAccount;
import domain.Manager;
import forms.ManagerForm;

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

	public Manager save(Manager manager) {
		Assert.notNull(manager);

		manager = this.managerRepository.save(manager);

		return manager;
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

	public Manager reconstructCreate(final ManagerForm managerForm) {
		Assert.notNull(managerForm);

		Manager manager;
		String password;

		Assert.isTrue(managerForm.getPassword().equals(managerForm.getConfirmPassword())); // Comprobamos que las dos contraseñas sean la misma
		Assert.isTrue(managerForm.getIsAgree()); // Comprobamos que acepte las condiciones

		manager = this.create();
		password = this.encryptPassword(managerForm.getPassword());

		manager.getUserAccount().setUsername(managerForm.getUsername());
		manager.getUserAccount().setPassword(password);
		manager.setName(managerForm.getName());
		manager.setSurname(managerForm.getSurname());
		manager.setEmail(managerForm.getEmail());
		manager.setPhoneNumber(managerForm.getPhoneNumber());
		manager.setCompany(managerForm.getCompany());
		manager.setVatNumber(managerForm.getVatNumber());

		return manager;
	}

	public ManagerForm desreconstructCreate(final Manager manager) {
		ManagerForm managerForm;

		managerForm = new ManagerForm();

		managerForm.setUsername(manager.getUserAccount().getUsername());
		managerForm.setName(manager.getName());
		managerForm.setSurname(manager.getSurname());
		managerForm.setEmail(manager.getEmail());
		managerForm.setPhoneNumber(manager.getPhoneNumber());
		managerForm.setCompany(manager.getCompany());
		managerForm.setVatNumber(manager.getVatNumber());

		return managerForm;
	}

	public String encryptPassword(String password) {
		Md5PasswordEncoder encoder;

		encoder = new Md5PasswordEncoder();
		password = encoder.encodePassword(password, null);

		return password;
	}

	// Queries -----

	public Collection<Object[]> findByNumberEvents() {
		return this.managerRepository.findByNumberEvents();
	}

	public Collection<Object[]> findByAmountFee() {
		return this.managerRepository.findByAmountFee();
	}

}
