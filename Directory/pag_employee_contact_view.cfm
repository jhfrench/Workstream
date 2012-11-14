
<!--Directory/pag_employee_contact_view.cfm
	Author: Jeromy French-->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I loop over the query of employee demographic data returned from query and send an email to employee in the email list
	I send a HTML email to employee with an embedded, prepopulated form,
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 

	--> user_account_id: id that identifies user to workstream
	--> last_name: string containing the last name of an employee
	--> name: string containing the first name of an employee
	--> address1: string containing the first address line for a person
	--> address2: string containing the second address line for a person
	--> Location_Type: string containing the Location type for a person
	--> City: string containing the City for a person
	--> State: string containing the State for a person 
	--> Zip: string containing the Zip for a person
	--> location_ID: string containing the Locatio ID for a person
	--> Location_Type_ID: string containing Location Type ID for a person
	--> Phone_Type_ID: string containing Phone Type ID for a person
	-->  Phone_Type: string containing Phone Type for a person 
	--> Phone_Number: string containing Phone Number for a person
	-->  Extension: string containing Phone Extension for a person
	--> Phone_id: string containing Phone ID for a person
	--> email_type_id: string containing email Type ID for a person
	--> Email_Type: string containing email Type for a person 
	--> Email: string containing email for a person
	--> Email_ID: string containing email ID for a person
 --->

</cfsilent>
<cfparam name="fname" default="">
<cfparam name="last_name" default="">
<cfparam name="work_phone" default="">
<cfparam name="extension" default="">
<cfparam name="home_phone" default="">
<cfparam name="email" default="">
<cfparam name="biography" default="">
<cfparam name="address1" default="">
<cfparam name="address2" default="">
<cfparam name="city" default="">
<cfparam name="state" default="">
<cfparam name="zip" default="">
<cfoutput>
<h1>Personal Contact Sheet</h1>
<h2>for #get_demographics.first_name# #get_demographics.last_name#</h2>
<form name="form_employee_contact_view" action="index.cfm?fuseaction=Directory.employee_contact_update" method="post" class="form-horizontal">
	<fieldset>
		<legend><h3>Phone Numbers</h3></legend>
	<cfloop query="get_contact_phones">
		<div class="control-group">
			<label class="control-label" for="phone_number_#phone_type_id#">#phone_type#</label>
			<div class="controls">
				<input type="text" name="phone_number_#phone_type_id#" id="phone_number_#phone_type_id#" value="#phone_number#" maxlength="12" class="span8" />
				<cfif listcontainsnocase(phone_type, "work")>
					<label for="extension_#phone_type_id#">Extension</label> <input type="text" name="extension_#phone_type_id#" id="extension_#phone_type_id#" value="#extension#" maxlength="4" class="span4" />
				</cfif>
				<input type="hidden" name="phone_id" value="#phone_id#" />
				<input type="hidden" name="phone_type_id" value="#phone_type_id#" />
			</div>
		</div>
	</cfloop>
	</fieldset>

	<fieldset>
		<legend><h3>Emails</h3></legend>
		<!--- Emails --->
	<cfloop query="get_contact_emails">
		<div class="control-group">
			<label class="control-label" for="email_#email_type_id#">#email_type#</label>
			<div class="controls">
				<input type="text" name="email_#email_type_id#" id="email_#email_type_id#" value="#email#" class="span8" />
				<input type="hidden" name="email_id" value="#email_id#" />
				<input type="hidden" name="email_type_id" value="#email_type_id#" />
			</div>
		</div>
	</cfloop>
	</fieldset>

	<fieldset>
		<legend><h3>Addresses</h3></legend>
	<cfloop query="get_contact_locations">
		<fieldset>
			<legend>#location_type#</legend>
		<div class="control-group">
			<label class="control-label" for="address1_#location_type_id#">Street</label>
			<div class="controls">
				<input type="text" name="address1_#location_type_id#" id="address1_#location_type_id#" value="#address1#" class="span8" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="address2_#location_type_id#">Street 2</label>
			<div class="controls">
				<input type="text" name="address2_#location_type_id#" id="address2_#location_type_id#" value="#address2#" class="span8" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="city_#location_type_id#">City</label>
			<div class="controls">
				<input type="text" name="city_#location_type_id#" id="city_#location_type_id#" value="#city#" class="span8" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="state_#location_type_id#">State</label>
			<div class="controls">
				<input type="text" name="state_#location_type_id#" id="state_#location_type_id#" value="#state#" class="span8" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="zip_#location_type_id#">Zip Code</label>
			<div class="controls">
				<input type="text" name="zip_#location_type_id#" id="zip_#location_type_id#" value="#zip#" maxlength="5" class="span4" />
			</div>
		</div>
		</fieldset>
		<input type="hidden" name="location_id" value="#location_id#" />
		<input type="hidden" name="location_type_id" value="#location_type_id#" />
	</cfloop>
	</fieldset>

	<div class="control-group">
		<label class="control-label" for="biography">Biography</label>
		<div class="controls">
			<textarea name="biography" id="biography" rows="7" class="span10">
				#get_demographics.biography#
			</textarea>
			<input type="hidden" name="emp_biography_id" value="#get_demographics.emp_biography_id#" />
		</div>
	</div>
	<div class="control-group">
		<div class="controls">
			<input type="hidden" name="user_account_id" value="#get_demographics.user_account_id#" />
			<input type="submit" value="Update Record" class="btn btn-primary" />
			<input type="reset" class="btn" />
		</div>
	</div>
</form>
</cfoutput>
