<!-- common_files/dsp_navigation_module.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_navigation_module.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/17/2007" role="FuseCoder" comments="Created File">
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
		<li class="dropdown"><a href="##" title="#module_description#" class="dropdown-toggle" data-toggle="dropdown">#module_description#<b class="caret"></strong></a>
			<ul class="dropdown-menu">
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
			<li class="dropdown"><a href="##" title="#parent_business_function#" class="dropdown-toggle" data-toggle="dropdown">#parent_business_function#<b class="caret"></strong></a>
				<ul class="dropdown-menu">
		</cfif>
	</cfif>
	<li><a href="index.cfm?fuseaction=#fuseaction#" title="#business_function_description#">#business_function_description#</a></li>
</cfloop><cfif variables.flyout_opened_ind>
		       </ul></cfif>
			</ul>
		</li>
</cfif>
</cfoutput>