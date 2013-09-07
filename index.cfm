
<cfif isDefined("FORM") AND StructKeyExists(form, "email") AND StructKeyExists(form, "pass") >


	<!--- validate and encrypt login... --->

	<cfset session.login = structNew()>
	<cfset session.login.user = form.email>
	<cfset session.login.pass = form.pass>

	 
	<cfset variables.message="User successfully loggedIn">
	 <cflocation url="qsql.cfm?message=#UrlEncodedFormat(VARIABLES.message)#">
</cfif> 



<!DOCTYPE html>
<html lang="en">
  <head>
	<meta charset="utf-8">
	<title>Project</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">

	<!-- Le styles -->
	<link href="css/bootstrap.css" rel="stylesheet">
	<style type="text/css">
	  body {
		padding-top: 40px;
		padding-bottom: 40px;
		background-color: #f5f5f5;
	  }

	  .form-signin {
		max-width: 300px;
		padding: 19px 29px 29px;
		margin: 0 auto 20px;
		background-color: #fff;
		border: 1px solid #e5e5e5;
		-webkit-border-radius: 5px;
		   -moz-border-radius: 5px;
				border-radius: 5px;
		-webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
		   -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
				box-shadow: 0 1px 2px rgba(0,0,0,.05);
	  }
	  .form-signin .form-signin-heading,
	  .form-signin .checkbox {
		margin-bottom: 10px;
	  }
	  .form-signin input[type="text"],
	  .form-signin input[type="password"] {
		font-size: 16px;
		height: auto;
		margin-bottom: 15px;
		padding: 7px 9px;
	  }

	</style>
	<link href="css/bootstrap-responsive.css" rel="stylesheet">

	<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
	  <script src="../assets/js/html5shiv.js"></script>
	<![endif]-->

	<!-- Fav and touch icons -->
	<link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
	<link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
	  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
					<link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
								   <link rel="shortcut icon" href="../assets/ico/favicon.png">
  </head>

  <body>

	<div class="container">
		<div class="alert alert-error">
		  	Empty Username and/or Password. Please try again.

			<CFIF StructKeyExists(URL, "message")>
				<!--- show message --->
			</CFIF>
		</div>

		<form class="form-signin" method="post" action="index.cfm">
			<h2 class="form-signin-heading">Please sign in</h2>
			<input name="email" type="text"		class="input-block-level" placeholder="Email address">
			<input name="pass"  type="password" class="input-block-level" placeholder="Password">
			<label class="checkbox">
			  <input type="checkbox" value="remember-me"> Remember me
			</label>
			<button class="btn btn-large btn-primary" type="submit">Sign in</button>
 
			<!--- por aki as validacoes de js..... --->

		</form>
	</div> <!-- /container -->



<CFDUMP var="#form#" />
<cfif StructKeyExists(session, "login") >
	<CFDUMP label="session" var="#session.login#" />
</cfif>
 

	<!-- Le javascript
	================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap-transition.js"></script>
	<script src="js/bootstrap-alert.js"></script>
	<script src="js/bootstrap-modal.js"></script>
	<script src="js/bootstrap-dropdown.js"></script>
	<script src="js/bootstrap-scrollspy.js"></script>
	<script src="js/bootstrap-tab.js"></script>
	<script src="js/bootstrap-tooltip.js"></script>
	<script src="js/bootstrap-popover.js"></script>
	<script src="js/bootstrap-button.js"></script>
	<script src="js/bootstrap-collapse.js"></script>
	<script src="js/bootstrap-carousel.js"></script>
	<script src="js/bootstrap-typeahead.js"></script>

  </body>
</html>
