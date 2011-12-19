<!-- Administration/pag_edit_ref_business_function.cfm
	Author: Lyudmila Klimenko-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_edit_ref_business_function.cfm">
	<responsibilities>
		I display the form for editing business function and act(send information to DB) when the form is submitted.
	</responsibilities>
	<properties>
		<history email="lyudmila.klimenko-1@nasa.gov" author="Lyudmila Klimenko" type="create" date="6/21/2007" role="FuseCoder" comments="Created File">
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


<cfparam name="attributes.acronym" default="">
<cfparam name="attributes.active_ind" default="1">
<cfparam name="attributes.business_function_id" default="0">
<cfparam name="attributes.default_access_ind" default="0">
<cfparam name="attributes.description" default="">
<cfparam name="attributes.parent_business_function_id" default="NULL">
<cfparam name="attributes.require_login_ind" default="1">
<cfparam name="attributes.sort_order" default="">
<cfparam name="attributes.submit" default="">
<cfparam name="attributes.viewable_ind" default="1">

<cfparam name="variables.check_form_field" default="0">
<cfparam name="variables.display_message" default="">

<!--- if the submit button is pressed --->
<cfif NOT comparenocase(attributes.submit, "submit")>
	<!--- if no input date in description, display message --->
	<cfif NOT len(attributes.description)>
		<cfset variables.display_message=variables.display_message & "<li>Please enter description</li>">
		<cfset variables.check_form_field=variables.check_form_field+1>
	</cfif>
	<cfif NOT len(attributes.acronym)>
		<cfset variables.display_message=variables.display_message & "<li>Please enter acronym</li>">
		<cfset variables.check_form_field=variables.check_form_field+1>
	</cfif>
	<cfif NOT len(attributes.sort_order)>
		<cfset variables.display_message=variables.display_message & "<li>Please enter sort order</li>">
		<cfset variables.check_form_field=variables.check_form_field+1>
	</cfif>
	<!--- if there is no error --->
	<cfif variables.check_form_field EQ 0>
	<!--- DO YOUR PROCESSING --->
		<cfif isdefined("attributes.created_by")>
			<!--- deactivate old record --->
			<cfinclude template="qry_deactivate_ref_business_function.cfm">
			<cfif attributes.active_ind>
				<!--- reorder existing records --->
				<cfquery name="update_ref_business_function_sort_order" datasource="#application.datasources.main#">
				UPDATE REF_Business_Function
				SET sort_order=sort_order+1
				WHERE active_ind=1
					AND sort_order >=#attributes.sort_order#
				</cfquery>
				<cfif attributes.business_function_id EQ 0>
					<!--- insert new record --->
					<cfinclude template="qry_insert_ref_business_function.cfm">
				<cfelse>
				<!--- update existing record --->
					<cfquery name="update_ref_business_function_sort_order" datasource="#application.datasources.main#">
					UPDATE REF_Business_Function
					SET parent_business_function_id=#attributes.parent_business_function_id#,
						description='#attributes.description#',
						acronym='#attributes.acronym#',
						require_login_ind=#attributes.require_login_ind#,
						default_access_ind=#attributes.default_access_ind#,
						viewable_ind=#attributes.viewable_ind#,
						sort_order=#attributes.sort_order#,
						created_by=#attributes.created_by#,
						active_ind=#attributes.active_ind#
					WHERE business_function_id=#attributes.business_function_id#
					</cfquery>
				</cfif>
			</cfif>
		</cfif>
	</cfif>
</cfif>

<cfparam name="attributes.method" default="">
<cfif attributes.business_function_id NEQ 0>
	<cfmodule template="qry_get_business_function.cfm" business_function_id="#attributes.business_function_id#">
	<cfset attributes.active_ind=get_business_function.active_ind>
	<cfset attributes.acronym=get_business_function.acronym>
	<cfset attributes.business_function_id=get_business_function.business_function_id>
	<cfset attributes.default_access_ind=get_business_function.default_access_ind>
	<cfset attributes.description=get_business_function.description>
	<cfset attributes.parent_business_function_id=get_business_function.parent_business_function_id>
	<cfset attributes.require_login_ind=get_business_function.require_login_ind>
	<cfset attributes.sort_order=get_business_function.sort_order>
	<cfset attributes.viewable_ind=get_business_function.viewable_ind>
</cfif>

<cfif attributes.active_ind>
	<cfset variables.active_ind_yes=1>
	<cfset variables.active_ind_no=0>
<cfelse>
	<cfset variables.active_ind_yes=0>
	<cfset variables.active_ind_no=1>
</cfif>
<cfif attributes.default_access_ind>
	<cfset variables.default_access_ind_yes=1>
	<cfset variables.default_access_ind_no=0>
<cfelse>
	<cfset variables.default_access_ind_yes=0>
	<cfset variables.default_access_ind_no=1>
</cfif>
<cfif attributes.require_login_ind>
	<cfset variables.require_login_ind_yes=1>
	<cfset variables.require_login_ind_no=0>
<cfelse>
	<cfset variables.require_login_ind_yes=0>
	<cfset variables.require_login_ind_no=1>
</cfif>
<cfif attributes.viewable_ind>
	<cfset variables.viewable_ind_yes=1>
	<cfset variables.viewable_ind_no=0>
<cfelse>
	<cfset variables.viewable_ind_yes=0>
	<cfset variables.viewable_ind_no=1>
</cfif>
<cfinclude template="dsp_edit_ref_business_function.cfm">