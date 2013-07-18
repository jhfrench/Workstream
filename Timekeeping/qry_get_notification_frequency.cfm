
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
	 || 
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> attributes.task_id: list that contains task id's submitted fromthe express timekeeping page
 --->
 <!--- $issue$: this table doesn't exist--does it need to? --->
<cfquery name="get_notification_frequency" cachedwithin="#createtimespan(30, 0, 0, 0)#" datasource="#application.datasources.main#">
SELECT notification_frequency_id, description
FROM REF_Notification_Frequency
ORDER BY sort_order
</cfquery>
</cfsilent>