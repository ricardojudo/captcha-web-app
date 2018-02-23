<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
</head>
<body>
	<div class="container-fluid">
		<div class="jumbotron">
			<h2>Captcha Service</h2>
		</div>


		<div class="col-md-offset-3 col-md-6">
			<div class="col-md-12">
				<img alt="captcha"
					class="captcha-image col-xs-12 img-thumbnail img-responsive">

			</div>
			<div class="col-md-12">
				
					<div class="form-group">
						<div class="col-xs-7">
							<input class="captcha-text form-control"
								placeholder="Escriba el texto de la imagen" id="captcha-text">
						</div>
						<div class="col-xs-2">
							<button class="btn btn-primary btn-block  btn-lg captcha-refresh">
								<span class="glyphicon glyphicon-refresh"></span>
							</button>
						</div>
						<div class="col-xs-3">
							<button class="btn btn-primary btn-block  btn-lg captcha-verify">Verificar</button>
						</div>
					</div>
				
			</div>
		</div>
	</div>


	<script src="https://code.jquery.com/jquery-2.2.4.min.js"
		integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
		crossorigin="anonymous"></script>

	<!-- Latest compiled and minified JavaScript -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
		integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
		crossorigin="anonymous"></script>

	<script type="text/javascript">
		//<![CDATA[
		var captcha;

		var refreshCaptcha = function() {
			console.log('refresh');
			$.get('./resources/captchas', function(data) {
				captcha = data;
				imagesrc = "data:image/jpeg;base64, " + data.image
				$('.captcha-image').attr('src', imagesrc);
			})
		}

		var verifyCaptcha = function() {
			console.log('verify');
			var text = $('#captcha-text').val();
			var captchaValidation = {
				text : text,
				captchaSecret : captcha.captchaSecret
			}
			$.ajax({
				url : './resources/captchas',
				type : 'POST',
				data : JSON.stringify(captchaValidation),
				contentType : "application/json; charset=utf-8",
				dataType : 'json',
				process : false,
				statusCode:{
					200:function(){
					  alert('Verificacion exitosa');
					  refreshCaptcha();
					},
					400:function(){alert('CAPTCHA no verificado');}
				}
			});
			

			//refreshCaptcha();
		}

		$(document).ready(function() {
			refreshCaptcha();
			$('.captcha-refresh').click(refreshCaptcha);
			$('.captcha-verify').click(verifyCaptcha);
		});

		//]]>
	</script>
</body>
</html>
