<!-- reports/qry_insert_pto_grant.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I 
	||
	Name: Jeromy French
	||
	Edits: 
	$Log$
	||
	Variables:
	
	END FUSEDOC --->
<cfquery name="insert_pto_grant" datasource="#application.datasources.main#">
INSERT INTO PTO_Grant (emp_id, date_granted, granted_hours, comments)
VALUES (#emp_id#, #createodbcdate(date_granted)#, #granted_hours#, '#comments#')
</cfquery>
</cfsilent>