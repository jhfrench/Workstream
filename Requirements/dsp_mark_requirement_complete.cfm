<!-- Requirements/dsp_mark_requirement_complete.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_mark_requirement_complete.cfm">
	<responsibilities>
		I update a record in Link_Screen_Requirement table when requirement is copmleted.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="5/29/2007" role="FuseCoder" comments="Created File">
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

<cfparam name="attributes.requirement_coded_ind" default="0">
<cfparam name="attributes.affected_requirements" default="0">
<cfquery name="update_requirement_coded_ind" datasource="#application.datasources.main#">
UPDATE Link_Screen_Requirement
SET requirement_coded_ind=0,
	requirement_coded_by=NULL,
	date_requirement_coded=NULL
WHERE requirement_coded_ind=1
	AND l_s_r_id IN (#attributes.affected_requirements#)
	AND l_s_r_id NOT IN (#attributes.requirement_coded_ind#)
</cfquery>
<cfquery name="update_requirement_coded_ind" datasource="#application.datasources.main#">
UPDATE Link_Screen_Requirement
SET requirement_coded_ind=1,
	requirement_coded_by=#session.user_account_id#,
	date_requirement_coded=GETDATE()
WHERE requirement_coded_ind=0
	AND l_s_r_id IN (#attributes.requirement_coded_ind#)
</cfquery>

Requirements have been updated.