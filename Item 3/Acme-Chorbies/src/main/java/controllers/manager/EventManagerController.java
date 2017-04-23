
package controllers.manager;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

}
