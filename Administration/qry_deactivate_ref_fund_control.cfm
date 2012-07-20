<!-- Administration/qry_deactivate_REF_Fund_control.cfm
	Author: Jeromy French-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_deactivate_REF_Fund_control.cfm">
	<responsibilities>
		I deactivate fund control before a new insert.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="8/9/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="deactivate_REF_Fund_control" datasource="#application.datasources.main#">
UPDATE #attributes.table_name#
SET active_ind=0
WHERE active_ind=1
	AND fund_id=#attributes.fund_id#
	AND organization_id=#attributes.organization_id#
	AND l_p_y_f_id=#attributes.l_p_y_f_id#
</cfquery>
