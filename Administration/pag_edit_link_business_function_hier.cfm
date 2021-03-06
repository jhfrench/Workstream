<!-- Administration/pag_edit_link_business_function_hier.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_edit_link_business_function_hier.cfm">
	<responsibilities>
		I display the form for editing link business function hierarchy and act(send information to DB) when the form is submitted.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/10/2007" role="FuseCoder" comments="Created File">
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
<cfif isdefined("attributes.created_by")>
	<!--- deactivate old record --->
	<cfinclude template="qry_deactivate_link_business_function_hier.cfm">
	<!--- insert new record --->
	<cfinclude template="qry_insert_link_business_function_hier.cfm">
</cfif>

<cfparam name="attributes.l_b_f_h_id" default="0">
<cfparam name="attributes.business_function_id" default="0">
<cfparam name="attributes.l_p_y_h_id" default="0">

<cfinclude template="qry_get_business_function.cfm">
<cfinclude template="qry_get_link_program_year_hierarchy.cfm">
<cfinclude template="qry_get_link_business_function_hier.cfm">

<cfinclude template="dsp_edit_link_business_function_hier.cfm">