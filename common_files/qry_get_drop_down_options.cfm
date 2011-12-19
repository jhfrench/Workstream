
<!--common_files/qry_get_drop_down_options.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve the main project details.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.1  2005/11/28 17:35:43  stetzer
	<>

	Revision 1.0  2005-02-15 15:42:00-05  daugherty
	Initial revision

	Revision 1.1  2001-10-18 12:08:44-04  french
	Moved to common_files from Customers.

	||
	END FUSEDOC --->
<cfquery name="get_drop_down_options" datasource="#application.datasources.main#">
SELECT User_Field_Items.selection_title, User_Field_Items.user_field_items_id
FROM User_Field_Items
WHERE User_Field_Items.user_field_id=#user_field_id#
ORDER BY User_Field_Items.user_field_items_id
</cfquery>
</cfsilent>

