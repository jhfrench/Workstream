
<!--Tools/pag_generate_invoice.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the invoice tool invoice list.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log$
	||
	Variables:
	END FUSEDOC --->
</cfsilent>
<cfinclude template="act_generate_invoice.cfm">

<cfif variables.continue_processing_ind>
	<cfdump var="#act_generate_invoice#" />
</cfif>