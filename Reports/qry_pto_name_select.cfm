
<!--Reports/Qry_Pto_name_select.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the queries that are used in for the PTO report input page.

	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:14:42  stetzer
<>

Revision 1.4  2002-04-03 12:53:00-05  french
Reformatted SQL and CF.

Revision 1.3  2002-04-02 15:58:43-05  lee
added where condition disable_PTO flag

Revision 1.2  2001-10-16 08:52:24-04  long
Commented out a Join in the query "REFName" becaue it is excluding people that I believe should be returned from the query.  Also changed the query to only return people from the companies that you want to look at, NOT all the ones that you have access to.

Revision 1.1  2001-10-11 11:03:50-04  long
Added $log $ for edits to all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->
</cfsilent>
<cfquery name="subordinates" datasource="#application.datasources.main#">
SELECT emp_id 
FROM Supervisor 
WHERE sup_id=#emp_id#
</cfquery>
<cfquery name="get_all_option" datasource="#application.datasources.main#">
SELECT ISNULL(all_option, 0) AS all_option
FROM Security_Object_Access
WHERE emp_id = #session.user_account_id# 
	AND object_id = 16
</cfquery>
<cfquery name="REFname" datasource="#application.datasources.main#">
SELECT Emp_Contact.name, Emp_Contact.lname, Emp_Contact.emp_id
FROM Emp_Contact, Security, Company<!--- 
   
	INNER JOIN Supervisor ON Emp_Contact.emp_id = Supervisor.emp_id --->
WHERE Emp_Contact.emp_id = Security.emp_id
	AND Emp_Contact.emp_id = Company.emp_id
	AND security.disable!=1 
	AND security.Disable_PTO!=1
	AND Emp_contact_type=1
	AND <cfif get_all_option.all_option>
		company.company IN (#session.workstream_company_select_list#) 
	<cfelse>
		(emp_contact.emp_id=#session.user_account_id#<cfif subordinates.recordcount> OR emp_contact.emp_id IN (#valuelist(subordinates.emp_id)#)</cfif>)
	</cfif>
GROUP BY Emp_Contact.emp_id, Emp_Contact.name, Emp_Contact.lname
ORDER BY lname, name
</cfquery>

