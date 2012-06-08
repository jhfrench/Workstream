<!-- Administration/qry_insert_ref_fund.cfm
	Author: Jeromy French-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_ref_fund.cfm">
	<responsibilities>
		Query to insert fund into REF_Fund table and to find its ID.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/26/2007" role="FuseCoder" comments="Created File">
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
<cflock scope="application" timeout="30" throwontimeout="no" type="exclusive">
	<cfquery name="insert_ref_fund" datasource="#application.datasources.main#">
	INSERT INTO REF_Fund (description,created_by,active_ind)
	VALUES ('#attributes.description#', #session.user_account_id#,#attributes.active_ind#)
	</cfquery>
	<!--- get the id of the record just inserted --->
	<cfset attributes.fund_id=get_current_sequence_value("REF_Fund_Seq")>
</cflock>

<cfinclude template="../common_files/act_upload_fund.cfm">
