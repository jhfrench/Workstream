<!--common_files/dsp_select_month.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_select_month.cfm">
	<responsibilities>
		I provide list of months.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/26/2007" role="FuseCoder" comments="Created File">
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

<cfparam name="attributes.select_name" default="month">
<cfparam name="attributes.selected_month" default="#month(now())#">
<cfparam name="attributes.selectable_months" default="1,2,3,4,5,6,7,8,9,10,11,12">	<!--- list of months to display, by default all --->
<cfoutput>
<select name="#attributes.select_name#" id="#attributes.select_name#">
	<cfloop list="#attributes.selectable_months#" index="variables.month_num">
		<option value="#variables.month_num#"<cfif attributes.selected_month EQ variables.month_num> selected="selected"</cfif>>
			#monthasstring(variables.month_num)#
		</option>
	</cfloop>
</select>
</cfoutput>