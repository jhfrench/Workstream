
<!--Timekeeping/qry_get_ref_icon.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve the id and names of icons that are used to graphically distinguish a task. This query is cached because the REF table is rarely changed.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	<-- icon_id: number that identifies an icon image to workstream
	<-- icon_name: string that contains the name (of the icon) to display to the user
 --->
<cfparam name="application.icons_changed" default="#now()#">
<cfquery name="get_ref_icon" cachedafter="02/02/1978" datasource="#application.datasources.main#">
SELECT icon_id, icon_name
FROM REF_Icon
WHERE active_ind=1
	AND #application.icons_changed#=#application.icons_changed#
ORDER BY sort_order
</cfquery>
</cfsilent>