
<!--Timekeeping/qry_upload_custom_drops_answers.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I delete any old answers to task custom questions then I insert new answers specified by the user.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.2  2005/07/13 21:31:24  stetzer
	Fixing bug with custom fields (was not deleting previous entry for text entries)

	Revision 1.1  2005-03-09 13:28:23-05  stetzer
	<>

	Revision 1.2  2001-11-01 16:22:20-05  french
	Updated responsibilities.

	Revision 1.1  2001-10-18 16:17:42-04  french
	Made changes for custom field support.

	Revision 1.0  2001-10-18 14:43:01-04  french
	File creation.
	||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
 --->
<cfquery name="upload_custom_drops_answers" datasource="#application.datasources.main#">

<cfloop list="#attributes.custom_drops_collection#" index="ii">
	<cfif len(evaluate("attributes.custom_drops#ii#"))>
		<cfloop list="#evaluate("attributes.custom_drops#ii#")#" index="answer_ii">
		INSERT INTO User_Field_Values(task_id,user_field_id,user_field_items_id)
		VALUES (#attributes.task_id#,#ii#,#answer_ii#)
		</cfloop>
	</cfif>
</cfloop>
</cfquery>
</cfsilent>

