
<!--Reports/Act_Manager_Cross_Tab_Mail.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the action page that does all the work to email John Burns when a manager signs off 
	on the fact they viewed and approved the hours that their subordinates have entered.  The email should contain 
	the name of the manager and the dates that the manager verified the hours for.

	||
	Edits:
	$Log$
	||
	Variables:
	--> name: the managers first name
	--> lname: The managers last name
	--> from_date: this is the beginning of the date range of the report.
	--> through_date: this is the end of the date range of the report.
	END FUSEDOC --->
	

<!---  <cfif  cgi.SERVER_NAME is "10.1.1.111" or  cgi.SERVER_NAME is "nautica"  or cgi.SERVER_NAME is "10.1.1.224" or cgi.SERVER_NAME is "10.1.1.40">
	<cfset variables.recipient="#recipient_email#">
<cfelse>
	<cfset variables.recipient="jburns@lewisco.com">
</cfif>--->
</cfsilent>

<cfinclude template="qry_find_notification_recipient.cfm"> 
<cfmail type="HTML" to="#notification_recipient.recipient_email#" from="#application.erroremailfrom#" subject="Manager's Verification of Hours" server="#application.emailserver#">
<cfmailparam name="Reply-To" value="jeromy_french@hotmail.com">
<pre>John, 

	The manager #name# #lname# has verified the hours for his/her employees for the dates 
	between #from_date# and #through_date#.

Thank You,

NGuage


Note: This message was automatically generated by workstream, the Nucleus Technologies web-based management system.</pre>
</cfmail>
<cflocation url="index.cfm" addtoken="No">
