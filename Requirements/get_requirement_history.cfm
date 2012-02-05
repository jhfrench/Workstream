<!-- Requirements/get_requirement_history.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="get_requirement_history.cfm">
	<responsibilities>
		I retrieve all predecessors for the requirement selected.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/1/2007" role="FuseCoder" comments="Created File">
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
<cfquery name="get_requirement_history" datasource="#application.datasources.main#">
SELECT Requirement.requirement_id, Requirement.requirement_number, Requirement.description,
	Requirement.created_date, Demographics.last_name + ', '+ Demographics.first_name AS requirement_author
FROM Requirement_History
	INNER JOIN Requirement ON Requirement_History.original_requirement_id=Requirement.requirement_id
	INNER JOIN User_Account ON Requirement.created_by=User_Account.user_account_id
	INNER JOIN Demographics ON User_Account.user_account_id=Demographics.user_account_id
WHERE Demographics.active_ind=1
	AND Requirement_History.replacement_requirement_id=#attributes.replacement_requirement_id#
</cfquery>