<!-- Reports/pag_quarterly_tape.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_main.cfm">
	<responsibilities>
		I display the my ICET page to the user
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="3/15/2009" role="FuseCoder" comments="Created File">
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
<cfif NOT isdefined("attributes.contract_number")>
	<cfset variables.export_to_text_ind=1>
	<cfquery name="get_quarter_posted" datasource="#application.datasources.main#">
	SELECT fiscal_qtr, CAST(LEFT(fiscal_qtr,4) AS CHAR(4))+', quarter '+CAST(RIGHT(fiscal_qtr,1) AS CHAR(1)) AS quarter_posted
	FROM (
		SELECT fiscal_qtr
		FROM FAAD_Internal_Data
		GROUP BY fiscal_qtr
	) year_month_combinations
	ORDER BY fiscal_qtr DESC
	</cfquery>
	<cfoutput>
	<!--- show report criteria --->
	<fieldset>
		<legend>
			Quarterly Extract Report Criteria
		</legend>
		<cfform name="quarterly_tape" action="index.cfm?fuseaction=#attributes.fuseaction#" method="POST">
			<p><label for="fiscal_qtr">Quarter Posted</label><br />
			<cfselect name="fiscal_qtr" id="fiscal_qtr" size="10" required="yes" message="Please select the quarter posted.">
				<cfloop query="get_quarter_posted">
					<option value="#fiscal_qtr#"<cfif currentrow EQ 1> SELECTED</cfif>>#quarter_posted#</option>
				</cfloop>
			</cfselect></p>
			<p><input type="checkbox" name="top_ind" id="top_ind" value="1" />&nbsp;<label for="top_ind">Top 50 records only</label></p>
			<p><label for="sort_order">Sort Order</label><br />
			<cfselect name="sort_order" id="sort_order" size="2" required="yes" message="Please select the sort order.">
				<option value="fed_award_id_number, action_date DESC, mod_num DESC" selected>Award Number</option>
				<option value="action_date, fed_award_id_number">Action Date</option>
				<option value="proj_desc, fed_award_id_number, action_date DESC, mod_num DESC">Description</option>
			</cfselect></p>
			<p><cfinclude template="dsp_report_output_format.cfm" /></p>
			<div align="center"><input type="submit" name="contract_number" value="submit" /></div>
		</cfform>
	</fieldset>
	</cfoutput>
<cfelse>
	<cfinclude template="qry_get_quarterly_tape.cfm">
	<cfquery name="get_quarter_as_of" dbtype="query">
	SELECT MAX(action_date) AS as_of_date
	FROM get_quarterly_tape
	</cfquery>
	
	<cfswitch expression="#attributes.report_output_format_id#">
		<cfcase value="1">
			<cfif get_quarterly_tape.recordcount>
				<cfinclude template="dsp_quarterly_tape_output.cfm">
			<cfelse>
				No records match your criteria.
			</cfif>
		</cfcase>
		<cfcase value="2">
			<cfsavecontent variable="variables.quarterly_tape_view">
				<cfif get_quarterly_tape.recordcount>
					<cfinclude template="dsp_quarterly_tape_output.cfm">
				<cfelse>
					No records match your criteria.
				</cfif>
				<cfheader name="Content-Disposition" value="filename=quarterly_tape.xls">
			</cfsavecontent>
			<cfset variables.file_path=gettempfile(gettempdirectory(),"excel_")/>
			<cffile action="WRITE" file="#variables.file_path#" output="#variables.quarterly_tape_view.trim()#"/>
			<cfcontent type="application/msexcel" file="#variables.file_path#" deletefile="true"/>
		</cfcase>
		<cfcase value="3">
			<cfdocument format="PDF" backgroundvisible="yes" overwrite="no" fontembed="yes" orientation="landscape">
				<cfif get_quarterly_tape.recordcount>
					<cfdocumentsection>
					<cfinclude template="dsp_quarterly_tape_output.cfm">
					</cfdocumentsection>
				<cfelse>
					No records match your criteria.
				</cfif>
			</cfdocument>
		</cfcase>
		<cfcase value="4">
			<cfsavecontent variable="variables.quarterly_tape_view">
				<cfif get_quarterly_tape.recordcount>
					<cfinclude template="dsp_quarterly_tape_output_text.cfm">
				<cfelse>
					No records match your criteria.
				</cfif>
				<cfheader name="Content-Disposition" value="attachment;filename=quarterly_tape.txt">
			</cfsavecontent>
			<cfset variables.file_path=gettempfile(gettempdirectory(),"text_")/>
			<cffile action="WRITE" file="#variables.file_path#" output="#variables.quarterly_tape_view.trim()#"/>
			<cfcontent type="text/plain" file="#variables.file_path#" reset="yes"/>
		</cfcase>
		<cfdefaultcase>
			<cfset variables.error="Set up a new case for report_output_format_id #attributes.report_output_format_id# at pag_#attributes.fuseaction#.cfm #variables.unknown_printable_variable#">
		</cfdefaultcase>
	</cfswitch>
	
	<cfif attributes.report_output_format_id EQ 1>
		<h3>Export this data to <a href="javascript:export_quarterly_tape(2)">Excel</a> or <a href="javascript:export_quarterly_tape(3)">PDF</a></h3>
		<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="export_quarterly_tape" fuseaction="#attributes.fuseaction#" field_name="report_output_format_id" processform="1" fiscal_qtr="#attributes.fiscal_qtr#" sort_order="#attributes.sort_order#" contract_number="#attributes.contract_number#">
		<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="special_maintenance" fuseaction="Maintenance.special_maintenance" field_name="faad_internal_data_id" processform="1" step="3" submit="submit">
	</cfif>
</cfif>