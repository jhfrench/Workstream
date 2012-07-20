<!-- common_files/act_check_password_text.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_check_password_text.cfm">
	<responsibilities>
		I check password to be sure it contains at lest three of security criteria(upper case, lower case, a number, a special character) and the length is between 8 and 12 characters.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/12/2007" role="FuseCoder" comments="Created File">
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


<cfparam name="variables.display_message" default="">
<cfparam name="variables.password_verification_uppercase_pass" default="0">
<cfparam name="variables.password_verification_lowercase_pass" default="0">
<cfparam name="variables.password_verification_number_pass" default="0">
<cfparam name="variables.password_verification_special_character_pass" default="0">
<cfparam name="variables.password_verification_count" default="0">
<cfparam name="caller.get_verification_count" default="0">

<cfset variables.good_password_length_ind=1>

<!--- check for upper case --->
<cfif refind("[[:upper:]]", attributes.password)>
	<cfset variables.password_verification_uppercase_pass=1>
</cfif>
<!--- check for lowercase --->
<cfif refind("[[:lower:]]", attributes.password)>
	<cfset variables.password_verification_lowercase_pass=1>
</cfif>
<!--- check for numbers --->
<cfif refind("[[:digit:]]", attributes.password)>
	<cfset password_verification_number_pass=1>
</cfif>
<!--- check for special characters --->
<cfif refind("[[:punct:]]", attributes.password)>
	<cfset password_verification_special_character_pass=1>
</cfif>
<!--- check for length of password --->
<cfif ((len(attributes.password) LT 8) OR (len(attributes.password) GT 16))>
	<cfset variables.good_password_length_ind=0>
</cfif>

<cfset variables.password_verification_count=variables.password_verification_uppercase_pass+variables.password_verification_lowercase_pass+variables.password_verification_number_pass+variables.password_verification_special_character_pass>

<!--- if the password meets the 2810 standard --->
<cfif variables.password_verification_count GT 2 AND variables.good_password_length_ind EQ 1>
	<cfset caller.variables.password_accepted_ind=1>
<cfelse>
	<cfset variables.display_message="<li>Password must be 8-16 characters long and must meet at least three of the following criteria: an upper case, a lower case, a number and a special character. Please make sure your password meets this standard.">
</cfif>

<cfset caller.get_verification_count=variables.password_verification_count>
<cfset caller.variables.display_message=variables.display_message>