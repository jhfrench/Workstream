<!-- Administration/dsp_edit_ref_priority.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_edit_ref_business_category.cfm">
	<responsibilities>
		I display the form for priority maintenance.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/17/2009" role="FuseCoder" comments="Created File">
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

<cfparam name="attributes.business_category_id" default="0">
<cfparam name="attributes.description" default="0">

<!--- if data has been submitted to this page, insert it into the DB --->
<cfif isdefined("attributes.created_by")>
	<!--- deactivate old record --->
	<cfinclude template="qry_deactivate_ref_business_category.cfm">
	<!--- insert new record --->
	<cfinclude template="qry_insert_ref_business_category.cfm">
</cfif>

<cfinclude template="dsp_edit_ref_business_category.cfm">

