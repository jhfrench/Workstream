<!-- Administration/pag_manage_email.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_manage_email.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="6/4/2009" role="FuseCoder" comments="Created File">
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


<cfparam name="attributes.step" default="1">
<cfparam name="attributes.email_category_id" default="0">

<cfform name="form_manage_email" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">
<cfswitch expression="#attributes.step#">
	<cfcase value="1">
		<cfset attributes.show_buttons_ind=0>
		<cfmodule template="../common_files/qry_get_ref_business_category.cfm" state_province_id="0">
		<cfmodule template="../common_files/qry_get_ref_naics.cfm" state_province_id="0">
		<cfmodule template="../common_files/qry_get_ref_state_province.cfm" state_province_id="0">
		<cfinclude template="dsp_select_target_audience.cfm">
	</cfcase>
	<cfcase value="2">
		<cfinclude template="qry_get_target_email_audience.cfm">
		<cfinclude template="dsp_compose_email.cfm">      
	</cfcase>
	<cfcase value="3">
		<cfinclude template="act_send_email.cfm">
	</cfcase>
</cfswitch>
</cfform>