package ricardojudo.captcha.rs;

import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;
import javax.ws.rs.ext.ExceptionMapper;
import javax.ws.rs.ext.Provider;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ricardojudo.captcha.CaptchaGenerationException;

@Provider
public class CaptchaGenerationExceptionMapper implements ExceptionMapper<CaptchaGenerationException> {

	private static final Logger LOGGER = LoggerFactory.getLogger(CaptchaExceptionMapper.class);
	
	@Override
	public Response toResponse(CaptchaGenerationException e) {
		LOGGER.error(e.getLocalizedMessage());
		return Response.status(Status.INTERNAL_SERVER_ERROR).entity(new UnsuccessfulResponse(e)).build();
	}

}
