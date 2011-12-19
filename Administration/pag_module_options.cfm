
<!--Admin/pag_module_options.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the workstream task list.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.5  2006/09/15 22:26:27  csy
<>

Revision 1.0  2006-08-16 09:32:08-04  csy
Initial revision

Revision 1.4  2006-07-07 13:59:17-04  csy
task 43700 I moved the "set and save profile" instructions from this template

Revision 1.3  2006-06-06 16:23:27-04  csy
task 43700 I wrote instructions on how to set a profile

Revision 1.2  2006-05-31 15:21:24-04  csy
<>

Revision 1.1  2006-05-04 10:33:33-04  csy
task 43700 Modified so that user's new selection of companies to be viewed is saved to the database.

Revision 1.0  2005-02-15 15:27:35-05  daugherty
Initial revision

Revision 1.1  2001-10-11 10:55:32-04  long
Added $log $ for edits to all CFM files that have fusedocs.

 
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
<cfparam name="attributes.order_by" default="date_due">
<cfif NOT compare(listlast(attributes.fuseaction, '.'),"admin_options")>
	<cfset request.colspan=3>
<cfelse>
	<cfset request.colspan=2>
</cfif>
</cfsilent>
<cfinclude template="../common_files/act_client_vars.cfm">

<cfform action="index.cfm?fuseaction=#attributes.fuseaction#" name="timekeeping_options" method="POST">
<table align="center" bgcolor="#cccccc" border="0" cellpadding="0" cellspacing="0" width="90%">
	<cfinclude template="dsp_module_options_nav.cfm">
	<cfswitch expression="#attributes.fuseaction#">
		<cfcase value="admin_options">
			  <cfinclude template="dsp_admin_options.cfm">
			  <cfinclude template="dsp_submit_options.cfm">
		</cfcase>
		<cfcase value="save_profile">
			<cfif isdefined("attributes.profile_name")>
				<cfinclude template="act_save_profile.cfm">
				<cfinclude template="dsp_profile_message.cfm">
			<cfelse>
				<cfinclude template="dsp_save_profile.cfm">
				<cfmodule template="dsp_submit_options.cfm" include_reset="0" submit_value="Save Settings">
			</cfif>
		</cfcase>
		<cfcase value="load_profile">
			<cfif isdefined("attributes.profile_id")>
				<cfinclude template="../common_files/act_load_profile.cfm">
				<cfinclude template="dsp_profile_message.cfm">
			<cfelse>
				<cfinclude template="../common_files/qry_profile_lookup.cfm">
				<cfinclude template="dsp_load_profile.cfm">
				<cfmodule template="dsp_submit_options.cfm" include_reset="0" submit_value="Load Settings">
			</cfif>
		</cfcase>
		<cfcase value="timekeeping_options">
			<cfinclude template="dsp_timekeeping_options.cfm">
			<cfinclude template="dsp_submit_options.cfm">
		</cfcase>
		<cfdefaultcase>
			<cfinclude template="dsp_no_options.cfm">
		</cfdefaultcase>
	</cfswitch>
</table>
</cfform>
