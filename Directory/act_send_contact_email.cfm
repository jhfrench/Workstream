
<!--Directory/act_send_contact_email.cfm
	Author: Jeromy French-->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I send email to employee to change there contact information if any has changed recently.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	--> lname: string containing the last name of an employee
	--> name: string containing the first name of an employee
	--> email: string containing individual email addresses
 --->
</cfsilent>
<!--- $issue$: do we want to reactivate this? Looks like a scheduled process that needs some other pieces (like get_emails query). For now, the REF_Screen record is deactivated --->
<!--- paramed form variables (safety)--->
<cfparam name="fname" default="">
<cfparam name="lname" default="">
<cfparam name="endrow" default="0">

<cfif NOT comparenocase(cgi.https, "on")>
	<cfset variables.directory_url="https://">
<cfelse>
	<cfset variables.directory_url="http://">
</cfif>
<cfset variables.directory_url="#variables.directory_url##server_name##PATH_INFO#?fuseaction=Directory.employee_contact_view">

<!--- @ make sure if behind the dmz we are the only ones getting emails --->
<cfif left(cgi.http_host, 7) eq "10.1.1."> 
	<cfset application.emailserver="mail.nucleussolutions.com">
	<cfset variables.send_to="jeromy_french@hotmail.com">
</cfif>

<cfif isdefined("variables.send_to")>
	<cfset variables.email_name="variables.send_to">
	<cfset endrow=1>
<cfelse>
	<cfset variables.email_name="get_emails.email">
	<cfset endrow=get_emails.recordcount>
</cfif>

<cfif get_emails.recordcount>
	<cfloop query="get_emails" startrow="1" endrow="#endrow#">
		<!--- @ debug: <cfoutput>#evaluate(variables.email_name)#</cfoutput><br /> --->
		<cfmail to="#evaluate(variables.email_name)#" from="#application.erroremailfrom# " subject="Monthly Contacts Change Enquiry" server="#application.emailserver#" type="HTML">
		<p>Dear #fname# #lname#,<br />
		This is a monthly email sent to remind you to review your personal and employee data in #application.product_name#. Please <a href="#variables.directory_url#">make any necessary modifications</a>.</p>
		<p>Thank you.</p>
		</cfmail>
	</cfloop>
</cfif>