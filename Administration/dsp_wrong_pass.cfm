
<!--admin/dsp_wrong_pass.cfm
	Author: Victor B -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: Error message that asks user to retry their password change request.
	||
	Name: Victor Blell
	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
<cfparam name="attributes.msg" default="0">
<cfoutput>
	<tr class="#attributes.class#">
		<td colspan="2" class="#attributes.Class#">
			<br />
				&nbsp;Sorry, password was not changed. <br />
			
			<!--- display appropriate error message depending on which msg value was passed in --->
			<cfswitch expression="#attributes.msg#">
				
				<!--- password and confirm didn't match --->
				<cfcase value="1">
					<br />
					&nbsp;<strong>You did not enter a correct <i>current password</i><br />
					 &nbsp;You will need your <i>current password</i> for the system to allow you to create a new password.</strong> <br />
				</cfcase>
				
				<!--- password too short --->
				<cfcase value="2">
					<br />
					&nbsp;<strong>Password must be at least #application.password_length# characters long.</strong> <br />
				</cfcase>
				
				<!--- password invalid based on history --->
				<cfcase value="6">
					<br />
					&nbsp;<strong>You entered a new password that is invalid based on your password history.</strong> <br />
				</cfcase>
				
				<!--- password invalid based on history --->
				<cfcase value="10">
					<br />
					&nbsp;<strong>You have entered a new password that is invalid based on password history.</strong> <br />
				</cfcase>
				
				<!--- password invalid based on history --->
				<cfcase value="7">
					<br />
					&nbsp;<strong>Your new password and confirmed password did not match.</strong> <br />
				</cfcase>
				
				<!--- if it gets here, then it failed the specific requirements for the company,
				so we display the password_error_msg for the company --->	
				<cfdefaultcase>
					<br />
					&nbsp;<strong>#application.password_error_msg#</strong> <br />
				</cfdefaultcase>
			
			</cfswitch>
			<!--- end display specific error message --->
			
			<cfif  fuseaction neq "edit_account">
				&nbsp;Please enter your correct <i>current password</i>, your <i>new password</i> , and identical password in the <i>confirm password</i> field.
			</cfif>
			
			
		</td>
	</tr>
	</cfoutput>