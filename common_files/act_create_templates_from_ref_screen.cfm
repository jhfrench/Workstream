<!-- common_files/act_create_templates_from_ref_screen.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_create_templates_from_ref_screen.cfm">
	<responsibilities>
		I create templates from ref_screen table.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="6/19/2007" role="FuseCoder" comments="Created File">
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
<cfset variables.fusedoc_date="#month(now())#/#day(now())#/#year(now())#">
<cfset variables.directory="Reports">
<cfparam name="session.first_name" default="Jeromy">
<cfparam name="session.last_name" default="French">
<cfparam name="session.email_address" default="jeromy_french@hotmail.com>
<cfquery name="get_report_screens" datasource="#application.datasources.main#">
SELECT 'pag_'+REPLACE(fuseaction,'#variables.directory#.','')+'.cfm' AS page_name, description AS business_function, REPLACE(fuseaction,'Reports.','') AS page_guts
FROM REF_Screen
	INNER JOIN REF_Business_Function ON REF_Screen.business_function_id=REF_Business_Function.business_function_id
WHERE fuseaction LIKE '#variables.directory#.%'
	AND fuseaction!='#variables.directory#.all_reports'
ORDER BY REF_Business_Function.description
</cfquery>

<cfloop query="get_report_screens">
	<cfoutput>
	<cfsavecontent variable="variables.output">
/start arrow/!-- #directory#/#page_name#
	Author: #session.first_name# #session.last_name#-->
/start arrow/!--- -->
/start arrow/fusedoc language="ColdFusion MX" specification="2.0" template="#page_name#">
	/start arrow/responsibilities>
<cfswitch expression="#listgetat(page_name, 2, '_')#">
	<cfcase value="criteria">
		I show the selection criteria for the #business_function# report.
	</cfcase>
	<cfcase value="output">
		I output the #business_function# report based on the options specified in the criteria page.
	</cfcase>
</cfswitch>
	/start arrow//responsibilities>
	/start arrow/properties>
		/start arrow/history email="#session.email_address#" author="#session.first_name# #session.last_name#" type="create" date="#variables.fusedoc_date#" role="FuseCoder" comments="Created File">
			$Id:$
		/start arrow//history>
	/start arrow//properties>
	/start arrow/IO>
		/start arrow/in>

		/start arrow//in>
		/start arrow/passthrough>

		/start arrow//passthrough>
		/start arrow/out>

		/start arrow//out>
	/start arrow//IO>
/start arrow//fusedoc>
--->
<cfswitch expression="#listgetat(page_name, 2, "_")#">
	<cfcase value="criteria">
/start arrow/cfinclude template="dsp_report_criteria.cfm">
	</cfcase>
	<cfcase value="output,bw">
/start arrow/cfinclude template="act_#page_guts#.cfm">
/start arrow/cfinclude template="qry_get_#page_guts#.cfm">
/start arrow/cfinclude template="dsp_#page_guts#.cfm">
	</cfcase>
</cfswitch>
	</cfsavecontent>
	</cfoutput>
	<cffile action="write" file="/nasahq/data/www/docs/jfrench/FAAD/trunk/sourcecode/#variables.directory#/#page_name#" output="#variables.output#" mode="777" addnewline="No" attributes="normal">
	<cfif listfindnocase("output,bw",listgetat(page_name, 2, '_'))>
		<cfloop list="act_,qry_get_,dsp_" index="type_ii">
			<cffile action="write" file="/nasahq/data/www/docs/jfrench/FAAD/trunk/sourcecode/#variables.directory#/#type_ii##page_guts#.cfm" output="act_#page_guts#.cfm" mode="777" addnewline="No" attributes="normal">
		</cfloop>
	</cfif>
</cfloop>