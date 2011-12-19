
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
	||
	Variables:
	END FUSEDOC --->
	
<cfquery name="notification_recipient" datasource="#application.datasources.main#">	
SELECT email AS recipient_email
FROM REF_Objects INNER JOIN Email ON Email.Emp_id = REF_Objects.Notification_to
WHERE object_id=19 AND Email.Email_Type_ID=1
</cfquery>	
	
</cfsilent>