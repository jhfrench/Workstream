<!-- Requirements/act_edit_comments.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_edit_comments.cfm">
	<responsibilities>
		I act (send information to DB) when a user edits comments and submits the form.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="5/29/2007" role="FuseCoder" comments="Created File">
			$Id:$
		</history>
	</properties>
	<IO>
		<in>
		</in>
		<passthrough>
		</passthrough>
		<out>
		</out>
	</IO>
</fusedoc>
--->


<cftransaction>
	<!--- deactivate Comments record for old Comments --->
	<cfquery name="deactivate_Comments" datasource="#application.datasources.main#">
	UPDATE Comments
	SET active_ind=0
	WHERE comments_id=#attributes.comments_id#
		AND active_ind=1
	</cfquery>
	<!--- deactivate Link_Screen_Comments record for old Comments --->
	<cfquery name="deactivate_link_screen_Comments" datasource="#application.datasources.main#">
	UPDATE Link_Screen_Comments
	SET active_ind=0
	WHERE comments_id=#attributes.comments_id#
		AND	active_ind=1
	</cfquery>
	<cfif attributes.active_ind EQ 1>
		<!--- insert new text into Comments, get comments_id --->
		<cfquery name="insert_comments" datasource="#application.datasources.main#">
		INSERT INTO Comments (comments_type_id, comments_number, description,
			created_by)
		VALUES (#attributes.comments_type_id#, #attributes.comments_number#, '#attributes.comment_description#',
			<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />)
		</cfquery>
<!--- $issue$ change this into "RETURNING" --->
		<cfquery name="get_comments_id" datasource="#application.datasources.main#">
		SELECT CURRVAL('Comments_comment_id_SEQ') AS comments_id
		</cfquery>
		<cfset attributes.comments_id=get_comments_id.comments_id>
		<!--- INSERT INTO Link_Screen_Comments (comments_id, screen_id) --->
		<cfquery name="insert_link_screen_comments" datasource="#application.datasources.main#">
		INSERT INTO Link_Screen_Comments (comments_id, screen_id, sort_order,
			created_by)
		VALUES (#attributes.comments_id#, #attributes.screen_id#, #attributes.sort_order#,
			<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />)
		</cfquery>
	</cfif>
</cftransaction>