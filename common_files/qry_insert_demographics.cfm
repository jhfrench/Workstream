<!-- common_files/qry_insert_demographics.cfm
	Author: Omoniyi Fajemidupe-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_demographics.cfm">
	<responsibilities>
	I enter information into Demographics table.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Omoniyi Fajemidupe" type="create" date="5/29/2007" role="FuseCoder" comments="Created File">
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
<cfparam name="attributes.user_account_id" default="NULL">
<cfparam name="attributes.first_name" default="">
<cfparam name="attributes.middle_initial" default="">
<cfparam name="attributes.title" default="">
<cfparam name="attributes.email_address" default="">
<cfparam name="attributes.center_id" default="NULL">
<cfparam name="attributes.uupic" default="">
<cfparam name="attributes.fax_phone" default="">
<cfquery name="insert_demographics" datasource="#application.datasources.main#">
INSERT INTO Demographics (user_account_id, last_name, first_name,
	middle_initial, email_address, work_phone,
	center_id, uupic, title,
	fax_phone, created_by)
VALUES(#attributes.user_account_id#, '#attributes.last_name#', '#attributes.first_name#',
	'#attributes.middle_initial#', '#attributes.email_address#', '#attributes.work_phone#',
	#attributes.center_id#, '#attributes.uupic#', '#attributes.title#',
	'#attributes.fax_phone#', #session.user_account_id#)
</cfquery>