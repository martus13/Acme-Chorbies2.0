
package services;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import repositories.ChirpRepository;
import domain.Actor;
import domain.Chirp;
import domain.Chorbi;
import domain.Event;
import domain.Manager;

@Service
@Transactional
public class ChirpService {

	//Managed repository-----------------------------------
	@Autowired
	private ChirpRepository	chirpRepository;

	//Supporting services----------------------------------

	@Autowired
	private ChorbiService	chorbiService;

	@Autowired
	private ManagerService	managerService;

	@Autowired
	private EventService	eventService;

	@Autowired
	private ActorService	actorService;


	//Constructors----------------------------------------

	public ChirpService() {
		super();
	}

	//Simple CRUD methods----------------------------------

	public Chirp findOne(final int chirpId) {
		Assert.notNull(chirpId);
		Assert.isTrue(chirpId != 0);

		final Chirp result = this.chirpRepository.findOne(chirpId);

		return result;
	}

	public Collection<Chirp> findAll() {

		final Collection<Chirp> result = this.chirpRepository.findAll();
		Assert.notNull(result);

		return result;
	}

	public Chirp create(final Actor receiver) {
		Assert.notNull(receiver);

		final Chirp result = new Chirp();
		Actor sender;
		Collection<String> attachments;

		final Calendar thisMoment = Calendar.getInstance();
		thisMoment.set(Calendar.MILLISECOND, -10);

		attachments = new ArrayList<String>();

		sender = this.chorbiService.findByPrincipal();
		Assert.notNull(sender);
		Assert.isTrue(sender.getId() != receiver.getId());

		if (this.actorService.checkAuthority(sender, "CHORBI")) {
			Chorbi chorbi;

			chorbi = this.chorbiService.findOne(sender.getId());
			Assert.isTrue(!chorbi.getBanned());
		}

		result.setSentMoment(thisMoment.getTime());
		result.setSender(sender);
		result.setRecipient(receiver);
		result.setCopy(false);
		result.setAttachments(attachments);

		return result;
	}

	public Chirp save(final Chirp chirp) {

		Assert.notNull(chirp);
		Assert.isTrue(chirp.getSender().equals(this.chorbiService.findByPrincipal()));
		Assert.isTrue(chirp.getSender().getId() != chirp.getRecipient().getId());
		Assert.isTrue(this.validatorURL(chirp.getAttachments()));

		if (this.actorService.checkAuthority(chirp.getSender(), "CHORBI")) {
			Chorbi chorbi;

			chorbi = this.chorbiService.findOne(chirp.getSender().getId());
			Assert.isTrue(!chorbi.getBanned());
		}

		final Chirp copiedChirp = chirp;
		final Chirp result = this.chirpRepository.save(chirp);

		copiedChirp.setCopy(true);
		this.chirpRepository.save(copiedChirp);

		return result;
	}

	public void deleteSentChirp(final Chirp chirp) {
		Assert.notNull(chirp);
		Assert.isTrue(chirp.getCopy() == false);
		Assert.isTrue(chirp.getSender().equals(this.chorbiService.findByPrincipal()));

		if (this.actorService.checkAuthority(chirp.getSender(), "CHORBI")) {
			Chorbi chorbi;

			chorbi = this.chorbiService.findOne(chirp.getSender().getId());
			Assert.isTrue(!chorbi.getBanned());
		}

		this.chirpRepository.delete(chirp);

	}

	public void deleteReceivedChirp(final Chirp chirp) {
		Assert.notNull(chirp);
		Assert.isTrue(chirp.getCopy() == true);
		Assert.isTrue(chirp.getRecipient().equals(this.chorbiService.findByPrincipal()));
		
		if (this.actorService.checkAuthority(chirp.getSender(), "CHORBI")) {
			Chorbi chorbi;

			chorbi = this.chorbiService.findOne(chirp.getSender().getId());
			Assert.isTrue(!chorbi.getBanned());
		}


		this.chirpRepository.delete(chirp);
	}

	public Chirp reply(final Chirp chirp) {

		Chorbi chorbi;
		Chirp result;

		chorbi = this.chorbiService.findByPrincipal();
		Assert.isTrue(chirp.getRecipient().equals(chorbi));

		result = this.create((Chorbi) chirp.getSender());

		result.setSubject("Re: " + chirp.getSubject());

		return result;

	}

	public Chirp resend(final Chirp chirp) {

		Chirp forwarded;
		Chorbi chorbi;

		chorbi = this.chorbiService.findByPrincipal();
		Assert.isTrue(chirp.getSender().equals(chorbi));

		forwarded = this.create(chirp.getRecipient());

		forwarded.setSubject("Fw: " + chirp.getSubject());
		forwarded.setText(chirp.getText());
		forwarded.setAttachments(chirp.getAttachments());

		forwarded = this.save(forwarded);

		return forwarded;

	}

	public void sendChorbiesRegistered(final Event event, final String subject, final String text) {
		int i = 0;
		Page<Chorbi> pagesChorbies;
		List<Chorbi> chorbies;
		Actor actor;

		actor = this.actorService.findByPrincipal();
		Assert.isTrue(this.actorService.checkAuthority(actor, "MANAGER")); // Esto solo pueden hacerlo los managers

		pagesChorbies = this.chorbiService.findByEventIdPaged(event.getId(), i, 2);
		chorbies = pagesChorbies.getContent();

		for (final Chorbi c : chorbies) {
			Chirp chirp;

			chirp = this.create(actor);
			chirp.setSubject(subject);
			chirp.setText(text);
			chirp.setRecipient(c);

			chirp = this.save(chirp);

		}

		while (pagesChorbies.hasNextPage()) {
			i++;
			Page<Chorbi> nextPageChorbiesPages;
			List<Chorbi> nextPageChorbiesList;

			nextPageChorbiesPages = this.chorbiService.findByEventIdPaged(event.getId(), i, 2);
			nextPageChorbiesList = nextPageChorbiesPages.getContent();

			if (!nextPageChorbiesList.isEmpty())
				for (final Chorbi c : nextPageChorbiesList) {
					Chirp chirp;

					chirp = this.create(actor);
					chirp.setSubject(subject);
					chirp.setText(text);
					chirp.setRecipient(c);

					chirp = this.save(chirp);
				}
			else
				break;

		}

	}
	//Other business methods------------------------------

	public Collection<Chirp> findAllMySentChirps(final Chorbi chorbi) {

		Assert.notNull(chorbi);
		Assert.isTrue(chorbi.getId() != 0);

		final Collection<Chirp> result = this.chirpRepository.findAllMySentChirps(chorbi.getId());

		return result;
	}

	public Collection<Chirp> findAllMyReceivedChirps(final Chorbi chorbi) {

		Assert.notNull(chorbi);
		Assert.isTrue(chorbi.getId() != 0);

		final Collection<Chirp> result = this.chirpRepository.findAllMyReceivedChirps(chorbi.getId());

		return result;
	}

	public Double[] findMinMaxAvgReceived() {

		final Double[] result = new Double[3];

		result[0] = this.chirpRepository.findMinReceived();
		result[1] = this.chirpRepository.findMaxReceived();
		result[2] = this.chirpRepository.findAvgReceived();

		return result;
	}

	public Double[] findMinMaxAvgSent() {

		final Double[] result = new Double[3];

		result[0] = this.chirpRepository.findMinChirpsSent();
		result[1] = this.chirpRepository.findMaxChirpsSent();
		result[2] = this.chirpRepository.findAvgChirpsSent();

		return result;
	}

	//Devuelve true si la collection esta vacia o si las URLs contenidas en ellas son URLs validas
	public Boolean validatorURL(final Collection<String> lista) {
		Boolean res = false;
		if (!lista.isEmpty()) {
			for (final String aux : lista)
				if (aux.length() > 11) {
					if ((aux.subSequence(0, 11).equals("http://www.") || (aux.subSequence(0, 4).equals("www.")) || (aux.subSequence(0, 8).equals("https://")) || (aux.subSequence(0, 7).equals("http://")) || (aux.subSequence(0, 12).equals("https://www."))))
						res = true;
					else {
						res = false;
						break;
					}
				} else {
					res = false;
					break;
				}
		} else
			res = true;

		return res;
	}

	public void broadcastChirp(final Chirp chirp) {
		Assert.notNull(chirp);

		final Manager manager = this.managerService.findByPrincipal();
		Assert.notNull(manager);

		final Collection<Event> events = this.eventService.findByManagerId(manager.getId());

		for (final Event e : events){
			
			this.sendChorbiesRegistered(e, chirp.getSubject(), chirp.getText());
		}
	}
}
