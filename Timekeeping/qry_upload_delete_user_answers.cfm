
<!--Timekeeping/qry_upload_delete_user_answers.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I delete any old answers to task custom questions.
	||
	Name: Jeromy French
	||
	Edits:
	
	 || 
	--> 
 --->







<cfquery name="upload_custom_drops_answers" datasource="#application.datasources.main#">
DELETE
FROM User_Field_Values
WHERE Task_id=#attributes.task_id#
</cfquery>

</cfsilent>