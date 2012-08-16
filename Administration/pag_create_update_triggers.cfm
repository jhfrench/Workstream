<!-- Administration/pag_create_update_triggers.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_create_update_triggers.cfm">
	<responsibilities>
		I create an update trigger for each table that ensures tables won't be updated (except to set active_ind=0).
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="3/27/2008" role="FuseCoder" comments="Created File">
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


<cfquery name="get_system_tables" datasource="#application.datasources.main#">
SELECT *
FROM User_Tab_Columns
WHERE LOWER(column_name)='active_ind'
	AND table_name NOT LIKE 'BIN%'
ORDER BY table_name
</cfquery>

<pre>
<cfoutput query="get_system_tables">
create or replace TRIGGER Update_#left(table_name,18)# BEFORE UPDATE ON #table_name#
FOR EACH ROW 
BEGIN
	--if the user is attempting to update any column except active_ind, let's give them a piece of our mind 
	IF :new.active_ind!=0 THEN
		RAISE_APPLICATION_ERROR(-20000, 'All #application.product_name# tables are self-archiving. Therefore, you may not update #table_name# except to deactivate an old record.'); 
	END IF;
END;
</cfoutput>
</pre>
