
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
	Revision 1.2  2006/09/15 22:25:58  csy
	<>

	Revision 1.0  2006-08-16 09:32:11-04  csy
	Initial revision

	Revision 1.1  2005-09-14 09:01:43-04  pciske
	task 34623 - added derived table to determine if the account being edited has different All Option access than the current user; used to disable All Option checkbox

	Revision 1.0  2005-02-15 15:27:39-05  daugherty
	Initial revision

	Revision 1.4  2002-03-11 10:39:36-05  long
	Changed the query so that it only returns active reports and modules.

	Revision 1.3  2002-02-08 09:02:22-05  long
	Added evaluation of user level to determine what the administrator is allowed to grant access to. Wrote query for the more limited access portion.

	Revision 1.2  2001-11-21 17:53:57-05  french
	Added ordering by object name

	Revision 1.1  2001-10-11 10:55:30-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
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

