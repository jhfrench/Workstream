<!-- Requirements/act_edit_requirements.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_edit_requirements.cfm">
	<responsibilities>
		I act (send information to DB) when a user edits requirements and submits the form.
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


<cftransaction>
	<!--- deactivate Requirement record for old requirement --->
	<cfquery name="deactivate_requirement" datasource="#application.datasources.main#">
	UPDATE Requirement
	SET active_ind=0
	WHERE requirement_id=#attributes.requirement_id#
		AND active_ind=1
	</cfquery>
	<!--- deactivate Link_Screen_Requirement record for old requirement --->
	<cfquery name="deactivate_link_screen_requirement" datasource="#application.datasources.main#">
	UPDATE Link_Screen_Requirement
	SET active_ind=0
	WHERE requirement_id=#attributes.requirement_id#
		AND	active_ind=1
	</cfquery>
	<cfif attributes.active_ind EQ 1>
		<!--- insert new text into Requirement, get requirement_id --->
		<cfquery name="insert_requirement" datasource="#application.datasources.main#">
		INSERT INTO Requirement (requirement_type_id, requirement_number, description,
			product_version_id, priority_id, created_by)
		VALUES (#attributes.requirement_type_id#, #attributes.requirement_number#, '#attributes.requirement_description#',
			#attributes.product_version_id#, #attributes.priority_id#, #session.user_account_id#)
		</cfquery>
		<cfquery name="get_requirement_id" datasource="#application.datasources.main#">
		SELECT Requirement_SEQ.currval AS requirement_id
		FROM Dual
		</cfquery>
		<!--- insert into Link_Screen_Requirement (requirement_id, screen_id) --->
		<cfquery name="insert_link_screen_requirement" datasource="#application.datasources.main#">
		INSERT INTO Link_Screen_Requirement (requirement_id, screen_id, sort_order,
			created_by)
		VALUES (#get_requirement_id.requirement_id#, #attributes.screen_id#, #attributes.sort_order#,
			#session.user_account_id#)
		</cfquery>
		<cfquery name="insert_requirement_history" datasource="#application.datasources.main#">
		INSERT INTO Requirement_History (original_requirement_id, replacement_requirement_id)
		VALUES (<cfif attributes.requirement_id>#attributes.requirement_id#<cfelse>NULL</cfif>, #get_requirement_id.requirement_id#)
		</cfquery>
		<cfset attributes.requirement_id=get_requirement_id.requirement_id>
	</cfif>
</cftransaction>