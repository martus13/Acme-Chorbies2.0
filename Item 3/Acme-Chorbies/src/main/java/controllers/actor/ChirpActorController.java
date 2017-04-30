
package controllers.actor;

import java.util.Collection;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.ActorService;
import services.ChirpService;
import controllers.AbstractController;
import domain.Actor;
import domain.Chirp;

@Controller
@RequestMapping("/chirp/actor")
public class ChirpActorController extends AbstractController {

	// Services ---------------------------------------------------------------

	@Autowired
	private ChirpService	chirpService;

	@Autowired
	private ActorService	actorService;


	// Constructors -----------------------------------------------------------

	public ChirpActorController() {
		super();
	}

	// Listing ----------------------------------------------------------------		
	@RequestMapping(value = "/receivedChirps", method = RequestMethod.GET)
	public ModelAndView listReceivedChirps() {

		ModelAndView result;
		final boolean imSender = false;
		final Actor principal = this.actorService.findByPrincipal();

		final Collection<Chirp> receivedChirps = this.chirpService.findAllReceivedByActor(principal);

		result = new ModelAndView("chirp/list");
		result.addObject("imSender", imSender);
		result.addObject("chirps", receivedChirps);
		result.addObject("requestURI", "chirp/actor/receivedChirps.do");

		return result;
	}

	@RequestMapping(value = "/sentChirps", method = RequestMethod.GET)
	public ModelAndView listSentChirps() {

		ModelAndView result;
		final boolean imSender = true;
		final Actor actor = this.actorService.findByPrincipal();

		final Collection<Chirp> sentChirps = this.chirpService.findAllSentByActor(actor);

		result = new ModelAndView("chirp/list");
		result.addObject("imSender", imSender);
		result.addObject("chirps", sentChirps);
		result.addObject("requestURI", "chirp/actor/sentChirps.do");

		return result;
	}

	// Create ----------------------------------------------------------------	

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create(@RequestParam final int receiverId) {

		ModelAndView result;
		final Actor receiver = this.actorService.findOne(receiverId);

		final Chirp chirp = this.chirpService.create(receiver);

		result = this.createEditModelAndView(chirp);

		return result;
	}

	// Save ------------------------------------------------------------------	

	@RequestMapping(value = "/create", method = RequestMethod.POST, params = "save")
	public ModelAndView save(@Valid final Chirp chirp, final BindingResult binding) {
		ModelAndView result = new ModelAndView();

		if (binding.hasErrors()) {
			System.out.println(binding.toString());
			result = this.createEditModelAndView(chirp);

		} else
			try {
				this.chirpService.save(chirp);
				result = new ModelAndView("redirect:../actor/sentChirps.do");

			} catch (final Throwable oops) {
				System.out.println(oops);

				result = this.createEditModelAndView(chirp, "chirp.commit.error");
			}

		return result;
	}

	// Re-send ---------------------------------------------------------------	

	@RequestMapping(value = "/resend", method = RequestMethod.POST, params = "resend")
	public ModelAndView resend(@RequestParam final int chirpId) {

		ModelAndView result;
		final Chirp chirp = this.chirpService.findOne(chirpId);

		this.chirpService.resend(chirp);

		result = new ModelAndView("redirect:sentChirps.do");

		return result;
	}

	// Reply -----------------------------------------------------------------	

	@RequestMapping(value = "/reply", method = RequestMethod.POST, params = "reply")
	public ModelAndView reply(@RequestParam final int chirpId) {

		ModelAndView result;
		Chirp reply;
		final Chirp chirp = this.chirpService.findOne(chirpId);

		reply = this.chirpService.reply(chirp);

		result = this.createEditModelAndView(reply);

		return result;
	}

	// Delete ----------------------------------------------------------------	
	@RequestMapping(value = "/delete", method = RequestMethod.POST, params = "delete")
	public ModelAndView delete(@RequestParam final int chirpId) {
		ModelAndView result = new ModelAndView();

		final Chirp chirp = this.chirpService.findOne(chirpId);
		final Actor principal = this.actorService.findByPrincipal();

		if (principal.getId() == chirp.getRecipient().getId()) {
			this.chirpService.deleteReceivedChirp(chirp);
			result = new ModelAndView("redirect:receivedChirps.do");

		} else if (principal.getId() == chirp.getSender().getId()) {
			this.chirpService.deleteSentChirp(chirp);
			result = new ModelAndView("redirect:sentChirps.do");

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
		result.addObject("requestURI", " chirp/actor/create.do");
		result.addObject("chirp", chirp);
		result.addObject("message", message);

		return result;
	}

}
