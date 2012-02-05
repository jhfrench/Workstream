<!-- Home/pag_view_screensaver_message.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_view_screensaver_message.cfm">
	<responsibilities>
		I display a message the user has entered into the database.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="10/24/2007" role="FuseCoder" comments="Created File">
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

<cfparam name="attributes.screen_user_id" default="0">
<cfquery name="get_screensaver_text" datasource="#application.datasources.main#">
SELECT *
FROM Screensaver_Message
WHERE active_ind=1
	AND screen_user_id=#attributes.screen_user_id#
ORDER BY sort_order
</cfquery>

<table summary="Table displays messages">
<cfif get_screensaver_text.recordcount>
	<cfoutput query="get_screensaver_text">
	<tr>
		<td style="color:white;;font-size:18px;">#message_title#</td>
	</tr>
	<tr>
		<td style="color:white;">#message_body#</td>
	</tr>
	<tr>
		<td style="color:yellow;">Entered #created_date# (#datediff("n", created_date, now())# minutes ago)</td>
	</tr>
	</cfoutput>
<cfelse>
	<tr>
		<td style="color:white;font-size:18px;">No Messages</td>
	</tr>
	<tr>
		<td style="color:white;">There are no messages for the indicated user.</td>
	</tr>
</cfif>
</table>
