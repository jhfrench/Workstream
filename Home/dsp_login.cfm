<!-- Home/dsp_login.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_login.cfm">
	<responsibilities>
		I display the login form.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="5/29/2007" role="FuseCoder" comments="Created File">
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
<div class="row-fluid">
	<div class="span4 login_background">
		<div id="login_box">
			<em class="lead">
				This <abbr title="Applied Internet Technologies">AIT</abbr> system is for authorized users only.  By accessing this system you are consenting to complete monitoring with no expectation of privacy.  Unauthorized access or use may subject you to disciplinary action and criminal prosecution.
			</em>
			<div class="login_form">
			<cfoutput>
				<cfif len(variables.display_message)>
					<div id="display_message" class="alert alert-error">
						#variables.display_message#
					</div>
					<script type="text/javascript">
					var shake_ind=1;
					</script>
				</cfif>
				<form name="login_form" id="login_form" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post" class="form-horizontal">
					<fieldset>
						<legend>Please Sign In</legend>
						<div class="control-group">
							<label class="control-label" accesskey="u" for="user_name">Username</label>
							<div class="controls">
								<input type="text" name="user_name" id="user_name" value="#xmlformat(attributes.user_name)#" maxlength="4000" required="required" autofocus="autofocus" class="span8" />
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="password" accesskey="p">Password</label>
							<div class="controls">
								<input type="password" name="password" id="password" value="" required="required" class="span8" />
							</div>
						</div>
						<div class="form-actions">
							<input type="hidden" name="requested_page" value="#xmlformat(attributes.requested_page)#" />
							<cfif attributes.process_form_ind>
								<cfset variables.ignore_these="FIELDNAMES,FUSEACTION,fusebox.password,method,process_form_ind,requested_page,user_name">
								<input type="hidden" name="process_form_ind" value="1" />
								<cfloop collection="#attributes#" item="variables.field">
									<cfif NOT listcontainsnocase(variables.ignore_these,variables.field)>
										<input type="hidden" name="#variables.field#" id="#variables.field#" value="#evaluate("attributes.#variables.field#")#" />
									</cfif>
								</cfloop>
							</cfif>
							<input type="submit" name="method" value="Sign In" class="btn btn-primary" />
							<p class="help-block"><a href="index.cfm?fuseaction=Home.forget_username">Forgotten Your Username?</a></p>
							<p class="help-block"><a href="index.cfm?fuseaction=Home.forget_password">Forgotten Your Password?</a></p>
						</div>
					</fieldset>
				</form>
			</cfoutput>
			</div>
		</div>
	</div>
	<div class="span4 visible-desktop">
		<div id="clock_tower"></div>
	</div>
</div>
