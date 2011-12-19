
<!--Directory/act_send_contact_email.cfm
	Author: Victor B.-->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I send email to employee to change there contact information if any has changed recently.
	||
	Name: Victor Blell
	||
	Edits:
	$Log$
	Revision 1.0  2005/02/15 20:46:22  daugherty
	Initial revision

	Revision 1.2  2003-08-04 14:25:55-04  blell
	initial creation
	||
	--> lname: string containing the last name of an employee
	--> name: string containing the first name of an employee
	--> email: string containing individual email addresses
 --->
<!--- paramed form variables (safety)--->
<cfparam name="fname" default="">
<cfparam name="lname" default="">
<cfparam name="endrow" default="0">

	<cfif https eq "on">
		<cfset hyperlinkedTo="https://">
	<cfelse>
		<cfset hyperlinkedTo="http://">
	</cfif>
	<cfset hyperlinkedTo="#hyperlinkedTo##server_name##PATH_INFO#?fuseaction=employee_contact_view">
	
	<!--- @ make sure if behind the dmz we are the only ones getting emails --->
	
	<cfif left(cgi.http_host, 7) eq "10.1.1."> 
		<cfset application.emailserver="mail.nucleussolutions.com">
		<cfset variables.send_to="blell@nucleusweb.com">
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
			<!--- @ debug: <cfoutput>#evaluate(variables.email_name)#</cfoutput><br> --->
			<cfmail to="#evaluate(variables.email_name)#" from="#application.erroremailfrom# " subject="Monthly Contacts Change Enquiry" server="#application.emailserver#" type="HTML">
				<table width="80%">
					<tr>
						<td>
							Dear #fname# #lname#,<br>
							This is a monthly email sent to remind you to review your personal and employee data in workstream. Please <a href="#hyperlinkedTo#">use this link</a> to make any necessary modifications.

							Thank you.
						</td>
					</tr>
				</table>
			</cfmail>
		</cfloop>
	</cfif>
