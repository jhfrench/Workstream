<!-- Administration/pag_opt-out.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_opt-out.cfm">
	<responsibilities>
		I display a form that takes the user's email address and submits it to the Email_Blacklist table. This prevents the NVDB system from sending emails to that user again.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/27/2009" role="FuseCoder" comments="Created File">
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
<cfparam name="attributes.email_address" default="">

<cfoutput>
<cfif isdefined("attributes.submit_remove")>
	<cfset attributes.email_address=trim(attributes.email_address)>
	<cfinclude template="qry_deactivate_email_blacklist.cfm">
	<cfinclude template="qry_insert_email_blacklist.cfm">
	<br /><br />The "#attributes.email_address#" email address has been removed from future correspondence.
<cfelse>
	<h2>Opt-Out from #application.product_name# Emails</h2>
	<cfform name="form_remove_me" method="post">
		Please enter your <label for="email_address">email address</label>:
		<input type="email" name="email_address" id="email_address" value="#attributes.email_address#" maxlength="4000" required="required" class="span3" />
		<!-- Use CF to create backup validation script <cfinput type="text" name="email_address" id="email_address" required="yes" validate="email" message="You must enter a valid email address." /> -->
		<br />Your email will be removed from future #application.product_name# email correspondence. 
		<p style="text-align:center"><input type="submit" name="submit_remove" value="Please remove me" class="btn btn-primary"/></p>
	</cfform>
</cfif>
</cfoutput>