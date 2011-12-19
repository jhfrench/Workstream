<!-- common_files/qry_insert_help_faq.cfm
	Author: Jeromy French -->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_help_faq.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="5/25/2009" role="FuseCoder" comments="Created File">
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
<cfparam name="attributes.answer" default="">
<cfparam name="attributes.answered_by" default="">
<cfparam name="attributes.asker_email_address" default="">
<cfparam name="attributes.email_requested_ind" default="0">
<cfif len(attributes.answered_by)>
	<cfset variables.answer_null="no">
<cfelse>
	<cfset variables.answer_null="yes">
</cfif>
<cfparam name="attributes.public_ind" default="0">
<cfparam name="attributes.sort_order" default="#dateformat(now(), 'yyyymmdd')#">
<cfquery name="insert_help_faq" datasource="#application.datasources.main#">
INSERT INTO Help_FAQ (question, email_requested_ind, asker_email_address,
	answer, asked_by, answered_by,
	public_ind, sort_order, created_by)
VALUES (<cfqueryparam cfsqltype="cf_sql_varchar" value="#attributes.question#">, <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.email_requested_ind#">, <cfqueryparam cfsqltype="cf_sql_varchar" value="#attributes.asker_email_address#">,
	<cfqueryparam cfsqltype="cf_sql_varchar" value="#attributes.answer#">, #variables.created_by#, <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.answered_by#" null="#variables.answer_null#">,
	<cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.public_ind#">, <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.sort_order#">, #variables.created_by#)
</cfquery>