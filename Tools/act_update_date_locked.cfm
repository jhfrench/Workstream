
<!--Tools/act_update_date_locked.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I update the date locked for the specified companies.

	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
<cfquery name="update_date_locked" datasource="#application.datasources.main#">
DELETE FROM Date_Locked
WHERE company_id IN (#attributes.company_id#)

INSERT INTO Date_Locked(company_id, date_locked)
SELECT REF_Companies.company_id AS company_id, #createodbcdatetime(attributes.date_locked)# AS date_locked
FROM REF_Companies
WHERE REF_Companies.company_id IN (#attributes.company_id#)
</cfquery>
</cfsilent>

