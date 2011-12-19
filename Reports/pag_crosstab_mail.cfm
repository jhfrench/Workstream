
<!--Reports/pag_crosstab_mail.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain all the code for the crosstab reports' email verification function.

	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
</cfsilent>
<cfif NOT isdefined("name") or NOT isdefined("lname") or NOT IsDefined ("from_date") or NOT IsDefined ("through_date")>
	<cfinclude template="error1.cfm">
<cfelse>
	<cfinclude template="Act_Manager_Cross_Tab_Mail.cfm">
</cfif>

