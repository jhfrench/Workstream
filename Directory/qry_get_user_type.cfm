
<!-- directory/qry_get_user_type.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I 

	||
	Edits: 
	$Log$
	Revision 1.0  2005/02/15 20:47:14  daugherty
	Initial revision

	Revision 1.0  2002-03-11 13:09:09-05  long
	created file

	||
	Variables:
	
	END FUSEDOC --->
	
	<cfquery name="get_user_type" datasource="#application.datasources.main#">
    SELECT *
    FROM REF_Emp_contact_type
    WHERE active_ind = 1
    </cfquery>
</cfsilent>
