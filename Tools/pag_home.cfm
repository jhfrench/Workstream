
<!--Tools/pag_home.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the home page for the tools module.

	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
</cfsilent>
<cfinclude template="qry_get_tools.cfm">
<table cellpadding="0" cellspacing="3" border="0" width="100%">
<cfinclude template="dsp_tools_home.cfm">
</table>