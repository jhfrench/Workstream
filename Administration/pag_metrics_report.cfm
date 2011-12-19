<!-- Administration/pag_metrics_report.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_metrics_report">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="7/13/2009" role="FuseCoder" comments="Created File">
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

<!--- if data has been submitted to this page, insert it into the DB --->
<cfif NOT isdefined("attributes.search")>
	<!--- display search criteria --->
	<cfinclude template="dsp_metrics_report_criteria.cfm">	
<cfelse>
	<!--- display search result --->
	<cfinclude template="qry_get_metrics_report.cfm">
	<cfswitch expression="#attributes.report_output_format_id#">
		<cfcase value="1">	
			<cfinclude template="dsp_metrics_report_result.cfm">
		</cfcase>
		<cfcase value="2">
			<cfsavecontent variable="variables.report_content">
				<cfinclude template="dsp_metrics_report_result.cfm">
				<cfheader name="Content-Disposition" value="filename=output_fte.xls">
			</cfsavecontent>
			<cfset variables.file_path=gettempfile(gettempdirectory(),"excel_")/>
			<cffile action="WRITE" file="#variables.file_path#" output="#variables.report_content.trim()#"/>
			<cfcontent type="application/msexcel" file="#variables.file_path#" deletefile="true"/>
		</cfcase>
		<cfcase value="3">
			<cfdocument format="PDF" backgroundvisible="yes" overwrite="no" fontembed="yes">
				<cfinclude template="dsp_metrics_report_result.cfm">
			</cfdocument>
		</cfcase>
		<cfdefaultcase>
			Set up a new case for report_output_format_id <cfoutput>#attributes.report_output_format_id#</cfoutput> at dsp_output_phasing_plan_details.cfm
		</cfdefaultcase>
	</cfswitch>	
</cfif>



