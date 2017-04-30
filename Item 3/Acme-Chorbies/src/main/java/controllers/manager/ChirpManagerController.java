package controllers.manager;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.ChirpService;
import services.EventService;
import domain.Chirp;
import domain.Chorbi;
import domain.Event;

@Controller
@RequestMapping("/chirp/manager")
public class ChirpManagerController {
	
	//Supporting services------------------------------------

		@Autowired
		private ChirpService	chirpService;
		
		@Autowired
		private EventService	eventService;


		//Constructors-------------------------------------------

		public ChirpManagerController() {
			super();
		}
		
		//Create---------------------------------------------------
		
		@RequestMapping(value="/create", method = RequestMethod.GET)
		public ModelAndView create(@RequestParam int eventId){
			
			ModelAndView result;
			
			//Es necesario que lleve un destinatario al crear
			Event event = this.eventService.findOne(eventId);
			List<Chorbi> chorbis = new ArrayList<Chorbi>(event.getChorbies());
			Chorbi chorbi = chorbis.get(0);
			
			Chirp chirp = this.chirpService.create(chorbi);
			
			result = this.createEditModelAndView(chirp, eventId);

			return result;
		}

		//Save and send with broadcast 
		
		@RequestMapping(value="/create", method = RequestMethod.POST, params="broadcast")
		public ModelAndView saveAndBroadcast(@Valid Chirp chirp, @RequestParam int eventId, final BindingResult binding){
			ModelAndView result = new ModelAndView();
			Event event = this.eventService.findOne(eventId);

			if (binding.hasErrors()) {
				System.out.println(binding.toString());
				result = this.createEditModelAndView(chirp, eventId);

			} else
				try {
					this.chirpService.sendChorbiesRegistered(event, chirp.getSubject(),chirp.getText());
					result = new ModelAndView("redirect:../../event/list.do");

				} catch (final Throwable oops) {
					System.out.println(oops);

					result = this.createEditModelAndView(chirp, eventId,"chirp.commit.error");
				}

			return result;
			
		}
		
		
		// Ancillary methods ------------------------------------------------------

		protected ModelAndView createEditModelAndView(final Chirp chirp) {
			ModelAndView result;

			result = this.createEditModelAndView(chirp, null);

			return result;
		}

		protected ModelAndView createEditModelAndView(final Chirp chirp, final String message) {
			ModelAndView result;

			result = new ModelAndView("chirp/create");
			result.addObject("requestURI", "chirp/manager/create.do");
			result.addObject("chirp", chirp);
			result.addObject("message", message);

			return result;
		}
		
		protected ModelAndView createEditModelAndView(final Chirp chirp, final int eventId) {
			ModelAndView result;

			result = this.createEditModelAndView(chirp, eventId, null);

			return result;
		}

		protected ModelAndView createEditModelAndView(final Chirp chirp, final int eventId, final String message) {
			ModelAndView result;

			result = new ModelAndView("chirp/create");
			result.addObject("requestURI","chirp/manager/create.do?eventId="+eventId);
			result.addObject("chirp", chirp);
			result.addObject("eventId",eventId);
			result.addObject("message", message);

			return result;
		}
		
}
