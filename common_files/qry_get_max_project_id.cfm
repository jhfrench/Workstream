
<!-- path/qry_get_max_project_id.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I get the max project id this is used in transactional inserts...

	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:42:02  daugherty
Initial revision

Revision 1.2  2002-02-04 11:30:50-05  daugherty
changed to used @@identity instead of max (note max does not work this read commited.(

Revision 1.1  2001-10-11 10:57:40-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	 
	||
	Variables:
	
	END FUSEDOC --->

<cfquery name="get_max_project_id" datasource="#application.datasources.main#">
	SELECT @@identity as Project_id
	FROM Project
</cfquery>
</cfsilent>