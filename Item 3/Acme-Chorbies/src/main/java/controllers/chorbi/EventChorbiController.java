
package controllers.chorbi;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import services.ChorbiService;
import services.EventService;
import controllers.AbstractController;
import domain.Chorbi;
import domain.Event;

@Controller
@RequestMapping("/event/chorbi")
public class EventChorbiController extends AbstractController {

	// Services ---------------------------------------------------------------
	@Autowired
	private EventService	eventService;

	@Autowired
	private ChorbiService	chorbiService;


	// Constructors -----------------------------------------------------------

	public EventChorbiController() {
		super();
	}

	// ListingByManager -------------------------------------------------------		
	@RequestMapping(value = "/listByChorbi", method = RequestMethod.GET)
	public ModelAndView listByChorbi() {
		ModelAndView result;
		Collection<Event> events;
		Chorbi chorbi;

		chorbi = this.chorbiService.findByPrincipal();

		events = this.eventService.findByChorbiId(chorbi.getId());

		result = new ModelAndView("event/list");
		result.addObject("requestURI", "event/listByChorbi.do");
		result.addObject("events", events);

		return result;
	}

}
