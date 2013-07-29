
<!--Timekeeping/qry_upload_custom_text_answers.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I update the the list of files associated with a task.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
 --->
<cfloop list="#attributes.custom_text_collection#" index="ii">
<cfif len(evaluate("attributes.custom_text#ii#"))>
	<cfset variables.insert_text=evaluate("attributes.custom_text#ii#")>
	<cftransaction>
		<cfquery name="reset_custom_text_answers" datasource="#application.datasources.main#">
		INSERT INTO User_Field_Items(selection_title,user_field_id)
		VALUES('#variables.insert_text#',#ii#)
		</cfquery>
<!--- $issue$ change this into "RETURNING" --->
		<cfquery name="get_last_entry" datasource="#application.datasources.main#">
		SELECT CURRVAL('User_Field_Items_user_field_items_id_SEQ') AS last_entry
		</cfquery>
		<cfquery name="upload_custom_text_answers" datasource="#application.datasources.main#">
		INSERT INTO User_Field_Values(task_id,user_field_id,user_field_items_id)
		VALUES (#attributes.task_id#,#ii#,#get_last_entry.last_entry#)
		</cfquery>
	</cftransaction>
</cfif>
</cfloop>
</cfsilent>

