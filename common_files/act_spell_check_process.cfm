
<!--timekeeping/act_spell_check_process.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I use javascript to call a small child window that display the spell check entry form.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:41:10  daugherty
Initial revision

Revision 1.1  2001-10-11 10:58:00-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	||
 --->
<cfset onload="ReturnForm();">
<!--- Initialize ignore list if not present --->
<cfparam name="ignore" default="">
<!--- Process correction if there is one --->
<cfif isdefined("option")>
	<!--- If correct, then correct word --->
	<cfif NOT compare(option,"Correct")>
		<!--- Replace bad word with corrected word --->
		<cfset message=RemoveChars(message, position, length)>
		<cfset message=Insert(IIf(compare(trim(correctionm),""), DE(correctionm), DE(correction)), message, position-1)>
	<!--- If correct, then add to ignore list --->
	<cfelseif NOT compare(option,"Ignore")>
		<!--- This position is to be ignored --->
		<cfset ignore=ListAppend(ignore, position)>
	<!--- If done, then finish 
	<cfelseif NOT compare(option,"Done")>
		<!--- Outa here --->
		<cfinclude template="done.cfm">
		<cfabort>--->
	</cfif>
</cfif>

<!--- Perform spell check --->
<cflock name="spell" timeout="100">
	<cfx_spell text="#message#" name="spell" language="#language#">
</cflock>

<!--- Loop through results to find next error not in ignore list --->
<cfset next_found=1>
<cfoutput query="spell">
	<cfif next_found AND (NOT ListFind(ignore, position))>
		<cfset next_error=error>
		<cfset next_suggest=suggest>
		<cfset next_position=position>
		<cfset next_length=length>
		<cfset next_found=0>
	</cfif>
</cfoutput>

<cf_htmlhead>
<SCRIPT LANGUAGE="JavaScript">
	function ReturnForm() 
	{ <cfif next_found>
		var dispVal
		 opener.document.forms[0].<cfoutput>#formname#</cfoutput>.value=document.forms[0].message.value;
	</cfif>}
	<cfif next_found>
	window.close()
	</cfif>
</SCRIPT>
</cf_htmlhead>
