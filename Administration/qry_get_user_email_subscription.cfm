<!-- Administration/qry_get_user_email_subscription.cfm
	Author: Jeromy French-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_user_email_subscription.cfm">
	<responsibilities>
		I retrieve the data from the User_Email_Subscription table.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="6/5/2009" role="FuseCoder" comments="Created File">
			$Id:$
		</history>
	</properties>
	<IO>
		<in>

		</in>
		<passthrough>

		</passthrough>
		<out>

		</out>
	</IO>
</fusedoc>
--->

<cfquery name="get_user_email_subscription" datasource="#application.datasources.main#">
SELECT user_email_subscription_id, user_account_id, email_category_id
FROM User_Email_Subscription
WHERE active_ind=1
	AND user_account_id=#attributes.user_account_id#
</cfquery>
<cfset caller.get_user_email_subscription=get_user_email_subscription>