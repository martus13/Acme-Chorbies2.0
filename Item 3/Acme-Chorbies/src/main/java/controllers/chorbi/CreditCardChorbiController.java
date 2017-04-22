
package controllers.chorbi;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.ChorbiService;
import services.CreditCardService;
import controllers.AbstractController;
import domain.Chorbi;
import domain.CreditCard;
import forms.CreditCardForm;

@Controller
@RequestMapping("/creditCard/chorbi")
public class CreditCardChorbiController extends AbstractController {

	// Services ---------------------------------------------------------------
	@Autowired
	private CreditCardService	creditCardService;

	@Autowired
	private ChorbiService		chorbiService;


	// Constructors -----------------------------------------------------------

	public CreditCardChorbiController() {
		super();
	}

	// Listing ----------------------------------------------------------------		
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView result;
		CreditCard creditCard;
		Chorbi chorbi;

		chorbi = this.chorbiService.findByPrincipal();
		creditCard = this.creditCardService.findByChorbi(chorbi.getId());

		result = new ModelAndView("creditCard/list");
		result.addObject("requestURI", "creditCard/chorbi/list.do");
		result.addObject("creditCard", creditCard);
		result.addObject("principalId", chorbi.getId());

		return result;
	}

	// Creation ---------------------------------------------------------------		
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView edit() {
		ModelAndView result;
		CreditCardForm creditCardForm;
		CreditCard creditCard;

		creditCard = this.creditCardService.create();
		creditCardForm = this.creditCardService.desreconstruct(creditCard);

		result = this.createEditModelAndView(creditCardForm);

		return result;
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST, params = "save")
	public ModelAndView save(@Valid final CreditCardForm creditCardForm, final BindingResult binding) {

		ModelAndView result;
		CreditCard creditCard;

		if (binding.hasErrors()) {
			System.out.println(binding.toString());
			result = this.createEditModelAndView(creditCardForm);

		} else
			try {
				creditCard = this.creditCardService.reconstruct(creditCardForm, "create");
				creditCard = this.creditCardService.save(creditCard);
				result = new ModelAndView("redirect:list.do");

			} catch (final Throwable oops) {
				System.out.println(oops);

				result = this.createEditModelAndView(creditCardForm, "creditCard.commit.error");

			}
		return result;

	}

	// Edition ----------------------------------------------------------------		
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView edit(@RequestParam final int creditCardId) {
		ModelAndView result;
		CreditCard creditCard;
		CreditCardForm creditCardForm;

		creditCard = this.creditCardService.findOne(creditCardId);
		Assert.notNull(creditCard);

		creditCardForm = this.creditCardService.desreconstruct(creditCard);

		result = this.createEditModelAndViewEdit(creditCardForm);

		return result;
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView saveEdit(@Valid final CreditCardForm creditCardForm, final BindingResult binding) {

		ModelAndView result;
		CreditCard creditCard;

		if (binding.hasErrors()) {
			System.out.println(binding.toString());
			result = this.createEditModelAndViewEdit(creditCardForm);

		} else
			try {
				creditCard = this.creditCardService.reconstruct(creditCardForm, "edit");
				creditCard = this.creditCardService.save(creditCard);
				result = new ModelAndView("redirect:list.do");

			} catch (final Throwable oops) {
				System.out.println(oops);

				result = this.createEditModelAndViewEdit(creditCardForm, "creditCard.commit.error");

			}
		return result;

	}

	//Delete ------------------------------------------------------------------------

	@RequestMapping(value = "/delete", method = RequestMethod.POST, params = "delete")
	public ModelAndView delete(@RequestParam final int creditCardId) {
		ModelAndView result = new ModelAndView();
		final CreditCard creditCard = this.creditCardService.findOne(creditCardId);

		try {
			this.creditCardService.delete(creditCard);
			result = new ModelAndView("redirect:list.do");
		} catch (final Throwable oops) {
			System.out.println(oops.getMessage());

			CreditCardForm creditCardForm;

			creditCardForm = this.creditCardService.desreconstruct(creditCard);

			result = this.createEditModelAndView(creditCardForm, "creditCard.commit.error");
		}
		return result;
	}

	//	@RequestMapping(value = "/delete", method = RequestMethod.POST, params = "delete")
	//	public ModelAndView delete(final CreditCard creditCard, final BindingResult binding) {
	//		ModelAndView result;
	//
	//		try {
	//			this.creditCardService.delete(creditCard);
	//			result = new ModelAndView("redirect:../../creditCard/chorbi/list.do");
	//		} catch (final Throwable oops) {
	//			result = new ModelAndView("redirect:../../creditCard/chorbi/list.do");
	//		}
	//
	//		return result;
	//	}

	// Ancillary methods ------------------------------------------------------

	protected ModelAndView createEditModelAndView(final CreditCardForm creditCardForm) {
		ModelAndView result;

		result = this.createEditModelAndView(creditCardForm, null);

		return result;
	}

	protected ModelAndView createEditModelAndView(final CreditCardForm creditCardForm, final String message) {
		ModelAndView result;

		result = new ModelAndView("creditCard/create");
		result.addObject("creditCard", creditCardForm);
		result.addObject("requestURI", "creditCard/chorbi/create.do");
		result.addObject("message", message);

		return result;
	}

	protected ModelAndView createEditModelAndViewEdit(final CreditCardForm creditCardForm) {
		ModelAndView result;

		result = this.createEditModelAndViewEdit(creditCardForm, null);

		return result;
	}

	protected ModelAndView createEditModelAndViewEdit(final CreditCardForm creditCardForm, final String message) {
		ModelAndView result;

		result = new ModelAndView("creditCard/create");
		result.addObject("creditCard", creditCardForm);
		result.addObject("requestURI", "creditCard/chorbi/edit.do");
		result.addObject("message", message);

		return result;
	}

}
