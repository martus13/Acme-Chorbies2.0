
package controllers;

import java.util.Calendar;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import services.EventService;
import domain.Event;

@Controller
@RequestMapping("/event")
public class EventController extends AbstractController {

	// Services ---------------------------------------------------------------
	@Autowired
	private EventService	eventService;


	// Constructors -----------------------------------------------------------

	public EventController() {
		super();
	}

	// ListingOrganisedLessOneMonth -------------------------------------------		
	@RequestMapping(value = "/listOrganisedLessOneMonth", method = RequestMethod.GET)
	public ModelAndView listOrganisedLessOneMonth() {
		ModelAndView result;
		Collection<Event> events;

		events = this.eventService.findOrganisedBetweenDatesAvailableSeats();

		result = new ModelAndView("event/list");
		result.addObject("requestURI", "event/listOrganisedLessOneMonth.do");
		result.addObject("events", events);
		result.addObject("currentDate", null);
		result.addObject("currentPlusOneMonthDate", null);

		return result;
	}

	// ListingAll -------------------------------------------------------------		
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView result;
		final Collection<Event> events;
		Calendar currentCalendar;
		Calendar currentPlusOneMonth;

		currentCalendar = Calendar.getInstance();
		currentCalendar.add(Calendar.MILLISECOND, -10);

		currentPlusOneMonth = Calendar.getInstance();
		currentPlusOneMonth.add(Calendar.MONTH, 1);

		events = this.eventService.findAll();

		result = new ModelAndView("event/list");
		result.addObject("requestURI", "event/list.do");
		result.addObject("events", events);
		result.addObject("currentDate", currentCalendar.getTime());
		result.addObject("currentPlusOneMonthDate", currentPlusOneMonth.getTime());

		return result;
	}
}
