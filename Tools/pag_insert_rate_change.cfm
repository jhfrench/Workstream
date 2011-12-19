
<!--Tools/pag_insert_rate_change.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I do the insert of new customer rates.

	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 21:01:43  daugherty
Initial revision

Revision 1.2  2002-03-06 13:17:55-05  long
Removing the cfgridupdate and entering the data using standard SQL

Revision 1.1  2001-10-11 10:54:15-04  long
Added $log $ for edits to all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->
<cfloop from="1" to="#ArrayLen(CUSTOMER_RATE.BILLING_RATE_ID)#" index="ii">
	<cfif (isnumeric(CUSTOMER_RATE.RATE[ii])AND Compare(CUSTOMER_RATE.RATE[ii],CUSTOMER_RATE.ORIGINAL.RATE[ii]) )OR (IsDate(CUSTOMER_RATE.RATES_GOOD_TO[ii]) AND  Compare(CUSTOMER_RATE.RATES_GOOD_TO[ii], CUSTOMER_RATE.ORIGINAL.RATES_GOOD_TO[ii]))OR (IsDate(CUSTOMER_RATE.RATES_GOOD_FROM[ii]) AND Compare(CUSTOMER_RATE.RATES_GOOD_FROM[ii],CUSTOMER_RATE.Original.RATES_GOOD_FROM[ii]))>
		<cfquery name="update_billing_rate" datasource="#application.datasources.main#">
			UPDATE billing_rate 
			SET
			<cf_removetrailingcomma>
				<cfif isnumeric(CUSTOMER_RATE.RATE[ii])AND Compare(CUSTOMER_RATE.RATE[ii],CUSTOMER_RATE.ORIGINAL.RATE[ii])> 
					 Rate = #CUSTOMER_RATE.RATE[ii]#,
				</cfif>
				<cfif IsDate(CUSTOMER_RATE.RATES_GOOD_FROM[ii])AND Compare(CUSTOMER_RATE.RATES_GOOD_FROM[ii],CUSTOMER_RATE.Original.RATES_GOOD_FROM[ii])>
					Rates_Good_From = #createodbcdatetime(CUSTOMER_RATE.RATES_GOOD_FROM[ii])#,
				</cfif>
				<cfif IsDate(CUSTOMER_RATE.RATES_GOOD_TO[ii]) AND  Compare(CUSTOMER_RATE.RATES_GOOD_TO[ii], CUSTOMER_RATE.ORIGINAL.RATES_GOOD_TO[ii])>
					 Rates_Good_To =  #createodbcdatetime(CUSTOMER_RATE.RATES_GOOD_TO[ii])#
				</cfif> 
			</cf_removetrailingcomma>
			WHERE Billing_Rate_ID = #CUSTOMER_RATE.BILLING_RATE_ID[ii]#
		</cfquery>
	</cfif>
</cfloop>
</cfsilent>
<cflocation addtoken="No" url="index.cfm?fuseaction=rate_change">
