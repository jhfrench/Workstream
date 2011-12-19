<!-- Home/dsp_module_commands.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_module_commands.cfm.cfm">
	<responsibilities>
		Page to display navigation links of Administration module.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="9/27/2007" role="FuseCoder" comments="Created File">
			$Id:$
			(JF | 3/28/2008)
			Converted REF_Business_Function.parent_ind to REF_Business_Function.navigation_type_id.
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

<cfinclude template="qry_get_module_commands.cfm">

<cfset variables.parent_id="_blank">
<cfset variables.parent_flag=1>
<cfset variables.parent_counter=0>
<cfset variables.anchor_tag="">
<input type="hidden" name="menu_parent_id" id="menu_parent_id" value="0">
<div style="color:white;padding-bottom:3px;font-weight: bold;"><cfoutput>#replace(get_module_commands.module_description, 'Main', 'Preferences')#</cfoutput></div>

<table cellspacing="1" cellpadding="3" border="0" width="100%" align="center" style="border:1px solid white;" summary="Table displays module commands">
	<tbody id="element_0">
<cfoutput query="get_module_commands">
	<cfswitch expression="#get_module_commands.navigation_type_id#">
		<cfcase value="2">
			<cfset variables.parent_counter=variables.parent_counter+1>
			<cfset variables.anchor_tag='<a name="anchor_#variables.parent_counter#">'>
			<cfset variables.parent_id=get_module_commands.business_function_description>
			<cfset variables.parent_flag=1>
	</tbody>
			<tr>
				<td bgcolor="##2C6399">
					<span style="padding-bottom:2px; float:left;color:white;" onclick="Element.toggle('element_#variables.parent_counter#');Element.toggle('menu_minus_#variables.parent_counter#');Element.toggle('menu_plus_#variables.parent_counter#');return false;"><img src="images/expand.gif"  height="9" width="9" border="0" alt="View Current Year details" id="menu_plus_#variables.parent_counter#" style="cursor: n-resize;" tabindex="1" /><img src="images/collapse.gif" alt="Hide Current Year details" height="9" width="9" id="menu_minus_#variables.parent_counter#" style="display:none;cursor: e-resize;" />&nbsp;#business_function_description#</span>
				</td>
			</tr>
		</cfcase>
		<cfcase value="3">
			<tr>
				<td bgcolor="##2C6399"><span style="padding-bottom:2px; float:left;color:white;" />&nbsp;#business_function_description#</span>
				</td>
			</tr>
		</cfcase>
		<cfdefaultcase>
			<cfif variables.parent_flag EQ 1 AND variables.parent_counter>
	<tbody id="element_#variables.parent_counter#"<cfif variables.parent_counter GTE 1> style="display:none"</cfif>>
				#variables.anchor_tag#
				<cfset variables.parent_flag=0>
			</cfif>
			<tr>
				<td bgcolor="##aaaaaa" onmouseover="this.bgColor='##eeeeee';this.style.cursor='hand';" onmouseout="this.bgColor='##aaaaaa';this.style.cursor='default';">
				<div style="float:left;width:15px;">&nbsp;</div><div style="float:left"><a href="index.cfm?fuseaction=#fuseaction#">#business_function_description#</a></div>
				</td>
			</tr>
		</cfdefaultcase>
	</cfswitch>
</cfoutput>
<cfif variables.parent_counter>
	</tbody>
</cfif>
</table>
<cfif attributes.module_id EQ 2 AND session.user_account_id EQ 1>
<div style="color:white;padding-top:16px;padding-bottom:3px;font-weight: bold;">Application Setup:</div>
<table cellspacing="1" cellpadding="3" border="0" width="100%" align="center" style="border:1px solid white;" summary="Table displays administration options only available to select developers.">
	<tr>
		<td bgcolor="#2C6399">
			<span style="padding-bottom:2px; float:left;color:white;" onclick="Element.toggle('element_ln2');Element.toggle('menu_minus_ln2');Element.toggle('menu_plus_ln2');return false;"><img src="images/expand.gif" height="9" width="9" border="0" alt="View Current Year details" id="menu_plus_ln2" style="cursor: n-resize;" tabindex="1" /><img src="images/collapse.gif" alt="Hide Current Year details" height="9" width="9" id="menu_minus_ln2" style="display:none;cursor: e-resize;" />&nbsp;Admin Tasks</span>
		</td>
	</tr>
	<tbody id="element_ln2" style="display:none">
		<tr>
			<td bgcolor="#aaaaaa" onmouseover="this.bgColor='#eeeeee';this.style.cursor='hand';" onmouseout="this.bgColor='#aaaaaa';this.style.cursor='default';">
				<div style="float:left;width:15px;">&nbsp;</div>
				<div style="float:left;width:150px;"><a href="index.cfm?fusebox.password=default&fusebox.parse=true&fusebox.load=true">Reparse Fusebox Application</a></div>
			</td>
		</tr>
		<tr>
			<td bgcolor="#aaaaaa" onmouseover="this.bgColor='#eeeeee';this.style.cursor='hand';" onmouseout="this.bgColor='#aaaaaa';this.style.cursor='default';">
				<div style="float:left;width:15px;">&nbsp;</div>
				<div style="float:left;width:150px;"><a href="index.cfm?fuseaction=Administration.reset_application_variables">Reset Application Variables</a></div>
			</td>
		</tr>
		<tr>
			<td bgcolor="#aaaaaa" onmouseover="this.bgColor='#eeeeee';this.style.cursor='hand';" onmouseout="this.bgColor='#aaaaaa';this.style.cursor='default';">
				<div style="float:left;width:15px;">&nbsp;</div>
				<div style="float:left;width:150px;"><a href="index.cfm?fuseaction=Administration.view_application_variables">View All Application Variables</a></div>
			</td>
		</tr>
		<tr>
			<td bgcolor="#aaaaaa" onmouseover="this.bgColor='#eeeeee';this.style.cursor='hand';" onmouseout="this.bgColor='#aaaaaa';this.style.cursor='default';">
				<div style="float:left;width:15px;">&nbsp;</div>
				<div style="float:left;width:150px;"><a href="index.cfm?fuseaction=Administration.cause_error">Cause an error</a></div>
			</td>
		</tr>
		<tr>
			<td bgcolor="#aaaaaa" onmouseover="this.bgColor='#eeeeee';this.style.cursor='hand';" onmouseout="this.bgColor='#aaaaaa';this.style.cursor='default';">
				<div style="float:left;width:15px;">&nbsp;</div>
				<div style="float:left;width:150px;"><a href="index.cfm?fuseaction=Administration.execute_sql">Execute SQL</a></div>
			</td>
		</tr>
		<tr>
			<td bgcolor="#aaaaaa" onmouseover="this.bgColor='#eeeeee';this.style.cursor='hand';" onmouseout="this.bgColor='#aaaaaa';this.style.cursor='default';">
				<div style="float:left;width:15px;">&nbsp;</div>
				<div style="float:left;width:150px;"><a href="index.cfm?fuseaction=Administration.set_deactivated_date">Set deactivated dates</a></div>
			</td>
		</tr>
		<tr>
			<td bgcolor="#aaaaaa" onmouseover="this.bgColor='#eeeeee';this.style.cursor='hand';" onmouseout="this.bgColor='#aaaaaa';this.style.cursor='default';">
				<div style="float:left;width:15px;">&nbsp;</div>
				<div style="float:left;width:150px;"><a href="index.cfm?fuseaction=Administration.create_update_triggers">Create update triggers</a></div>
			</td>
		</tr>
		<tr>
			<td bgcolor="#aaaaaa" onmouseover="this.bgColor='#eeeeee';this.style.cursor='hand';" onmouseout="this.bgColor='#aaaaaa';this.style.cursor='default';">
				<div style="float:left;width:15px;">&nbsp;</div>
				<div style="float:left;width:150px;"><a href="index.cfm?fuseaction=Administration.administer_sorter_table">Administer System Sorter Table</a></div>
			</td>
		</tr>
		<tr>
			<td bgcolor="#aaaaaa" onmouseover="this.bgColor='#eeeeee';this.style.cursor='hand';" onmouseout="this.bgColor='#aaaaaa';this.style.cursor='default';">
				<div style="float:left;width:15px;">&nbsp;</div>
				<div style="float:left;width:150px;"><a href="index.cfm?fuseaction=Administration.list_link_tables">Administer System LINK Tables</a></div>
			</td>
		</tr>
		<tr>
			<td bgcolor="#aaaaaa" onmouseover="this.bgColor='#eeeeee';this.style.cursor='hand';" onmouseout="this.bgColor='#aaaaaa';this.style.cursor='default';">
				<div style="float:left;width:15px;">&nbsp;</div>
				<div style="float:left"><a href="index.cfm?fuseaction=Administration.clean_up_old_accounts">Deactivate Old Accounts</a></div>
				<br />
				<div style="float:left;margin-left:15px;margin-right:6px;margin-bottom:2px;font-size:8pt;color:red;">(This Will Send Emails, Dont Run Unless You're Sure Emails Are Scrubbed)</div>
			</td>
		</tr>
	</tbody>
</table>
<table cellspacing="1" cellpadding="3" border="0" width="100%" align="center" style="border:1px solid white;" summary="Table displays administration options only available to select developers.">
	<tr>
		<td bgcolor="#2C6399">
			<span style="padding-bottom:2px; float:left;color:white;" onclick="Element.toggle('element_ln1');Element.toggle('menu_minus_ln1');Element.toggle('menu_plus_ln1');return false;"><img src="images/expand.gif" height="9" width="9" border="0" alt="View Current Year details" id="menu_plus_ln1" style="cursor: n-resize;" tabindex="1" /><img src="images/collapse.gif" alt="Hide Current Year details" height="9" width="9" id="menu_minus_ln1" style="display:none;cursor: e-resize;" />&nbsp;Help</span>
		</td>
	</tr>
	<tbody id="element_ln1" style="display:none">
		<tr>
			<td bgcolor="#aaaaaa" onmouseover="this.bgColor='#eeeeee';this.style.cursor='hand';" onmouseout="this.bgColor='#aaaaaa';this.style.cursor='default';">
				<div style="float:left;width:15px;">&nbsp;</div>
				<div style="float:left;width:150px;"><a href="index.cfm?fuseaction=Administration.edit_help_article">Add/Edit Articles</a></div>
			</td>
		</tr>
		<tr>
			<td bgcolor="#aaaaaa" onmouseover="this.bgColor='#eeeeee';this.style.cursor='hand';" onmouseout="this.bgColor='#aaaaaa';this.style.cursor='default';">
				<div style="float:left;width:15px;">&nbsp;</div>
				<div style="float:left;width:150px;"><a href="index.cfm?fuseaction=Administration.list_help_articles">List Articles</a></div>
			</td>
		</tr>
	</tbody>
</table>
</cfif>

<script type="text/javascript" language="javascript">
	checkTrack();
</script>