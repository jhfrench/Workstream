<!-- common_files/act_log_email.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_log_email.cfm">
	<responsibilities>
		I record emails to the database so that we can know who sent what, when, to whom, etc.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="3/1/11" role="FuseCoder" comments="Created File">
			$Id:$
		</history>
	</properties>
	<IO>
		<in>
		</in>
		<passthrough>
		</passthrough>
		<out>
		</out>
	</IO>
</fusedoc>
--->
<cfscript>
if (NOT isdefined("variables.carbon_copy_to"))
	variables.carbon_copy_to="";
if (NOT isdefined("variables.created_by")) {
	if (isdefined("session.user_account_id"))
		variables.created_by=session.user_account_id;
	else
		variables.created_by=0;
}
//need to handle message bodies that are too large (instead of erroring)
if (len(attributes.email_body) GT 9999)
	variables.email_body="#left(attributes.email_body, 9989)#-TRUNCATED";
else
	variables.email_body=attributes.email_body;
</cfscript>
<cfinclude template="qry_insert_log_email.cfm">

<cfif isdefined("attributes.email_recipients_demographics_id")>
	<!--- Link_Email_Demographics --->			
	<cfinclude template="qry_insert_link_email_demographics.cfm">
</cfif>