<!-- Application_Manager/act_log_page_request.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="act_log_page_request.cfm" Specification="2.0">
	<responsibilities>
		I log the page request in the database. This data can then be compiled for reporting.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="7/25/2008" role="FuseCoder" comments="Created File">
			$Id$
		</history>
	</properties>
</fusedoc>
--->
<cfparam name="attributes.user_identification" default="unknown">
<cfparam name="attributes.log_type_id" default="1"><!--- 1=insert, 2=update --->
<cfswitch expression="#attributes.log_type_id#">
	<cfcase value="1">
		<cfinclude template="qry_insert_page_request.cfm">
		<cfinclude template="qry_get_page_request_id.cfm">
		<cfset caller.variables.page_request_id=get_page_request_id.page_request_id>
		<cfset caller.variables.page_request_start_time=gettickcount()>
	</cfcase>
	<cfcase value="2">
		<cfparam name="attributes.page_request_start_time" default="#gettickcount()#">
		<cfset variables.page_load_time=gettickcount()-attributes.page_request_start_time>
		<cfinclude template="qry_update_page_request.cfm">
	</cfcase>
</cfswitch>