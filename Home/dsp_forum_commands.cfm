<!-- common_files/dsp_forum_commands.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_forum_commands.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="9/28/2007" role="FuseCoder" comments="Created File">
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

<cfmodule template="qry_get_discussion.cfm" parent_discussion_id="0">
<cfinclude template="../common_files/qry_get_current_program_year.cfm">
<cfinclude template="../common_files/qry_get_user_access.cfm">
<cfset variables.allowed_business_function_id=valuelist(get_user_access.business_function_id)>
<div style="color:white;padding-bottom:3px;font-weight: bold;">Forum:</div>
<table cellspacing="1" cellpadding="3" border="0" width="100%" align="center" style="border:1px solid white;" summary="table displays forum commands">
	<!--- do not show if the user does not have access --->
	<cfif listfind(variables.allowed_business_function_id,120)>
		<tr>
			<td bgcolor="#aaaaaa" onMouseOver="this.bgColor='#eeeeee';this.style.cursor='hand';" onMouseOut="this.bgColor='#aaaaaa';this.style.cursor='default';">
				<div style="float:left;width:15px;">&nbsp</div>
				<a href="javascript:new_post(0);">Start New Topic</a>
			</td>
		</tr>
	</cfif>
	<tr>
		<td bgcolor="#aaaaaa" onMouseOver="this.bgColor='#eeeeee';this.style.cursor='hand';" onMouseOut="this.bgColor='#aaaaaa';this.style.cursor='default';">
			<div style="float:left;width:15px;">&nbsp</div>
			<a href="index.cfm?fuseaction=Home.view_forum">See All Topics</a></td>
	</tr>
<cfoutput query="get_discussion">
	<tr>
		<td bgcolor="##aaaaaa" onMouseOver="this.bgColor='##eeeeee';this.style.cursor='hand';" onMouseOut="this.bgColor='##aaaaaa';this.style.cursor='default';">
			<div style="float:left;width:15px;">&nbsp</div>
			<div style="float:left;width:150px;"><a href="javascript:view_forum(#discussion_id#,#discussion_id#);"><strong>Topic:</strong> #discussion_title#</a></div>
		</td>
	</tr>
</cfoutput>
</table>
<script type="text/javascript" language="javascript">
	checkTrack();
</script>
