
<!--Reports/dsp_monthly_hours_Total.cfm
	Author: Jeromy F  -->
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
<cfif comparenocase(temp_cc, ClientCode)><!-- I only want this after  the client code changes -->
		<cfset temp_cc=ClientCode>
		<cfif total_hours>
			<cfinclude template="dsp_summary_hours.cfm"> 
		</cfif> 
	</cfif>



	