<!-- Administration/qry_deactivate_REF_Fund.cfm
	Author: Jeromy French-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_deactivate_REF_Fund.cfm">
	<responsibilities>
		Query to deactivate a record in REF_Fund table before a new insert.
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

<cfquery name="deactivate_REF_Fund" datasource="#application.datasources.main#">
UPDATE REF_Fund
SET active_ind=0
WHERE active_ind=1
	AND fund_id=#attributes.fund_id#
</cfquery>