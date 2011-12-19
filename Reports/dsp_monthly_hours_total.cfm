
<!--Reports/dsp_monthly_hours_Total.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the totals for the employee type and the summary hours.

	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:08:07  stetzer
<>

Revision 1.1  2001-10-11 11:04:35-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	||
	END FUSEDOC --->
</cfsilent>
<cfif comparenocase(temp_cc, ClientCode)><!-- I only want this after  the client code changes -->
		<cfset temp_cc=ClientCode>
		<cfif total_hours>
			<cfinclude template="dsp_summary_hours.cfm"> 
		</cfif> 
	</cfif>
	
	
	
	