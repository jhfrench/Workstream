<!-- Administration/qry_update_user_email_subscription.cfm
	Author: Jeromy French-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_update_user_email_subscription.cfm">
	<responsibilities>
		I retrieve the data from the User_Email_Subscription table.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="6/5/2009" role="FuseCoder" comments="Created File">
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

<cfquery name="update_user_email_subscription" datasource="#application.datasources.main#">
UPDATE User_Email_Subscription
SET active_ind=0
WHERE active_ind=1
	AND user_account_id=#attributes.user_account_id#
</cfquery>