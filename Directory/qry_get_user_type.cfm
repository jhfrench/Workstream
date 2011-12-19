
<!-- Directory/qry_get_user_type.cfm
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
	
	<cfquery name="get_user_type" datasource="#application.datasources.main#">
    SELECT *
    FROM REF_Emp_contact_type
    WHERE active_ind = 1
    </cfquery>
</cfsilent>
