
<!--Tools/pag_rate_change.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the fuses for the customer rate insert page.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfif isdefined("attributes.submit")>
	<!--- insert/update rates into Billing_Rate --->
	<cfinclude template="act_rate_change.cfm">
</cfif>
<cfinclude template="qry_get_billing_rate.cfm">
<cfinclude template="dsp_rate_change.cfm">