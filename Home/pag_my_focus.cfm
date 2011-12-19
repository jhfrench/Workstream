<!-- Home/pag_main.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_main.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="5/30/2007" role="FuseCoder" comments="Created File">
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
<div style="visibility:hidden; height:17px; overflow:hidden">
Welcome to #application.product_name#. This page contains drag and drop tables. The first table contains an overview of the status of funds for the current fiscal year.
The second table contains links to the following business warehouse reports. The next table contains information for the pending phasing plans.
The financial management table is next and is a future enhancement. The right most column contains two charts concerning the financial health of exploration systems.
</div>

<cfinclude template="dsp_fiscal_year_overview.cfm">
<cfinclude template="pag_bw_report_links.cfm">

<cfif listfind(variables.allowed_modules,10)>
	<cfmodule template="../common_files/qry_get_workflow_structure.cfm" exclude_first_step="1" program_year_id="#attributes.program_year_id#">
	<cfinclude template="dsp_pending_phasing_plans.cfm">
	<cfif get_workflow_structure.recordcount>
		<!--- If we do display data, create the hidden form that allows the user to jump to the workflow view --->
		<cfmodule template="../common_files/qry_get_phasing_plan_version.cfm" use_program_year_id="1" program_year_id="#attributes.program_year_id#">
		<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="workflow_view" fuseaction="Phasing_Plan.workflow_view" field_name="organization_id" field_value="" field2_variable_ind="1" field2_name="next_phasing_plan_status_id" processform="1" phasing_plan_version_id="#get_phasing_plan_version.phasing_plan_version_id#">
	</cfif>
</cfif>
<cfinclude template="dsp_internal_execution_plan_inbox.cfm">
<cfinclude template="dsp_funds_distribution_inbox.cfm">

	<img src="images/spacer.gif" width="530" height="1" alt="" border="0" /><br />
	<hr width="517" style="margin-top:2px;" align="left">
	<small><strong>Hidden Windows</strong>:<span id="stub_sys5"> <a href="javascript:void(Element.show('sys5'));void(Element.hide(this));" onclick="Element.show('sys5');Element.hide(this);">[Funds Status]</a></span><span id="stub_sys4"> <a href="javascript:void(Element.show('sys4'));void(Element.hide(this));" onclick="Element.show('sys4');Element.hide(this);">[Resources]</a></span><span id="stub_sys8"> <a href="javascript:void(Element.show('sys8'));void(Element.hide(this));" onclick="Element.show('sys8');Element.hide(this);">[Financial Health]</a></span><span id="stub_sys6"> <a href="javascript:void(Element.show('sys6'));void(Element.hide(this));" onclick="Element.show('sys6');Element.hide(this);">[Pending Phasing Plans]</a></span><span id="stub_sys7"> <a href="javascript:void(Element.show('sys7'));void(Element.hide(this));" onclick="Element.show('sys7');Element.hide(this);">[Internal Execution Plan Inbox]</a></span><span id="stub_sys10" style="display: none"> <a href="javascript:void(Element.show('sys10'));void(Element.hide(this));" onclick="Element.show('sys10');Element.hide(this);">[Funds Distribution Inbox]</a></span></small>
