<cfprocessingdirective suppresswhitespace="yes" pageencoding="utf-8">
<cfsetting showdebugoutput="no">
<!--- 
<!--- Call component function --->
<cfset variables.obj = createobject("component", "myApp").getquery()>
<!--- return xmlObject--->
<cfoutput>#variables.obj#</cfoutput>
  --->



<!--- build xml object --->
<cfxml variable="xmlObject" casesensitive="yes">
    <root>
            <messages>sometext</messages>
    </root>
</cfxml>


</cfprocessingdirective>

