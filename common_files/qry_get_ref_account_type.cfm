
<!-- common_files/qry_get_ref_account_type.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I 

	||
	Edits: 
	$Log$
	||
	Variables:

	END FUSEDOC --->

<cfquery name="get_ref_account_type" datasource="#application.datasources.main#">
SELECT *
FROM REF_Account_Type
WHERE active_ind=1
ORDER BY sort_order
</cfquery>
</cfsilent>
