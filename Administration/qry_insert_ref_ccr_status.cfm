<!--- Administration/qry_insert_ref_ccr_status.cfm
	Author: Ping Liang--->
<!--- 
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_ref_ccr_status.cfm">
	<responsibilities>
		Query to insert a new ccr status into REF_ccr_status table.
	</responsibilities>
	<properties>
		<history email="pliang@nasa.gov" author="Ping Liang" type="create" date="6/19/2009" role="FuseCoder" comments="Created File">
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

<cfquery name="insert_ref_ccr_status" datasource="#application.datasources.main#">
INSERT INTO REF_CCR_Status (description, sort_order, created_by, 
	active_ind)
VALUES ('#attributes.description#', #attributes.sort_order#, #session.user_account_id#,	
	#attributes.active_ind#)
</cfquery>