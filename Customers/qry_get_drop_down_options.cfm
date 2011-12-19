
<!--Customers/qry_get_drop_down_options.cfm
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
Revision 1.0  2005/02/15 20:46:07  daugherty
Initial revision

Revision 1.1  2001-10-11 10:56:20-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->
<cfquery name="get_drop_down_options" datasource="#application.datasources.main#">
SELECT User_Field_Items.selection_title, User_Field_Items.user_field_items_id
FROM User_Field_Items
WHERE User_Field_Items.user_field_id=#user_field_id#
ORDER BY User_Field_Items.selection_title
</cfquery>
</cfsilent>

