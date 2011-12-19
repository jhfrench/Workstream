<!-- common_files/dsp_navigation_sub.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_navigation_sub.cfm">
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
<cfset variables.module_id=0>
<cfoutput query="get_module_sub_navigation">
	<cfif get_module_sub_navigation.business_function_id EQ get_screen_details.business_function_id>
		<cfset variables.primary_color="##c0c0c0">
	<cfelse>
		<cfset variables.primary_color="##666666">
	</cfif>
<cfif module_id NEQ variables.module_id>
	<cfif currentrow NEQ 1>
			</tr>
		</table>
	</div>
</div>
	</cfif>
<div id="nav_d#module_id#" class="nav_d2" style="display:none;" onmouseover="Effect.toggle('nav_d#variables.module_id#','appear'); return false;" onmouseout="Effect.toggle('nav_d#variables.module_id#','appear'); return false;">
	<iframe src="common_files/null.html" scrolling="no" frameborder="0" class="nav_d2_inner"></iframe>
	<div class="nav_d2_outer">
		<table cellpadding="3" cellspacing="1" border="0" bgcolor="white" style="margin-top:10px;">
	<cfset variables.module_id=module_id>
</cfif>
			<tr>
				<td valign="top" bgcolor="#variables.primary_color#" onmouseover="this.bgColor='##0066cc';" onmouseout="this.bgColor='#variables.primary_color#';" nowrap="nowrap"><a href="index.cfm?fuseaction=#get_module_sub_navigation.fuseaction#" style="font-size:11px">#get_module_sub_navigation.business_function_description#</a></td>
			</tr>
</cfoutput>
		</table>
	</div>
</div>