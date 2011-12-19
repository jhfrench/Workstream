<!-- common_files/dsp_navigation_module.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_navigation_module.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="7/17/2007" role="FuseCoder" comments="Created File">
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
<cfoutput>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td bgcolor="##333333">
<div id="spryMenuBar">
	<ul id="MenuBar1" class="MenuBarHorizontal">
<cfif get_module_sub_navigation.recordcount>
<cfscript>
	variables.module_id=0;
	variables.parent_business_function_id=0;
	variables.business_function_id=0;
	variables.hierachy_level=0;
	variables.flyout_opened_ind=0;
</cfscript>
<cfloop query="get_module_sub_navigation">
	<cfif module_id NEQ variables.module_id>
		<cfset variables.module_id=module_id>
		<cfif currentrow NEQ 1>
			<!--- we're dealing with a new module, so need to close the last one --->
			</ul>
			</li>
		</cfif>
		<li><a href="javascript:void('#module_description# options');" title="#module_description#" class="MenuBarItemSubmenu">#module_description#</a>
		<ul>
	</cfif>
	<cfif parent_business_function_id NEQ variables.parent_business_function_id>
		<cfset variables.parent_business_function_id=parent_business_function_id>
		<!--- since this is a new parent, check to see if we have to close the last parent --->
		<cfif variables.flyout_opened_ind>
			<cfset variables.flyout_opened_ind=0>
			</ul>
			</li>
		</cfif>
		<!--- if the business function has a parent, show it first --->
		<cfif parent_business_function_id NEQ business_function_id>
			<cfset variables.hierachy_level=hierachy_level>
			<cfset variables.flyout_opened_ind=1>
			<li><a href="javascript:void('#parent_business_function# options');" title="#parent_business_function#">#parent_business_function#</a>
			<ul>
		</cfif>
	</cfif>
	<li><a href="index.cfm?fuseaction=#fuseaction#" title="#business_function_description#">#business_function_description#</a></li>
</cfloop><cfif variables.flyout_opened_ind>
	            </ul></cfif>
			</ul>
		</li>
</cfif>
	</ul>
</div>
		</td><cfif application.use_help_module_ind>
		<td align="center" bgcolor="##A80104" style="width: 6em;">
		<a href="javascript:void('Access the #application.html_title# help system');" onclick="javascript:Effect.toggle('help_area','appear');return false;" style="text-decoration:none; cursor:help; color:##FFFFFF; font-weight:bold;" title="Access the #application.html_title# help system">Help</a>
		</td></cfif>
		<td align="right" bgcolor="##333333">
			&nbsp;<cfif isdefined("session.user_account_id")><cfif session.password_created_by EQ session.user_account_id><a href="index.cfm?fuseaction=Home.logout" style="color:##FFFFFF;"><strong>Logout <cfoutput>#session.first_name# #session.last_name#</cfoutput></strong></a></cfif><cfelse><a href="index.cfm?fuseaction=Home.login" style="color:##FFFFFF;"><strong>Login for More Access</strong></a></cfif>
		</td>
		
	</tr>
</table>
</cfoutput>

<script type="text/javascript">
<!--
var MenuBar1=new Spry.Widget.MenuBar("MenuBar1", {imgDown:"images/SpryMenuBarDownHover.gif", imgRight:"images/SpryMenuBarRightHover.gif"});
//-->
</script>