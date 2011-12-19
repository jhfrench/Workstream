<!--  admin/act_check_password.cfm
	Author: Victor B.-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I check the entered password for a match to application wide standard .
	||
	Name: Victor Blell
	||
	Edits: 
		$Log$
		Revision 1.1  2006/09/15 22:24:03  csy
		<>

		Revision 1.0  2006-08-16 09:31:55-04  csy
		Initial revision

		Revision 1.0  2005-02-15 15:27:17-05  daugherty
		Initial revision

		Revision 1.0  2003-04-15 10:11:42-04  blell
		initial creation.

	||
	Variable:
	END FUSEDOC --->
	<cfparam name="redirect_action" default="home">
</cfsilent>


<!---------------------------------------------------------------------------------
REGULAR EXPRESSION CODE GOES HERE
------------------------------------------------------------------------------------>
<!--- 3) does new password meet requirements based on application.password_text_requirements_id? --->
<cfif application.password_text_requirements_id gt 0>

	<!--- set params: create a new array to hold Regular Expressions
		and create a flag for password failure --->
	<cfset totalREs = arraynew(1)>
	<cfset password_failed = true>
	<cfset multipleREs = false>

	<!--- set array of REs based on id --->
	<cfswitch expression="#application.password_text_requirements_id#">
	
		<!--- needs one alpha --->
		<cfcase value="1">				
			<cfset totalREs[1] = "[A-Za-z]">
		</cfcase>
	
		<!--- needs one alpha and one symbol--->
		<cfcase value="2">				
			<cfset totalREs[1] = "[A-Za-z]">
			<cfset totalREs[2] = "[[:punct:]]">
		</cfcase>
	
		<!--- needs one alpha and one number--->
		<cfcase value="3">				
			<cfset totalREs[1] = "[A-Za-z]">
			<cfset totalREs[2] = "[0-9]">
		</cfcase>
	
		<!--- needs one alpha, one number, one symbol --->
		<cfcase value="4">				
			<cfset totalREs[1] = "[A-Za-z]">
			<cfset totalREs[2] = "[0-9]">
			<cfset totalREs[3] = "[[:punct:]]">
		</cfcase>
		
		<!--- needs one number--->
		<cfcase value="5">				
			<cfset totalREs[1] = "[0-9]">
		</cfcase>
	
		<!--- needs one number and one symbol--->
		<cfcase value="6">				
			<cfset totalREs[1] = "[0-9]">
			<cfset totalREs[2] = "[[:punct:]]">
		</cfcase>
	
		<!--- needs one number AND (alpha or symbol) --->
		<cfcase value="7">				
			<cfset totalREs[1] = "[0-9]">
			<cfset totalREs[2] = "[A-Za-z]">
			<cfset totalREs[3] = "[[:punct:]]">
			<cfset multipleREs = true>
		</cfcase>
	
		<!--- needs one alpha AND (one number or one symbol) --->
		<cfcase value="8">				
			<cfset totalREs[1] = "[A-Za-z]">
			<cfset totalREs[2] = "[0-9]">
			<cfset totalREs[3] = "[[:punct:]]">
			<cfset multipleREs = true>
		</cfcase>
		
		<!--- needs one symbol AND (one number OR one alpha) --->
		<cfcase value="9">		
			<cfset totalREs[1] = "[[:punct:]]">		
			<cfset totalREs[2] = "[A-Za-z]">
			<cfset totalREs[3] = "[0-9]">
			<cfset multipleREs = true>
		</cfcase>
	
		<!--- needs one symbol--->
		<cfcase value="10">				
			<cfset totalREs[1] = "[[:punct:]]">
		</cfcase>	
			
		<!--- default --->
		<cfdefaultcase>		
			
		</cfdefaultcase>
	</cfswitch>
		
	<!--- loop thru array --->
	<cfset len_REs = arraylen(totalREs)>
	
	<!--- flag for more complex cases --->
	<cfif multipleREs>
		
			<!--- check for first RE (which is required) --->
			<cfif refind(totalREs[1],attributes.new_pass) eq 0>
				<cfset password_failed = false>
			</cfif>
				
			<!--- check that either second RE or third RE are present  --->
			<cfif (refind(totalREs[2], attributes.new_pass) eq 0) AND (refind(totalREs[3], attributes.new_pass) eq 0)>
				<cfset password_failed = false>
			</cfif>

	<cfelse>
	
			<!--- loop through each RE checking for each --->
			<cfloop from="1" to="#len_REs#" index="a">
				<cfif refind(totalREs[a],attributes.new_pass) EQ 0>
						<cfset password_failed = false>
				</cfif>
			</cfloop>	
	
	</cfif>
	<!--- close multipleREs if --->
		
	<!--- if anything failed then kick them to failure page --->
	<cfif not password_failed>
		<cflocation url="index.cfm?fuseaction=#variables.redirect_action#" addtoken="no">
	</cfif>
</cfif>