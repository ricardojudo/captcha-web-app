package ricardojudo.captcha.rs;

import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;
import javax.ws.rs.ext.ExceptionMapper;
import javax.ws.rs.ext.Provider;

import ricardojudo.captcha.CaptchaException;

@Provider
public class CaptchaExceptionMapper implements ExceptionMapper<CaptchaException> {

	@Override
	public Response toResponse(CaptchaException e) {
		return Response.status(Status.INTERNAL_SERVER_ERROR).entity(new UnsuccessfulResponse(e)).build();
	}

}
