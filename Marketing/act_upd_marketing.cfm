
<!--Marketing/act_upd_marketing.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I update the marketing CFGRID.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
    <cfset loopcount = arraylen(marketing.city1)>

    	<cfloop from="1" to="#loopcount#" index="ii">
<cftransaction isolation="READ_COMMITTED">
		<!--- If the action for that level of the array is UPDATE run update statements. --->

		<cfset overview = MARKETING.OVERVIEW[ii]>

	<cfif not compareNoCase(MARKETING.RowStatus.Action[ii],  "u")> 
			<cfif compare(MARKETING.projected_revenue[ii], "") 
			or compare(MARKETING.probability[ii], "") 
			or compare(MARKETING.statusabovedate[ii], "") 
			or compare(MARKETING.statusindate[ii], "") 
			or compare(MARKETING.statusbestfewdate[ii], "") 
			or compare(MARKETING.statuscontractdate[ii], "") 
			or  compare(MARKETING.company_size[ii], "") 
			or compare(MARKETING.overview[ii], "")>
				<cfquery name="update_marketing" datasource="#application.datasources.main#">
		              update marketing
				    set 
					 overview =  '#overview#',
				    <cfif IsNumeric(MARKETING.projected_revenue[ii])>projected_revenue=  #val(MARKETING.PROJECTED_REVENUE[ii])#,</cfif>
					<cfif IsNumeric(MARKETING.probability[ii])> probability= '#MARKETING.PROBABILITY[ii]#',</cfif>
					<cfif isdate(MARKETING.statusabovedate[ii])>statusabovedate= '#MARKETING.STATUSABOVEDATE[ii]#', </cfif>
					<cfif isdate(MARKETING.statusindate[ii])>statusindate ='#MARKETING.STATUSINDATE[ii]#', </cfif>
					<cfif isdate(MARKETING.statusbestfewdate[ii])> statusbestfewdate ='#MARKETING.STATUSBESTFEWDATE[ii]#' , </cfif>
					<cfif isdate(MARKETING.statuscontractdate[ii])>statuscontractdate = '#MARKETING.STATUSCONTRACTDATE[ii]#',</cfif> source = #session.user_account_id#
					<cfif IsNumeric(MARKETING.company_size[ii])>,company_size ='#MARKETING.COMPANY_SIZE[ii]#'</cfif>
					Where project_id = #MARKETING.project_id[ii]#
		          </cfquery>
			</cfif>
		<cfloop from="1" to="3" index="jj">
		    <cfscript>
				paddress = evaluate("MARKETING.PADDRESS#jj#[ii]");
				original_paddress = evaluate("MARKETING.original.PADDRESS#jj#[ii]");
				saddress = evaluate("MARKETING.SADDRESS#jj#[ii]");
				original_saddress = evaluate("MARKETING.original.SADDRESS#jj#[ii]");
				city = evaluate("MARKETING.CITY#jj#[ii]");
				original_city = evaluate("MARKETING.original.CITY#jj#[ii]");
				state = evaluate("MARKETING.STATE#jj#[ii]");
				original_state = evaluate("MARKETING.original.STATE#jj#[ii]");
				zip = evaluate("MARKETING.ZIP#jj#[ii]");
				emp_id = evaluate("MARKETING.emp_id#jj#[ii]");
				phone = evaluate("MARKETING.PHONE#jj#[ii]");
				original_phone = evaluate("MARKETING.original.PHONE#jj#[ii]");
				extension = evaluate("MARKETING.EXTENSION#jj#[ii]");
				original_extension = evaluate("MARKETING.original.EXTENSION#jj#[ii]");
				email = evaluate("MARKETING.EMAIL#jj#[ii]");
				original_email = evaluate("MARKETING.original.EMAIL#jj#[ii]");
				name = evaluate("MARKETING.NAME#jj#[ii]");
				lname = evaluate("MARKETING.LNAME#jj#[ii]");
				original_lname= evaluate("MARKETING.original.LNAME#jj#[ii]");
				original_name = evaluate("MARKETING.original.NAME#jj#[ii]");
			</cfscript>
		<!--- this is where edits are made to an existing code --->
			<cfif compare(emp_id, "")>

			<cfif compare(paddress, "") 
			or compare(saddress, "") 
			or compare(city, "") 
			or compare(state, "") 
			or compare(zip, "")>
					<cfquery name="update_location" datasource="#application.datasources.main#">
					update location
					set <cfif compare(paddress, "")>address1= '#paddress#',</cfif> 
					<cfif compare(saddress, "")>address2 = '#saddress#',</cfif>
					<cfif compare(state, "")>state = '#state#',</cfif>
					<cfif compare(zip, "")> zip = '#zip#',</cfif>
					<cfif compare(city, "")>city = '#city#'</cfif>
					where #emp_id#=emp_id and location_type_id = 1
				</cfquery>
			</cfif>
			<cfif compare(phone, "") 
			or compare(extension, "")>
				<cfquery name="update_phone" datasource="#application.datasources.main#">
					update phone
					set <cfif compare(phone, "") >phone_number = '#phone#'</cfif>
					<cfif compare(extension, "")>, extension = '#extension#'</cfif>
					where #emp_id#=emp_id and phone_type_id = 1
				</cfquery>
			</cfif>
			<cfif  compare(email, "")>
				<cfquery name="update_email" datasource="#application.datasources.main#">
					update email
					set email = '#email#'
					where #emp_id#=emp_id and email_type_id = 1 
				</cfquery>
			</cfif>
		</cfif>

		</cfloop>
		<cfquery name="update_project" datasource="#application.datasources.main#">
		UPDATE Project
		SET description = '#MARKETING.description[ii]#',
			active_ind = #MARKETING.active_ind[ii]#
		WHERE project_id = #MARKETING.project_id[ii]#
		</cfquery>

			<!--- INSERT AN ENTIERLY NEW MARKETING CODE --->
			<cfelseif NOT compareNoCase(MARKETING.RowStatus.Action[ii],  "i")>
			<!--- for insert I require that there be a Description --->
		<cfif compare(MARKETING.description[ii], "")>

			<cfquery name="get_max_code" datasource="#application.datasources.main#">
                   SELECT MAX(project_code) AS project_code, customer_id
				FROM project
				WHERE project_code LIKE '6005.%'
				GROUP BY customer_id
               </cfquery>
<!--- <cfset overview = evaluate(#MARKETING.OVERVIEW[ii]#)>		 --->
<cfset  project_code = get_max_code.project_code +0.001>
			<cfquery name="insert_project" datasource="#application.datasources.main#">
			INSERT INTO Project (description, active_ind, project_code,
				customer_id, company_id, billable_type_id) 
			VALUES ('#marketing.description[ii]#', 2, #variables.project_code#,
				#get_max_code.customer_id#, 9, 2)
			</cfquery>
			<cfquery name="get_max_id" datasource="#application.datasources.main#">
			SELECT CURRVAL('Project_project_id_SEQ') AS project_id
			</cfquery>
			<cfquery name="insert_marketing" datasource="#application.datasources.main#">
			INSERT INTO Marketing (project_code, project_id
			    <cfif IsNumeric(MARKETING.projected_revenue[ii])>,projected_revenue</cfif>
			    <cfif IsNumeric(MARKETING.probability[ii])>, probability </cfif>
			    <cfif isdate(MARKETING.statusabovedate[ii])>,statusabovedate</cfif>
			    <cfif isdate(MARKETING.statusindate[ii])>, statusindate</cfif>
			    <cfif isdate(MARKETING.statusbestfewdate[ii])>, statusbestfewdate </cfif>
			    <cfif isdate(MARKETING.statuscontractdate[ii])> , statuscontractdate</cfif>
			    <cfif IsNumeric(MARKETING.company_size[ii])>, company_size</cfif>
			    <cfif compare(MARKETING.overview[ii], "")> , overview</cfif>)
				VALUES (#variables.project_code#, #get_max_id.project_id#
				 <cfif IsNumeric(MARKETING.projected_revenue[ii])>,'#MARKETING.PROJECTED_REVENUE[ii]#'</cfif> 
				 <cfif IsNumeric(MARKETING.probability[ii])>,'#MARKETING.PROBABILITY[ii]#'</cfif> 
				 <cfif isdate(MARKETING.statusabovedate[ii])>,'#MARKETING.STATUSABOVEDATE[ii]#' </cfif>
				 <cfif isdate(MARKETING.statusindate[ii])>,'#MARKETING.STATUSINDATE[ii]#'</cfif>
				 <cfif isdate(MARKETING.statusbestfewdate[ii])>,  '#MARKETING.STATUSBESTFEWDATE[ii]#' </cfif> 
				 <cfif isdate(MARKETING.statuscontractdate[ii])> ,'#MARKETING.STATUSCONTRACTDATE[ii]#'</cfif> 
				 <cfif IsNumeric(MARKETING.company_size[ii])>, '#MARKETING.COMPANY_SIZE[ii]#' </cfif>
				 <cfif compare(MARKETING.overview[ii], "")> ,  '#OVERVIEW#'</cfif>)
			</cfquery>
			<cfloop from="1" to="3" index="jj">
			    <cfscript>
					paddress = evaluate("MARKETING.PADDRESS#jj#[ii]");
					saddress = evaluate("MARKETING.SADDRESS#jj#[ii]");
					city = evaluate("MARKETING.CITY#jj#[ii]");
					state = evaluate("MARKETING.STATE#jj#[ii]");
					zip = evaluate("MARKETING.ZIP#jj#[ii]");
					emp_id = evaluate("MARKETING.emp_id#jj#[ii]");
					phone = evaluate("MARKETING.PHONE#jj#[ii]");
					extension = evaluate("MARKETING.EXTENSION#jj#[ii]");
					email = evaluate("MARKETING.EMAIL#jj#[ii]");
					name = evaluate("MARKETING.NAME#jj#[ii]");
					lname = evaluate("MARKETING.LNAME#jj#[ii]");
				</cfscript>
				<!--- only insert the contact informtion if a person is entered. --->
				<cfif compare(name, "") or compare(lname, "")>
				<cfquery name="insert_emp_contact" datasource="#application.datasources.main#">
	            INSERT INTO Emp_Contact (name, lname, emp_contact_type)
				VALUES ('#name#', '#lname#', 3)
	               </cfquery>

				<cfquery name="get_emp_id" datasource="#application.datasources.main#">
				SELECT CURRVAL('Emp_Contact_emp_id_SEQ') AS emp_id
				 </cfquery>
				<cfquery name="insert_location" datasource="#application.datasources.main#">
				INSERT INTO Location (emp_id
					<cfif compare(paddress, "")>, address1</cfif>
					<cfif compare(saddress, "")>, address2</cfif>
					<cfif compare(city, "")>, city</cfif>
					<cfif compare(state, "")>, state</cfif>
					<cfif compare(zip, "")>, zip</cfif>)
				VALUES (#get_emp_id.emp_id#<cfif compare(paddress, "")> , '#paddress#'</cfif>
					<cfif compare(saddress, "")>, '#saddress#'</cfif> 
					<cfif compare(city, "")>, '#city#'</cfif><cfif compare(state, "")>, '#state#'</cfif>
					<cfif compare(zip, "")>, '#zip#'</cfif>)
				</cfquery>
				<cfquery name="insert_phone" datasource="#application.datasources.main#">
				INSERT INTO phone (emp_id, 
					<cfif compare(phone, "")>phone_number,</cfif>
					phone_type_id)
				VALUES (#get_emp_id.emp_id#, 
					<cfif IsNumeric(phone)>#phone#</cfif> 
					,1)
				</cfquery>
				<cfquery name="insert_email" datasource="#application.datasources.main#">
				INSERT INTO Email (emp_id, <cfif compare(email, "")>email</cfif>, email_type_id)
				VALUES (#get_emp_id.emp_id#, <cfif compare(email, "")>'#email#'</cfif>,1)
				</cfquery>
				<cfquery name="insert_marketing_emp" datasource="#application.datasources.main#">
				INSERT INTO Marketing_Emp (emp_id, project_id)
				VALUES (#get_emp_id.emp_id#, #get_max_id.project_id#)
				</cfquery>
			</cfif>
			</cfloop>
		</cfif>
		</cfif>
</cftransaction>
	</cfloop>

			<cflocation addtoken="No" url="index.cfm?fuseaction=marketing"> 

