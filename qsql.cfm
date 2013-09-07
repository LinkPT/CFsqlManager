<cfsetting showdebugoutput="yes">

<cfif isDefined("session") AND NOT StructKeyExists(session, "login") >
	<cfset variables.message="Empty Username and/or Password. Please try again.">
	<cflocation url="index.cfm?message=#UrlEncodedFormat(VARIABLES.message)#">

</cfif> 


<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Project</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<meta name="description" content="">
		<meta name="author" content="">

		<!-- Bootstrap css -->
		<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
		<!--- enable responsive --->
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link href="css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">

		<style type="text/css"> 
			#sessionDetails {
				display: none;
			}

			#sqlText {
				width: 100%;



			}
/* 
  
			.well {
				min-height: 20px;
				padding: 19px;
				margin-bottom: 20px;
				background-color: #1c1e22;
				border: 1px solid #0c0d0e;
				border-radius: 4px;
				-webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,0.05);
				box-shadow: inset 0 1px 1px rgba(0,0,0,0.05);
			}    
			.jumbotron {
				padding: 30px;
				margin-bottom: 30px;
				font-size: 21px;
				font-weight: 200;
				line-height: 2.1428571435;
				color: inherit;
				background-color: #1c1e22; 
			}
			.blockquote {
				display: block;
				-webkit-margin-before: 1em;
				-webkit-margin-after: 1em;
				-webkit-margin-start: 40px;
				-webkit-margin-end: 40px;
			}

 */

			.footer {
				position: relative;
				bottom: 0;
				width: 100%;
				text-align: center;
				padding: 10px 0;
				margin-top: 50px;
				border-top: 1px solid #e5e5e5;
				background-color: #f5f5f5;
			}

			#footer {
				width: 100%;
				text-align: center;
				padding: 20px 0;
				margin-top: 50px;
				border-top: 1px solid #e5e5e5;
				background-color: #f5f5f5;
			}

			.footer p {
				margin-bottom: 0;
				color: #777;
			}
			.footer-links {
				margin: 10px 0;
			}
			.footer-links li {
				display: inline;
				padding: 0 2px;
			}
			.footer-links li:first-child {
				padding-left: 0;
			}
		
			 
			
		</style>
		
		<script src="js/jquery.js"></script>
		<script src="js/bootstrap.min.js"></script>

		<script type="text/javascript">
			$(document).ready(function() {
				
				//event hadlers
				$( "#queryBtn" ).click(function() {
					request();
				});
				$( "#sessionBtn" ).click(function() {
					showSessionDetails();
				}); 

<!--- 
				<CFIF StructKeyExists(url, "message")>

					if( <CFOUTPUT>"#URL.message#"</CFOUTPUT> =! "" ){



					}
					
				</CFIF> --->

				var t=setTimeout(function(){
					$("#messages").hide("slow");
				},2000);

			});

			//request example...
			function request(){
				$.ajax({
					url: 'myApp_ajax.cfm',
					type: 'GET',
					dataType: 'xml',
					data: "",
					success: function(xmlObj) {
						//called when successful
						var text = $(xmlObj).find('messages').text();
						//populate div
						alert(text);

						$("#sessionDetails").html(text);

						$("#sessionDetails").show("slow");
					},
					error: function(xhr, textStatus) {
						//called when there is an error                        
						alert("There was an error with your request");
					}
				});
			}

			//show hide function
			function showSessionDetails(){
				if( $("#sessionDetails").css("display") == "none"){
					$("#sessionDetails").show("slow");
					$("#sessionBtn").html("Hide Details");

				}else{
					$("#sessionDetails").hide("slow");
					$("#sessionBtn").html("Show Details");
				}
			}





		</script>
	</head>
	<body>
		<!--- header menu --->
		<div class="navbar navbar-inverse navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container">
					<button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="brand" href="#">myApp</a>
					<div class="nav-collapse collapse">
						<ul class="nav">
							<li class="active"><a  href="#home">Home</a></li>
							<li><a href="#about">About</a></li>
							<li><a href="#contact">Contact</a></li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">Projects <b class="caret"></b></a>
								<ul class="dropdown-menu">
									<li><a href="#">Web...</a></li>
									<li><a href="#">Mibile...</a></li>
									<li><a href="#">Something else here</a></li>
									<li class="divider"></li>
									<li class="nav-header">Mobile</li>
									<li><a href="#">Android</a></li>
									<li><a href="#">Arduino</a></li>
									<li><a href="#">RaspBery Pi</a></li>
								</ul>
							</li>							
						</ul> 					
						 
 
						<span class="navbar-form pull-right">
							legged in as: ARTUR
						</span>

						<!--- Login form  
						<form id="login" class="navbar-form pull-right" method="post" action="qsql.cfm">
							<input name="user" type="text" placeholder="Email">
							<input name="pass" type="password" id="inputPassword" class="input-medium" required="required" data-error="Please give a correct password." placeholder="Password">
							<button type="submit" name="login" class="btn">logIn</button>
						</form>
						 --->
					</div>
				</div>
			</div>
		</div><!--- /.navbar --->

 
		<!--- main data container --->
		<div class="container">
			<div class="hero-unit" id="home" >
				<h1>qsl query</h1>
				<p>In development.....</p>
			</div>


		<div id="messages" class="alert alert-success">
			<CFIF StructKeyExists(URL, "message")>
				<!--- show message ---> 
				<CFOUTPUT>#url.message#</CFOUTPUT>
			</CFIF>
		</div>
			<div class="row">
				<div class="span12">
					<div class="well">
						<h2>Type your sql query</h2>
						<p>

							<form id="form" name="query">
								<textarea id="sqlText" name="sqlText" name="sqlText" rows="5"></textarea>
								<button type="submit" class="btn" onClick="request(); return false;">Submit</button>
							</form>
						</p>
						<p>
							<!-- Button to trigger modal -->
							<a id="sessionBtn" role="button" class="btn">View details &raquo;</a>
						</p>
					</div>
				</div>
				 
			</div>
			<hr>

			<!--- hidden div --->
			<div class="row" id="sessionDetails"> 
				<h2>Details</h2>                
				<!--- get active sessions --->
				 
				 
			</div>

			<CFDUMP label="form" var="#FORM#" />
			<cfif StructKeyExists(session, "login") >
				<CFDUMP label="session" var="#session.login#" />
			</cfif>
		
		<!--- 
				<footer class="footer">
					<div class="container">
						<ul class="footer-links">
							<li><a href="#home">Home</a></li>
							<p>myApp 2013</p>
						</ul>
					</div>
				</footer>
			 --->
		</div><!--end .container --> 
		<!-- Footer -->
		<div id="footer">
			<div class="container">
				<ul class="footer-links">
					<li><a href="#home">Home</a></li>
					<p>myApp 2013</p>
				</ul>
			</div>
		</div>
		
	</body>
</html>