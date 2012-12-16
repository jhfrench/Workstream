
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
	--> last_name: string containing the last name of an employee
	--> name: string containing the first name of an employee
	--> email: string containing individual email addresses
 --->
</cfsilent>
<!--- $issue$: do we want to reactivate this? Looks like a scheduled process that needs some other pieces (like get_active_employee_email query). For now, the REF_Screen record is deactivated --->
<!--- paramed form variables (safety)--->
<cfparam name="fname" default="">
<cfparam name="last_name" default="">
<cfparam name="endrow" default="0">

<cfif NOT comparenocase(cgi.https, "on")>
	<cfset variables.directory_url="https://">
<cfelse>
	<cfset variables.directory_url="http://">
</cfif>
<cfset variables.directory_url="#variables.directory_url##server_name##PATH_INFO#?fuseaction=Directory.employee_contact_view">

<!--- @ make sure if behind the dmz we are the only ones getting emails --->
<cfif left(cgi.http_host, 7) eq "10.1.1."> 
	<cfset variables.send_to="jeromy_french@hotmail.com">
</cfif>

<cfif isdefined("variables.send_to")>
	<cfset variables.email_name="variables.send_to">
	<cfset endrow=1>
<cfelse>
	<cfset variables.email_name="get_active_employee_email.email">
	<cfset endrow=get_active_employee_email.recordcount>
</cfif>

<cfif get_active_employee_email.recordcount>
	<cfloop query="get_active_employee_email" startrow="1" endrow="#endrow#">
		<!--- @ debug: <cfoutput>#evaluate(variables.email_name)#</cfoutput><br /> --->
		<cfmail to="#evaluate(variables.email_name)#" from="#application.application_specific_settings.system_email_sender# " subject="Monthly Contacts Change Enquiry" server="#application.email_server_name#" type="HTML">
		<p>Dear #fname# #last_name#,<br />
		This is a monthly email sent to remind you to review your personal and employee data in #application.product_name#. Please <a href="#variables.directory_url#">make any necessary modifications</a>.</p>
		<p>Thank you.</p>
		</cfmail>
	</cfloop>
</cfif>