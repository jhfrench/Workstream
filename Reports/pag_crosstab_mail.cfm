
<!--Reports/pag_crosstab_mail.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain all the code for the crosstab reports' email verification function.

	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:10:41  stetzer
<>

Revision 1.1  2001-10-11 11:04:17-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	||
	END FUSEDOC --->
</cfsilent>
<cfif NOT isdefined("name") or NOT isdefined("lname") or NOT IsDefined ("from_date") or NOT IsDefined ("through_date")>
	<cfinclude template="error1.cfm">
<cfelse>
	<cfinclude template="Act_Manager_Cross_Tab_Mail.cfm">
</cfif>

