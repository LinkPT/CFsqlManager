

<CFTRY>
	
	

	<!--- prevent sql injections --->

	<!--- initialize variables --->
	<CFSET VARIABLES.messageError = "">
	<CFSET VARIABLES.errorFound="0">
	<CFSET VARIABLES.injectionId=ListLast(createUUID(), "-")>
	<CFSET VARIABLES.insSql = "insert|delete|select|update|create|alter|drop|truncate|grant|revoke|declare|exec|backup|restore|sp_|xp_|set|execute|dbcc|deny|union|Cast|Char|Varchar|nChar|nVarchar">
	<CFSET VARIABLES.regEx="([[:space:]]+(or)[[:space:]]+\(*'?[[:print:]]+'?([[:space:]]*[\+\-\/\*][[:space:]]*'?[[:print:]]+'?)*\)*[[:space:]]*(([=><!]{1,2}|(like))[[:space:]]*\(*'?[[:print:]]+'?([[:space:]]*[\+\-\/\*][[:space:]]*'?[[:print:]]+'?)*\)*)|((in)[[:space:]]*\(+[[:space:]]*'?[[:print:]]+'?(\,[[:space:]]*'?[[:print:]]+'?)*\)+)|((between)[[:space:]]*\(*[[:space:]]*'?[[:print:]]+'?(\,[[:space:]]*'?[[:print:]]+'?)*\)*(and)[[:space:]]+\(*[[:space:]]*'?[[:print:]]+'?(\,[[:space:]]*'?[[:print:]]+'?)*\)*)|((;)([^a-z>]*)(#VARIABLES.insSql#)([^a-z]+|$))|(union[^a-z]+(all|select))|(\/\*)|(--$))">
	
	<!--- Loop through all existing FORM fields --->
	<CFLOOP COLLECTION=#FORM# ITEM="FORMParameter">
		<!--- Detect a SQL with the Regular expression --->
		<CFIF FORMParameter NEQ "FIELDNAMES" AND ReFindNoCase(VARIABLES.regEx, FORM[FORMParameter]) NEQ "0">
			<CFSET VARIABLES.errorFound="1">
			<CFSET VARIABLES.offendingString="#FORMParameter#: #FORM[FORMParameter]#">
			<CFBREAK>
		</CFIF>
	</CFLOOP>
	
	<!--- If there was not an SQL injection attemp in the FORM fields, look at the URL --->
	<CFIF VARIABLES.errorFound IS "0">
		<!--- Loop through all existing URL parameters --->
		<CFLOOP COLLECTION=#URL# ITEM="URLParameter">
			<!--- If there was a SQL injection --->
			<CFIF URLParameter IS NOT "message" AND ReFindNoCase(VARIABLES.regEx, URL[URLParameter]) NEQ "0">
				<CFSET VARIABLES.errorFound="1">
				<CFSET VARIABLES.offendingString="#URLParameter#: #URL[URLParameter]#; QUERY_STRING: #CGI.QUERY_STRING#">
				<CFBREAK>
			</CFIF>
		</CFLOOP>
	</CFIF>
	
	<CFIF VARIABLES.errorFound IS "1">
		error!!!
	</CFIF>

<!--- dinamic query --->


<CFQUERY NAME="query" USERNAME="#SESSION.cstData.cstDBUsername#" PASSWORD="#SESSION.cstData.cstDBPassword#" DATASOURCE="#SESSION.cstData.ds#">

	DECLARE @sql nvarchar(4000)

	SELECT @sql = 'select top 10 * from events '

	EXEC sp_executesql @sql
	
</CFQUERY>

<CFDUMP var="#query#" />


	<CFCATCH TYPE="Any">
		<CFOUTPUT>
			message\: #CFCATCH.message#<br>
			detail\: #CFCATCH.detail#<br>
			
		</CFOUTPUT>
	</CFCATCH>
	
</CFTRY>