
<!-- Admin/pag_admin_home.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the home page for the Admin module.

	||
	Edits:
	$Log$
	||
	Variables:
	END FUSEDOC --->
<cfparam name="variables.display" default="workstream">
</cfsilent>
<cfoutput>
<table cellspacing="1" cellpadding="2" border="0" width="50%" align="center">
	<tr bgcolor="##808080" class="HeadText#session.workstream_text_size#White">&nbsp;#variables.display# Administration</tr>
	<tr>
		<td class="RegText#session.workstream_text_size#">
			The Admin Module is the customization center for #variables.display#.  
			Here you will find options that allow you to personalize #variables.display#.    
			<cfif listcontainsnocase(session.workstream_object_access, 'change password')>
				Admin. allows you to change your <a href="index.cfm?fuseaction=change_password" onmouseover="MM_displayStatusMsg('Change your password now.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="RegText#session.workstream_text_size#">Password</a> at any time you choose. 
			</cfif>
			<cfif listcontainsnocase(session.workstream_object_access, 'Manage Accounts')>
				<a href="index.cfm?fuseaction=account_manage" onmouseover="MM_displayStatusMsg('Manage accounts now.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="RegText#session.workstream_text_size#">Manage Accounts</a>  allows you, as an administrator, to grant or remove access to pieces of #variables.display#, as well as removing access completely, by disabling a users account.
			</cfif>
			<cfif listcontainsnocase(session.workstream_object_access, 'User Settings')>
				<a href="index.cfm?fuseaction=user_options" onmouseover="MM_displayStatusMsg('Change your user preferences now.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="RegText#session.workstream_text_size#">User Settings</a> is the heart of the personalization of #variables.display#, here you can create a "profile" that #variables.display# will remember, so you always have your options set the way you like.
			</cfif>
		</td>
	</tr>
</table>
</cfoutput>
