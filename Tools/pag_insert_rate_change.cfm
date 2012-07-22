
<!--Tools/pag_insert_rate_change.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I do the insert of new customer rates.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfloop from="1" to="#ArrayLen(CUSTOMER_RATE.BILLING_RATE_ID)#" index="ii">
	<cfif (isnumeric(CUSTOMER_RATE.RATE[ii])AND Compare(CUSTOMER_RATE.RATE[ii],CUSTOMER_RATE.ORIGINAL.RATE[ii]) )OR (isdate(CUSTOMER_RATE.rate_end_date[ii]) AND  Compare(CUSTOMER_RATE.rate_end_date[ii], CUSTOMER_RATE.ORIGINAL.rate_end_date[ii]))OR (isdate(CUSTOMER_RATE.rate_start_date[ii]) AND Compare(CUSTOMER_RATE.rate_start_date[ii],CUSTOMER_RATE.Original.rate_start_date[ii]))>
		<cfquery name="update_billing_rate" datasource="#application.datasources.main#">
			UPDATE billing_rate 
			SET
			<cf_removetrailingcomma>
				<cfif isnumeric(CUSTOMER_RATE.RATE[ii])AND Compare(CUSTOMER_RATE.RATE[ii],CUSTOMER_RATE.ORIGINAL.RATE[ii])> 
					 Rate = #CUSTOMER_RATE.RATE[ii]#,
				</cfif>
				<cfif isdate(CUSTOMER_RATE.rate_start_date[ii])AND Compare(CUSTOMER_RATE.rate_start_date[ii],CUSTOMER_RATE.Original.rate_start_date[ii])>
					rate_start_date = #createodbcdatetime(CUSTOMER_RATE.rate_start_date[ii])#,
				</cfif>
				<cfif isdate(CUSTOMER_RATE.rate_end_date[ii]) AND  Compare(CUSTOMER_RATE.rate_end_date[ii], CUSTOMER_RATE.ORIGINAL.rate_end_date[ii])>
					 rate_end_date =  #createodbcdatetime(CUSTOMER_RATE.rate_end_date[ii])#
				</cfif> 
			</cf_removetrailingcomma>
			WHERE Billing_Rate_ID = #CUSTOMER_RATE.BILLING_RATE_ID[ii]#
		</cfquery>
	</cfif>
</cfloop>
</cfsilent>
<cflocation addtoken="No" url="index.cfm?fuseaction=rate_change">
