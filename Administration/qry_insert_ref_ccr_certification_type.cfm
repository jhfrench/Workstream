<!-- Administration/qry_insert_ref_ccr_certfication_type.cfm
	Author: Ping Liang -->
<!--- 
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_ref_ccr_certfication_type.cfm">
	<responsibilities>
		Query to insert a new ccr certfication type into REF_ccr_certfication_type table.
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

<cfquery name="insert_ref_ccr_certification_type" datasource="#application.datasources.main#">
INSERT INTO REF_CCR_Certification_Type (code, description, sort_order, 
	created_by, active_ind)
VALUES ('#attributes.code#', '#attributes.description#', #attributes.sort_order#, 
	#session.user_account_id#, #attributes.active_ind#)
</cfquery>