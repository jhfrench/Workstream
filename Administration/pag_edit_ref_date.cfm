<!-- Administration/pag_edit_ref_date.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_edit_ref_date.cfm">
	<responsibilities>
		I display the form for editing the REF_Date table.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="10/4/10" role="FuseCoder" comments="Created File">
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

<cfparam name="attributes.method" default="">
<!--- if data has been submitted to this page, insert it into the DB --->
<cfif isdefined("attributes.created_by")>
	<cfmodule template="qry_get_ref_date.cfm" odbc_date="#attributes.odbc_date#">
	<cfif get_ref_date.recordcount EQ 0>
		<!--- insert new record --->
		<cfinclude template="qry_insert_ref_date.cfm">
	<cfelse>
		<!--- update existing record --->
		<cfinclude template="qry_update_ref_date.cfm">
	</cfif>
</cfif>

<cfif len(attributes.method)>
	<cfmodule template="qry_get_ref_date.cfm" odbc_date="#attributes.odbc_date#">
	<cfscript>
		attributes.date_id=get_ref_date.date_id;
		attributes.odbc_date=get_ref_date.odbc_date;
		attributes.day_of_week_number=get_ref_date.day_of_week_number;
		attributes.holiday_ind=get_ref_date.holiday_ind;
		attributes.weekend_ind=get_ref_date.weekend_ind;
		attributes.date_year=get_ref_date.date_year;
		attributes.date_month=get_ref_date.date_month;
		attributes.date_day=get_ref_date.date_day;
		attributes.fiscal_year=get_ref_date.fiscal_year;
		attributes.program_year_id=get_ref_date.program_year_id;
	</cfscript>
<cfelse>
	<cfscript>
		attributes.date_id=0;
		attributes.odbc_date=now();
		attributes.day_of_week_number=0;
		attributes.holiday_ind=0;
		attributes.weekend_ind=0;
		attributes.date_year=0;
		attributes.date_month=0;
		attributes.date_day=0;
		attributes.fiscal_year=0;
		attributes.program_year_id=0;
	</cfscript>
</cfif>

<cfinclude template="dsp_edit_ref_date.cfm">