
<!--Timekeeping/pag_timekeeping.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the main timekeeping page.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
</cfsilent>
<cfinclude template="act_pto_blurb.cfm">
<cfinclude template="act_life_blurb.cfm">
<cfinclude template="act_hours_blurb.cfm">
<table cellpadding="0" cellspacing="3" border="0" width="100%">
	<cfinclude template="dsp_timekeeping_columns.cfm">
</table>

