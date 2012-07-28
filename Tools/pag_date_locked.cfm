
<!--Tools/pag_date_locked.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the fuses for the change date locked screen.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfoutput>
<cfif isdefined("attributes.company_id") AND len(attributes.company_id)>
<!--- if page has been submitted and necesary variables are present --->
	<cfinclude template="act_update_date_locked.cfm">
<cfelse>
	<cfif NOT isdefined("attributes.company_id") AND isdefined("attributes.date_locked")>
	<!--- IF PAGE HAS BEEN SUBMITTED AND NECESARY VARIABLES ARE NOT PRESENT --->
		<p class="alert alert-warning">You must select a company to update.</p>
	</cfif>
	<cfinclude template="qry_get_date_locked.cfm">
	<cfinclude template="dsp_date_locked.cfm">
</cfif>
</cfoutput>

