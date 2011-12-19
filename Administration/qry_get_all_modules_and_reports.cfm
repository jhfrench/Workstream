
<!--Admin/qry_get_all_modules_and_reports.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities:
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
 --->
<cfquery name="get_all_modules_and_reports" datasource="#application.datasources.main#">
	<cfif session.workstream_user_level EQ 1>
<!--- User Level 1 is granted to "super admins/ Nucleus Level" Security settings. This allows the user to grant access to items that they themselves don't have access to. --->
SELECT REF_Module.module_name, REF_Module.module_id, REF_Objects.report_name,
	REF_Objects.[object_id], 
	ISNULL(Security_Module_Access.active_ind, 0) AS module_security, 
	ISNULL(Security_Object_Access.active_ind, 0) AS object_security,
	ISNULL(Security_Object_Access.all_option, 0) AS object_all_option_editable,
	1 AS object_all_option
FROM REF_Module, REF_Objects, Security_Object_Access,
	Security_Module_Access
WHERE REF_Module.module_id=REF_Objects.module_id
	AND REF_Objects.object_id*=Security_Object_Access.object_id
	AND Security_Object_Access.emp_id=#attributes.emp_id# 
	AND REF_Module.module_id*=Security_Module_Access.module_id
	AND Security_Module_Access.emp_id=#attributes.emp_id#
	AND REF_Module.active_ind=1
	AND REF_Objects.active_ind=1
ORDER BY REF_Module.order_by, REF_Objects.report_name
	<cfelse>
<!--- If the user isn't user level 1.  then they are only allowed to grant access to modules and reports that they themselves are allowed to see.--->
SELECT REF_Module.Module_Name, REF_Module.module_id, REF_Objects.report_name, 
    REF_Objects.object_id, Editable.Object_security, Editable.Module_security,
	ISNULL(Security_Object_Access.all_option, 0) AS object_all_option,
	ISNULL(all_option_editable.all_option, 0) AS object_all_option_editable
FROM Security_Object_Access INNER JOIN
    REF_Module INNER JOIN
    REF_Objects ON 
    REF_Module.module_id=REF_Objects.module_id INNER JOIN
    Security_Module_Access ON 
    REF_Module.module_id=Security_Module_Access.module_id AND
    Security_Module_Access.Emp_ID=#session.user_account_id#/*session.user_account_id*/ 
	ON Security_Object_Access.object_id=REF_Objects.object_id AND 
    Security_Object_Access.emp_id=#session.user_account_id# /*session.user_account_id*/
	INNER JOIN
        (SELECT REF_Objects.object_id, REF_Module.module_id, 
           ISNULL(Security_Object_Access.active_ind, 0) 
           AS Object_security, 
           ISNULL(Security_Module_Access.Active_Ind, 0) 
           AS Module_security
    	  FROM Security_Object_Access RIGHT OUTER JOIN
           REF_Module INNER JOIN
           REF_Objects ON 
           REF_Module.module_id=REF_Objects.module_id LEFT
            OUTER JOIN
           Security_Module_Access ON 
           REF_Module.module_id=Security_Module_Access.module_id
            AND Security_Module_Access.Emp_ID=#attributes.emp_id# /*attributes.emp_id*/ ON 
           Security_Object_Access.object_id=REF_Objects.object_id
            AND Security_Object_Access.emp_id=#attributes.emp_id# /*attributes.emp_id*/) 
    editable ON 
    editable.module_id=REF_Module.module_id AND 
    REF_Objects.object_id=editable.object_id
	INNER JOIN (
		SELECT REF_Objects.object_id, REF_Module.module_id, Security_Object_Access.all_option
		FROM Security_Object_Access 
			RIGHT OUTER JOIN REF_Module 
				INNER JOIN REF_Objects 
					ON REF_Module.module_id=REF_Objects.module_id 
				LEFT OUTER JOIN Security_Module_Access 
					ON REF_Module.module_id=Security_Module_Access.module_id
            				AND Security_Module_Access.Emp_ID=#attributes.emp_id# /*attributes.emp_id*/ 
				ON Security_Object_Access.object_id=REF_Objects.object_id
            			AND Security_Object_Access.emp_id=#attributes.emp_id# /*attributes.emp_id*/
	) all_option_editable
		ON all_option_editable.module_id=REF_Module.module_id 
		AND REF_Objects.object_id=all_option_editable.object_id
WHERE REF_Module.Active_ind=1 AND  REF_Objects.active_ind=1
ORDER BY REF_Module.order_by, REF_Objects.report_name
	</cfif>
</cfquery>
</cfsilent>

