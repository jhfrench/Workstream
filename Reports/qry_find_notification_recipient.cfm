
<!--Reports/qry_find_notification_recipient.cfm 
	Author: David L  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: 
	||
	Name: David Lee
	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:13:01  stetzer
	<>

	Revision 1.0  2002-04-16 16:04:11-04  lee
	initial revision

	
	||
	
	Variables:
	END FUSEDOC --->
	
<cfquery name="notification_recipient" datasource="#application.datasources.main#">	
SELECT email AS recipient_email
FROM REF_Objects INNER JOIN Email ON Email.Emp_id = REF_Objects.Notification_to
WHERE object_id=19 AND Email.Email_Type_ID=1
</cfquery>	
	
</cfsilent>