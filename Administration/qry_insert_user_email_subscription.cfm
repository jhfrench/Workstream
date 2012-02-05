<!-- Administration/qry_insert_user_email_subscription.cfm
	Author: Jeromy French-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_user_email_subscription.cfm">
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

<cfquery name="insert_user_email_subscription" datasource="#application.datasources.main#">
INSERT INTO User_Email_Subscription (user_account_id, email_category_id, created_by)
SELECT #attributes.user_account_id#, REF_Email_Category.email_category_id, #session.user_account_id#
FROM REF_Email_Category
WHERE email_category_id IN (0,#attributes.email_category_id#)
</cfquery>