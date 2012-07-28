<!-- Administration/pag_manage_email_subscriptions.cfm
	Author: Steven Liu -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_manage_opt-out_list.cfm">
	<responsibilities>
	Show Active contents of Email_Blacklist table
	Four columns:
		reinstate_email_blacklist_id (checkbox named email_blacklist_id; if checked, form submission will deactivate the corresponding Email_Blacklist record
		email address: email address that is blacklisted
		created by: outer join to Demographics record to get the name of person who created the Email_Blacklist record
		created date
	When form is submitted, deactivate any checked fields
	</responsibilities>
	<properties>
		<history email="csliu@nasa.gov" author="Steven Liu" type="create" date="8/3/2009" role="FuseCoder" comments="Created File">
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
<cfparam name="attributes.email_blacklist_id" default="0">
<cfoutput>
<cfif isdefined("attributes.created_by")>
	<cfinclude template="qry_update_email_blacklist.cfm">
</cfif>
</cfoutput>
<cfinclude template="qry_get_email_blacklist.cfm">
<cfinclude template="dsp_manage_opt-out_list.cfm">
