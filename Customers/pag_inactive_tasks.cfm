
<!--Customers/pag_inactive_tasks.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:46:01  daugherty
Initial revision

Revision 1.1  2001-10-11 10:56:23-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->
<cfinclude template="qry_get_tasks_to_inactive.cfm">
<cfinclude template="dsp_inactive_tasks.cfm">
