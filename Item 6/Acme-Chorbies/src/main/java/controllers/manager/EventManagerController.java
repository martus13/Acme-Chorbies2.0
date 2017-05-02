
package controllers.manager;

import java.util.Collection;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.EventService;
import services.ManagerService;
import controllers.AbstractController;
import domain.Event;
import domain.Manager;

@Controller
@RequestMapping("/event/manager")
public class EventManagerController extends AbstractController {

	// Services ---------------------------------------------------------------
	@Autowired
	private EventService	eventService;

	@Autowired
	private ManagerService	managerService;


	//	@Autowired
	//	private CreditCardService	creditCardService;

	// Constructors -----------------------------------------------------------

	public EventManagerController() {
		super();
	}

	// ListingByManager -------------------------------------------------------		
	@RequestMapping(value = "/listByManager", method = RequestMethod.GET)
	public ModelAndView listByManager() {
		ModelAndView result;
		Collection<Event> events;
		Manager manager;

		manager = this.managerService.findByPrincipal();

		events = this.eventService.findByManagerId(manager.getId());

		result = new ModelAndView("event/list");
		result.addObject("requestURI", "event/listByManager.do");
		result.addObject("events", events);

		return result;
	}

	// Creation ---------------------------------------------------------------		
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView register() {
		ModelAndView result;
		Event event;
		//		CreditCard creditCard;
		//
		//		creditCard = this.creditCardService.findByActor(this.managerService.findByPrincipal().getId());
		//		if (this.creditCardService.checkValidation(creditCard) == false || creditCard == null) {
		//			System.out.println("Invalid Credit Card");
		//			result = new ModelAndView("master.page");
		//			result.addObject("message", "searchTemplate.commit.errorCC");
		//		} else {

		event = this.eventService.create();

		result = this.createEditModelAndView(event);
		//		}

		return result;
	}

	// Edition ----------------------------------------------------------------		
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView edit(@RequestParam final int eventId) {
		ModelAndView result;
		Event event;

		event = this.eventService.findOne(eventId);

		result = this.createEditModelAndView(event);

		return result;
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView save(@Valid Event event, final BindingResult binding) {

		ModelAndView result;

		if (binding.hasErrors()) {
			System.out.println(binding.toString());
			result = this.createEditModelAndView(event);

		} else
			try {
				event = this.eventService.save(event);
				result = new ModelAndView("redirect:listByManager.do");

			} catch (final Throwable oops) {
				System.out.println(oops);

				result = this.createEditModelAndView(event, "event.commit.error");

			}
		return result;

	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "delete")
	public ModelAndView delete(final Event event, final BindingResult binding) {

		ModelAndView result;

		this.eventService.delete(event);

		result = new ModelAndView("redirect:listByManager.do");

		return result;

	}

	// Ancillary methods ------------------------------------------------------

	protected ModelAndView createEditModelAndView(final Event event) {
		ModelAndView result;

		result = this.createEditModelAndView(event, null);

		return result;
	}

	protected ModelAndView createEditModelAndView(final Event event, final String message) {
		ModelAndView result;

		if (event.getId() == 0)
			result = new ModelAndView("event/create");
		else
			result = new ModelAndView("event/edit");
		result.addObject("event", event);
		result.addObject("message", message);

		return result;
	}
}
