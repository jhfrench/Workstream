
<!--Directory/qry_get_emp_benefits_info.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve employees benefits info.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log: 

	||
	Variables:
	--> attributes.emp_id: number containing the unique identifier of the individual being requested
	
 --->
<cfquery name="get_emp_benefits_info" datasource="#application.datasources.main#">
	SELECT 	benefit_id,
			benefit_amount,
			date_start,
			description
	FROM Benefit, (
					SELECT
						benefit_type_id,
						description,
						active_ind
					FROM
						REF_Benefit_Type
					WHERE
						active_ind = 1)
					AS REF_Benefit_Type
	WHERE emp_id = #attributes.emp_id#
	<!--- AND Benefit.active_ind = 1 --->
	AND Benefit.benefit_type_id = REF_Benefit_Type.benefit_type_id
</cfquery>
</cfsilent>
