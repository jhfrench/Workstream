
<!--Tools/pag_home.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the home page for the tools module.

	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 21:01:42  daugherty
Initial revision

Revision 1.1  2001-10-11 10:54:15-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->
</cfsilent>
<cfinclude template="qry_get_tools.cfm">
<table cellpadding="0" cellspacing="3" border="0" width="100%">
<cfinclude template="dsp_tools_home.cfm">
</table>
