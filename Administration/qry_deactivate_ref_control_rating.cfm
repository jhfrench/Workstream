<!-- Administration/qry_deactivate_ref_control_rating.cfm
	Author: Jeromy French-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_deactivate_ref_control_rating.cfm">
	<responsibilities>
		Query to deactivate a record in REF_control_rating table before a new insert.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="6/19/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="deactivate_ref_control_rating" datasource="#application.datasources.main#">
UPDATE REF_Control_Rating
SET active_ind=0
WHERE active_ind=1
	AND control_rating_id=#attributes.control_rating_id#
</cfquery>
