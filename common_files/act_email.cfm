
<!--common_files/act_email.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I send emails based on user input.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.0  2005/02/15 20:41:02  daugherty
	Initial revision

	Revision 1.2  2002-04-11 16:25:59-04  lee
	changed email from address and added reply-to param
	
	Revision 1.1  2001-10-11 10:58:05-04  long
	added $log $ for edits.  To all CFM files that have fusedocs.
	
	(KL |8/9/01) Removed the hard coded email address to Jeromy and replaced it with "attributes.email_to".
	||
 --->
<cfparam name="attributes.email_subject" default="">
<cfparam name="attributes.email_to" default="">
<cfparam name="attributes.email_from" default="">
<cfparam name="attributes.email_type" default="">
<cfparam name="attributes.email_body" default="">
</cfsilent>
<cfmail subject="#attributes.email_subject#" to="#attributes.email_to#" from="#application.erroremailfrom#" server="#application.emailserver#" type="#attributes.email_type#">
<cfmailparam name="Reply-To" value="#attributes.email_from#">
#attributes.email_body#<cfif isdefined("attributes.task_id")>

<a href="http://#cgi.server_name#/index.cfm?fuseaction=Timekeeping.task_details&task_id=#attributes.task_id#">Use this link to view the task.</a>
</cfif>
</cfmail>

