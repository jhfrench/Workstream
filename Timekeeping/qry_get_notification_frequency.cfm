
<!--Timekeeping/qry_get_notification_frequency.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve the notification frequencies.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:24:15  stetzer
	<>

	||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> attributes.task_id: list that contains task id's submitted fromthe express timekeeping page
 --->
<cfquery name="get_notification_frequency" cachedafter="02/02/1978" datasource="#application.datasources.main#">
SELECT notification_frequency_id, description
FROM REF_Notification_Frequency
ORDER BY display_order
</cfquery>
</cfsilent>

