
<!--Tools/act_update_date_locked.cfm
	Author: Jeromy F -->
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
UPDATE Date_Locked
SET active_ind=0
WHERE active_ind=1
	AND company_id IN (#attributes.company_id#);

INSERT INTO Date_Locked (company_id, date_locked, created_by)
SELECT REF_Company.company_id, #createodbcdatetime(attributes.date_locked)# AS date_locked, #session.user_account_id#
FROM REF_Company
WHERE REF_Company.company_id IN (#attributes.company_id#)
</cfquery>
</cfsilent>
<p class="alert alert-info">Date locked has been applied.</p>