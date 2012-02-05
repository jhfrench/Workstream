<!-- common_files/act_insert_address.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_insert_address.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="7/1/2009" role="FuseCoder" comments="Created File">
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
<cfparam name="attributes.mailing_name" default="">
<cfquery name="insert_address" datasource="#application.datasources.main#">
INSERT INTO Address (mailing_name, street_1, street_2,
	city, state_province_id, postal_code,
	country_id, created_by)
VALUES ('#attributes.mailing_name#', '#attributes.street_1#', '#attributes.street_2#',
	'#attributes.city#', '#attributes.state_province_id#', '#attributes.postal_code#',
	'#attributes.country_id#', #session.user_account_id#)
</cfquery>
<cfquery name="get_address_id" datasource="#application.datasources.main#">
SELECT IDENT_CURRENT('ADDRESS') AS address_id
</cfquery>
<cfset caller.attributes.address_id=get_address_id.address_id>