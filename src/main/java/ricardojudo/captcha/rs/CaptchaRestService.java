package ricardojudo.captcha.rs;

import javax.annotation.PostConstruct;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Application;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ricardojudo.captcha.Captcha;
import ricardojudo.captcha.CaptchaException;
import ricardojudo.captcha.CaptchaGenerator;
import ricardojudo.captcha.CaptchaValidation;
import ricardojudo.captcha.impl.SimpleCaptchaGenerator;

@Path("captchas")
@Produces({ MediaType.APPLICATION_JSON })
@Consumes({ MediaType.APPLICATION_FORM_URLENCODED, MediaType.APPLICATION_JSON })
public class CaptchaRestService extends Application {

	private static final Logger LOGGER = LoggerFactory.getLogger(CaptchaRestService.class);

	private CaptchaGenerator captchaGenerator;

	@PostConstruct
	protected void initialize() {
		LOGGER.debug("Iniciando Captcha Rest Service");
		captchaGenerator = new SimpleCaptchaGenerator();
	}

	@GET
	public Response get() throws CaptchaException {
		Captcha captcha = captchaGenerator.generate();
		return Response.ok(captcha).build();
	}

	@POST
	public Response validate(CaptchaValidation validation) {
		LOGGER.debug("Validation: "+ validation.toString());
		Response response = null;
		if (validation.isValid()) {
			response = Response.ok().build();
		} else {
			response = Response.status(Status.BAD_REQUEST).build();
		}
		return response;
	}
	
	@POST
	@Path("validate")
	public Response validate2(){
		return Response.ok().build();
	}

}
