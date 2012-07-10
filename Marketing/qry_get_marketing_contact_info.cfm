
<!--Marketing/qry_get_marketing_contact_info.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I get the information for the second CFGRID in the marketing section, this grid displays the information on people (address, phone, ect.)

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->

<cfquery name="get_marketing_contact_info" datasource="#application.datasources.main#">
SELECT Email.Email, Phone.Phone_Number, Phone.Extension, 
    Location.Address1, Location.Address2, Location.City, 
    Location.State, Location.Zip, Emp_Contact.LName, 
    Emp_Contact.Name, emp_contact.emp_id
FROM Emp_Contact
	LEFT OUTER JOIN  Email ON Emp_Contact.emp_id = Email.emp_id
		AND Email.email_type_id = 1
	LEFT OUTER JOIN  Location ON Emp_Contact.emp_id = Location.emp_id
		AND Location.Location_Type_Id = 1
	LEFT OUTER JOIN  Phone ON Emp_Contact.emp_id = Phone.emp_id
		AND Phone.Phone_type_id = 1
WHERE Emp_Contact.emp_id = #attributes.emp_id#
</cfquery>
