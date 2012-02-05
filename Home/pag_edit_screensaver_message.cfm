<!-- Home/pag_edit_screensaver_message.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_edit_screensaver_message.cfm">
	<responsibilities>
		I give an interface for a user to enter a screensaver message.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="10/24/2007" role="FuseCoder" comments="Created File">
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

<cfif isdefined("attributes.message_title")>
	<cfquery name="deactivate_screensaver_text" datasource="#application.datasources.main#">
	UPDATE Screensaver_Message
	SET active_ind=0
	WHERE active_ind=1
		AND screen_user_id=#attributes.screen_user_id#
	</cfquery>
	<cfquery name="insert_screensaver_text" datasource="#application.datasources.main#">
	INSERT INTO Screensaver_Message (message_title, message_body, screen_user_id,
		created_by)
	VALUES ('#attributes.message_title#', '#attributes.message_body#', #attributes.screen_user_id#,
		#attributes.screen_user_id#)
	</cfquery>
	Message updated.
</cfif>

<cfif isdefined("attributes.screen_user_id")>
<form name="form_edit_screensaver_message" action="index.cfm?fuseaction=Home.edit_screensaver_message" method="post">
<table summary="Table displays message form elements">
	<tr>
		<td><label for="Message_Title">Message Title</label></td>
		<td><input type="text" name="message_title" id="Message_Title" value="" maxlength="400"></td>
	</tr>
	<tr>
		<td><label for="Message_Body">Message body</label></td>
		<td><textarea name="message_body" id="Message_Body" cols="30" rows="3"></textarea></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="hidden" name="screen_user_id" value="<cfoutput>#attributes.screen_user_id#</cfoutput>">
			<input type="submit" alt="submit" value="Submit">
		</td>
	</tr>
</table>
</form>
<cfelse>
	You have to specify your screen_user_id.
</cfif>
