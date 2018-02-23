package ricardojudo.captcha;

public interface CaptchaGenerator {
	Captcha generate() throws CaptchaException;
}
