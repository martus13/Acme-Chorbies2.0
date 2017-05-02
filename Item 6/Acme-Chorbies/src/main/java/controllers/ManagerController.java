
package controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import services.ManagerService;
import domain.Manager;
import forms.ManagerForm;

@Controller
@RequestMapping("/managerActor")
public class ManagerController extends AbstractController {

	// Services ---------------------------------------------------------------
	@Autowired
	private ManagerService	managerService;


	// Constructors -----------------------------------------------------------

	public ManagerController() {
		super();
	}

	// Register ---------------------------------------------------------------		
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView register() {
		ModelAndView result;
		ManagerForm managerForm;
		Manager manager;

		manager = this.managerService.create();
		managerForm = this.managerService.desreconstructCreate(manager);

		result = this.createEditModelAndView(managerForm);

		return result;
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST, params = "save")
	public ModelAndView save(@Valid final ManagerForm managerForm, final BindingResult binding) {

		ModelAndView result;
		Manager manager;

		if (binding.hasErrors()) {
			System.out.println(binding.toString());
			result = this.createEditModelAndView(managerForm);

		} else
			try {
				manager = this.managerService.reconstructCreate(managerForm);
				this.managerService.save(manager);
				result = new ModelAndView("redirect:/security/login.do");

			} catch (final Throwable oops) {
				System.out.println(oops);

				result = this.createEditModelAndView(managerForm, "manager.commit.error");

			}
		return result;

	}

	// Ancillary methods ------------------------------------------------------

	protected ModelAndView createEditModelAndView(final ManagerForm managerForm) {
		ModelAndView result;

		result = this.createEditModelAndView(managerForm, null);

		return result;
	}

	protected ModelAndView createEditModelAndView(final ManagerForm managerForm, final String message) {
		ModelAndView result;

		result = new ModelAndView("managerActor/register");
		result.addObject("managerForm", managerForm);
		result.addObject("actorForm", "managerForm");
		result.addObject("requestURI", "managerActor/register.do");
		result.addObject("message", message);

		return result;
	}
}
