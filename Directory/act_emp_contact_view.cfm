
<!--Directory/act_emp_contact_email.cfm
	Author: Victor B.-->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I loop over the query of employee demographic data returned from query and send an email to employee in the email list
									I send a HTML email to employee with an embedded, prepopulated form,
	||
	Name: Victor Blell
	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:46:19  daugherty
Initial revision

Revision 1.0  2003-03-21 11:38:12-05  blell
created template


	||

	--> emp_id: id that identifies user to workstream
	--> lname: string containing the last name of an employee
	--> name: string containing the first name of an employee
	--> address1: string containing the first address line for a person
	--> address2: string containing the second address line for a person
	--> Location_Type: string containing the Location type for a person
	--> City: string containing the City for a person
	--> State: string containing the State for a person 
	--> Zip: string containing the Zip for a person
	--> location_ID: string containing the Locatio ID for a person
	--> Location_Type_ID: string containing Location Type ID for a person
	-->  Phone_Type_ID: string containing Phone Type ID for a person
    -->  Phone_Type: string containing Phone Type for a person 
	-->  Phone_Number: string containing Phone Number for a person
    -->  Extension: string containing Phone Extension for a person
	-->  Phone_id: string containing Phone ID for a person
	--> Email_Type_ID: string containing email Type ID for a person
    --> Email_Type: string containing email Type for a person 
	--> Email: string containing email for a person
	--> Email_ID: string containing email ID for a person
 --->

</cfsilent>
<!--- paramed form variables (safety)--->
<cfparam name="fname" default="">
<cfparam name="lname" default="">
<cfparam name="work_phone" default="">
<cfparam name="extension" default="">
<cfparam name="home_phone" default="">
<cfparam name="email" default="">
<cfparam name="biography" default="">
<cfparam name="address1" default="">
<cfparam name="address2" default="">
<cfparam name="city" default="">
<cfparam name="state" default="">
<cfparam name="Zip" default="">

	<cfoutput>
	<table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolor="##f3f3f3" bordercolorlight="##ededed" bordercolordark="##fbfbfb" class="RegText#session.workstream_text_size#">
	<form action="index.cfm?fuseaction=employee_contact_update" method="post" name="input_form"  class="RegText#session.workstream_text_size#">
		<tr>
			<td colspan="2" class="SubHeadText#session.workstream_text_size#">Name:</td>
			<td class="SubHeadText#session.workstream_text_size#">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					#get_demographics.fname#
					&nbsp;
					#get_demographics.lname#
				<input type="hidden" name="emp_id" value="#get_demographics.emp_id#">
			</td>
		</tr>
		
		<!--- Phone --->
		<tr><td colspan="3" bgcolor="##dadada" class="SubHeadText#session.workstream_text_size#">&nbsp;&nbsp;Phones</td></tr>
		<cfloop query="get_contact_phones">
			<tr>
				<td class="SubHeadText#session.workstream_text_size#" valign="top" align="right" width="15%">#Phone_type#:</td>
				<td class="RegText#session.workstream_text_size#">&nbsp;</td>
				<td class="RegText#session.workstream_text_size#">
					<input type="text" name="phone_number_#phone_type_id#" value="#phone_number#" size="15" class="RegText#session.workstream_text_size#" maxlength="12">
					<cfif listcontainsnocase(phone_type, "work")>
						Ext: <input type="text" name="extension_#phone_type_id#" value="#extension#" size="15" maxlength="4" class="RegText#session.workstream_text_size#">
					</cfif>
					<input type="hidden" name="phone_id" value="#phone_id#">
					<input type="hidden" name="phone_type_id" value="#phone_type_id#">
				</td>
			</tr>
		</cfloop>
		
		<!--- Emails --->
		<tr><td colspan="3" bgcolor="##dadada" class="SubHeadText#session.workstream_text_size#">&nbsp;&nbsp;Emails</td></tr>
		<cfloop query="get_contact_emails">
			<tr>
				<td class="SubHeadText#session.workstream_text_size#" valign="top" align="right">#email_type#:</td>
				<td class="RegText#session.workstream_text_size#">&nbsp;</td>
				<td class="RegText#session.workstream_text_size#">
					<input type="text" name="email_#Email_Type_ID#" value="#email#" size="40" class="RegText#session.workstream_text_size#">
					<input type="hidden" name="email_id" value="#email_id#">
					<input type="hidden" name="Email_Type_ID" value="#Email_Type_ID#">
				</td>
			</tr>
		</cfloop>
		
		<!--- Addresses --->
		<tr><td colspan="3" bgcolor="##dadada" class="SubHeadText#session.workstream_text_size#">&nbsp;&nbsp;Addresses</td></tr>
		<cfloop query="get_contact_locations">
			<tr>
				<td rowspan="4" class="SubHeadText#session.workstream_text_size#" valign="top" align="right">#Location_Type#:</td>
				<td class="RegText#session.workstream_text_size#" align="right">Street:</td>
				<td class="RegText#session.workstream_text_size#">
				<input type="text" name="address1_#location_type_id#" value="#address1#" size="60" class="RegText#session.workstream_text_size#"> &nbsp;&nbsp;
				Apt:<input type="text" name="address2_#location_type_id#" value="#address2#" size="10" class="RegText#session.workstream_text_size#"></td>
			</tr>
			<tr>
				<td  align="right" class="RegText#session.workstream_text_size#">City:</td>
				<td><input type="text" name="city_#location_type_id#" value="#city#" size="40" class="RegText#session.workstream_text_size#"></td>
			</tr>
			<tr>
				<td  align="right" class="RegText#session.workstream_text_size#">State:</td> 
				<td><input type="text" name="state_#location_type_id#" value="#state#" size="40" class="RegText#session.workstream_text_size#"></td>
			</tr>
			<tr>
				<td   align="right" class="RegText#session.workstream_text_size#">Zip:</td> 
				<td><input type="text" name="zip_#location_type_id#" value="#zip#" size="5" maxlength="5" class="RegText#session.workstream_text_size#"></td>
			</tr>
			<input type="hidden" name="location_id" value="#location_id#">
			<input type="hidden" name="location_type_id" value="#location_type_id#">
		</cfloop>
		
		<!--- biography --->
		<tr><td colspan="3" bgcolor="##dadada" class="SubHeadText#session.workstream_text_size#">&nbsp;&nbsp;Biography</td></tr>
		<tr>
			<td  class="SubHeadText#session.workstream_text_size#" valign="top" align="right">&nbsp;</td>
			<td class="RegText#session.workstream_text_size#">&nbsp;</td>
			<td>
				<textarea cols="100" rows="7" name="biography"  class="RegText#session.workstream_text_size#">#get_demographics.biography#</textarea>
				<input type="hidden" name="emp_biography_id" value="#get_demographics.emp_biography_id#">
			</td>
		</tr>
		
		<tr>
			<td colspan="3" bgcolor="##dadada" class="RegText#session.workstream_text_size#" align="center">
				<br><br>
				<input type="reset" class="RegText#session.workstream_text_size#">
				<input type="submit" value="Update Record" class="RegText#session.workstream_text_size#">
			</td>
		</tr>
	</form>
	</table>
</cfoutput>

