<!-- common_files/qry_insert_help_faq.cfm
	Author: Jeromy French -->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_help_faq.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="5/25/2009" role="FuseCoder" comments="Created File">
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
if (NOT isdefined("attributes.answer")) {
	attributes.answer="";
}
if (NOT isdefined("attributes.answered_by")) {
	attributes.answered_by="";
}
if (NOT isdefined("attributes.asker_email_address")) {
	attributes.asker_email_address="";
}
if (NOT isdefined("attributes.email_requested_ind")) {
	attributes.email_requested_ind=0;
}
if (NOT isdefined("attributes.public_ind")) {
	attributes.public_ind=0;
}
if (NOT isdefined("attributes.sort_order")) {
	attributes.sort_order=dateformat(now(), 'yyyymmdd');
}

if (len(attributes.answered_by)) {
	variables.answer_null="no";
}
else {
	variables.answer_null="yes";
}
</cfscript>

<!---
<cfoutput><h1>#attributes.answered_by#</h2></cfoutput>
<pre>
<cfoutput>
INSERT INTO Help_FAQ (question, email_requested_ind, asker_email_address,
	answer, asked_by, answered_by,
	public_ind, sort_order, created_by,
	active_ind)
VALUES ('#attributes.question#', '#attributes.email_requested_ind#', '#attributes.asker_email_address#',
	'#attributes.answer#', #variables.created_by#, #attributes.answered_by#  null="#variables.answer_null#",
	#attributes.public_ind#, #attributes.sort_order#, #variables.created_by#,
	#attributes.active_ind#)
</cfoutput>
</pre>
<cfabort>
--->

<cfquery name="insert_help_faq" datasource="#application.datasources.main#">
INSERT INTO Help_FAQ (question, email_requested_ind, asker_email_address,
	answer, asked_by, answered_by,
	public_ind, sort_order, created_by,
	active_ind)
VALUES (<cfqueryparam cfsqltype="cf_sql_varchar" value="#attributes.question#">, <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.email_requested_ind#">, <cfqueryparam cfsqltype="cf_sql_varchar" value="#attributes.asker_email_address#">,
	<cfqueryparam cfsqltype="cf_sql_varchar" value="#attributes.answer#">, #variables.created_by#, <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.answered_by#" null="#variables.answer_null#">,
	<cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.public_ind#">, <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.sort_order#">, <cfqueryparam cfsqltype="cf_sql_integer" value="#variables.created_by#" null="#variables.created_by_null#">,
	<cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.active_ind#">)
RETURNING help_faq_id
</cfquery>
<cfset attributes.help_faq_id=insert_help_faq.help_faq_id>