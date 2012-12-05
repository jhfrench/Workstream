
<!--Reports/dsp_monthly_hours_Total.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the totals for the employee type and the summary hours.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfif comparenocase(variables.temp_client_code, ClientCode)><!-- I only want this after the client code changes -->
		<cfset variables.temp_client_code=ClientCode>
		<cfif total_hours>
			<cfinclude template="dsp_summary_hours.cfm"> 
		</cfif> 
	</cfif>



	