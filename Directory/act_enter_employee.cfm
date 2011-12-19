
<!--Directory/act_enter_employee.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I call the queries that are used to enter a new workstream user. If provided, I upload the provided image and convert the image path into a name to be used in the demographics table. Then I make an entry into the emp_contact table, where I also retrieve the emp_id for the new record. Using this emp_id I make entries into the demographics, copany, location, supervisor, security, company_visible_to, email_phone and emp_biography tables.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.1  2006/01/19 19:55:45  stetzer
	Added position number entry

	Revision 1.0  2005-02-15 15:46:20-05  daugherty
	Initial revision

	Revision 1.5  2002-04-15 15:52:22-04  lee
	added <cfinclude template="qry_pto_rollover_entry.cfm">

	Revision 1.4  2002-03-08 16:25:30-05  long
	added INSERT INTO security product access

	Revision 1.3  2001-11-15 10:12:58-05  long
	Changed the isolation level from Serializable to read_committed

	Revision 1.2  2001-10-16 17:07:28-04  french
	Finishing first implementation of employee entry function.

	Revision 1.1  2001-10-11 10:56:14-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	||
	END FUSEDOC --->
</cfsilent>
<!--- <cfset variables.destination="#replace(cgi.PATH_TRANSLATED, listchangedelims(cgi.SCRIPT_NAME, "\", "/"), "")#isay\Create\upload.cfm">
<cffile action="UPLOAD" destination="#variables.destination#" filefield="photo" nameconflict="MAKEUNIQUE" accept="image/*">
<cfset photo=file.serverfile> --->
<cftransaction isolation="READ_COMMITTED">
	<cfinclude template="qry_emp_contact_entry.cfm">
	<cfinclude template="qry_demographics_entry.cfm">
	<cfinclude template="qry_company_entry.cfm">
	<cfinclude template="qry_location_entry.cfm">
	<!--- <cfset need_all_supervisors = 1> --->
	<cfinclude template="qry_get_present_supervisor.cfm">
	<cfinclude template="qry_emp_supervisor_entry.cfm">
	<cfinclude template="qry_company_visible_to_entry.cfm">
	<cfinclude template="qry_email_entry.cfm">
	<cfinclude template="qry_phone_entry.cfm">
	<cfinclude template="qry_emp_biography_entry.cfm">
	<cfinclude template="qry_security_entry.cfm">
	<cfinclude template="qry_product_access_entry.cfm">
	<cfinclude template="qry_pto_rollover_entry.cfm">
	<cfinclude template="qry_position_number_entry.cfm">	
	
	<cfset application.team_changed=now()>
</cftransaction>

