<!-- Reports/pag_current_month_records.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_current_month_records.cfm">
	<responsibilities>
		I display the my ICET page to the user
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="3/15/2009" role="FuseCoder" comments="Created File">
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
	<cfinclude template="../common_files/qry_get_faad_upload.cfm" />
	<cfoutput>
	<!--- show report criteria --->
	<fieldset>
		<legend>
			Monthly Report Criteria
		</legend>
		<cfform name="current_month_records" action="index.cfm?fuseaction=#attributes.fuseaction#" method="POST">
			<label for="upload_id">Prepared Date</label><br />
			<cfselect name="upload_id" id="upload_id" size="5" required="yes" message="Please select the prepared date.">
				<cfloop query="get_faad_upload">
					<option value="#upload_id#"<cfif currentrow EQ 1> SELECTED</cfif>>#dateformat(created_date, 'mm/dd/yyyy')#</option>
				</cfloop>
			</cfselect>
			<p><label for="sort_order">Sort Order</label><br />
			<cfselect name="sort_order" id="sort_order" size="2" required="yes" message="Please select the sort order.">
				<option value="contract_num, action_date DESC, mod_num DESC" selected>Award Number</option>
				<option value="action_date, contract_num, mod_num DESC">Date Posted</option>
			</cfselect></p>
			<p><cfinclude template="dsp_report_output_format.cfm" /></p>
			<div align="center"><input type="submit" name="contract_number" value="submit" /></div>
		</cfform>
	</fieldset>
	</cfoutput>
<cfelse>
	<cfinclude template="qry_get_current_month_records.cfm">
	
	<cfswitch expression="#attributes.report_output_format_id#">
		<cfcase value="1">
			<cfif get_current_month_records.recordcount>
				<cfinclude template="dsp_current_month_records_output.cfm">
			<cfelse>
				No records match your criteria.
			</cfif>
		</cfcase>
		<cfcase value="2">
			<cfsavecontent variable="variables.current_month_view">
				<cfif get_current_month_records.recordcount>
					<cfinclude template="dsp_current_month_records_output.cfm">
				<cfelse>
					No records match your criteria.
				</cfif>
				<cfheader name="Content-Disposition" value="filename=current_month_records.xls">
			</cfsavecontent>
			<cfset variables.file_path=gettempfile(gettempdirectory(),"excel_")/>
			<cffile action="WRITE" file="#variables.file_path#" output="#variables.current_month_view.trim()#"/>
			<cfcontent type="application/msexcel" file="#variables.file_path#" deletefile="true"/>
		</cfcase>
		<cfcase value="3">
			<cfdocument format="PDF" backgroundvisible="yes" overwrite="no" fontembed="yes" orientation="landscape">
				<cfif get_current_month_records.recordcount>
					<cfdocumentsection>
					<cfinclude template="dsp_current_month_records_output.cfm">
					</cfdocumentsection>
				<cfelse>
					No records match your criteria.
				</cfif>
			</cfdocument>
		</cfcase>
		<cfcase value="4">
			<cfsavecontent variable="variables.current_month_view">
				<cfif get_current_month_records.recordcount>
					<cfinclude template="dsp_current_month_records_output.cfm">
				<cfelse>
					No records match your criteria.
				</cfif>
				<cfheader name="Content-Disposition" value="filename=current_month.txt">
			</cfsavecontent>
			<cfset variables.file_path=gettempfile(gettempdirectory(),"text_")/>
			<cffile action="WRITE" file="#variables.file_path#" output="#variables.current_month_view.trim()#"/>
			<cfcontent type="text/plain" file="#variables.file_path#" reset="yes"/>
		</cfcase>
		<cfdefaultcase>
			<cfset variables.error="Set up a new case for report_output_format_id #attributes.report_output_format_id# at pag_#attributes.fuseaction#.cfm #variables.unknown_printable_variable#">
		</cfdefaultcase>
	</cfswitch>
	
	<cfif attributes.report_output_format_id EQ 1>
		<h3>Export this data to <a href="javascript:export_current_month_records(2)">Excel</a> or <a href="javascript:export_current_month_records(3)">PDF</a></h3>
		<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="export_current_month_records" fuseaction="#attributes.fuseaction#" field_name="report_output_format_id" processform="1" action_date="#attributes.action_date#" sort_order="#attributes.sort_order#" contract_number="#attributes.contract_number#">
		<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="special_maintenance" fuseaction="Maintenance.special_maintenance" field_name="faad_internal_data_id" processform="1" step="3" submit="submit">
	</cfif>
</cfif>