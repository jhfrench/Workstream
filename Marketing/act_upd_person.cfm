
<!--Marketing/act_upd_person.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I update the personal information for marketing contacts.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfset project_id = attributes.project_id>
<cfset loopcount = arraylen(person_grid.lname)>

    	<cfloop from="1" to="#loopcount#" index="ii">
		
		 <cfscript>
			name = person_grid.name[ii];
			lname = person_grid.lname[ii];
			email = person_grid.email[ii];
			phone_number = person_grid.phone_number[ii];
			extension = person_grid.extension[ii];
			address1 = person_grid.address1[ii];
			address2 = person_grid.address2[ii];
			city = person_grid.city[ii];
			state =  person_grid.state[ii];
			zip =  person_grid.zip[ii];
		</cfscript>  

<!--- If the action for that level of the array is UPDATE run update statements. --->
<cfif not compareNoCase(person_grid.RowStatus.Action[ii],  "u")> 
<!--- there must be a name for the contact --->
<cfif  compare(PERSON_GRID.name[ii], "") or compare(PERSON_GRID.lname[ii], "")>
	<cftransaction isolation="READ_COMMITTED">
	<!--- if the name has changed update the name --->
	<cfif compare(PERSON_GRID.name[ii], PERSON_GRID.original.name[ii])>
		<cfquery name="update_name" datasource="#application.datasources.main#">
		update emp_contact
		set name = '#name#'
		where emp_id = #PERSON_GRID.emp_id[ii]#              
          </cfquery>
	</cfif>
	<!--- if the last name has changed update it --->
	<cfif compare(PERSON_GRID.lname[ii], PERSON_GRID.original.lname[ii])>
		<cfquery name="update_lname" datasource="#application.datasources.main#">
			update emp_contact
			set lname = '#lname#'
			where emp_id = #PERSON_GRID.emp_id[ii]#       
          </cfquery>
	</cfif>
<!--- if the email is new then insert --->
	<cfif  NOT compare(person_grid.original.email[ii], "") 
	and compare(person_grid.email[ii], "")>
		<cfquery name="insert_email" datasource="#application.datasources.main#">
	         INSERT INTO email
		    (email, emp_id, email_type_id)
		    values('#email#', #PERSON_GRID.emp_id[ii]#, 1)
	     </cfquery>
	<!--- Otherwise update the record --->
	<cfelseif compare(person_grid.email[ii], "")>
		<cfquery name="update_email" datasource="#application.datasources.main#">
	         update email
		    set email = '#email#'
		    where emp_id = #PERSON_GRID.emp_id[ii]# and email_type_id = 1
	     </cfquery>
	</cfif>
	<!--- if the phone number is new then insert. --->
	<cfif  NOT compare(person_grid.original.phone_number[ii], "") 
	and NOT compare(person_grid.original.extension[ii], "") 
	and compare(person_grid.phone_number[ii], "")>
		<cfquery name="insert_phone" datasource="#application.datasources.main#">
	         INSERT INTO phone
		    (phone_number 
		    <cfif IsNumeric(person_grid.extension[ii])>,extension</cfif>
		    , emp_id, phone_type_id)
		    values('#phone_number#'
		    <cfif IsNumeric(person_grid.extension[ii])>,#extension#</cfif>
		    , #PERSON_GRID.emp_id[ii]#, 1)
	     </cfquery>
	<cfelseif  IsNumeric(person_grid.extension[ii])>
		<cfquery name="update_phone" datasource="#application.datasources.main#">
	         	update phone
			set phone_number = '#phone_number#'
			<cfif IsNumeric(person_grid.extension[ii])> ,extension = #extension#</cfif>
			where emp_id = #PERSON_GRID.emp_id[ii]# and phone_type_id = 1
	     </cfquery>
	</cfif>
	
	<!--- if the address is new then insert --->
	<cfif  NOT compare(person_grid.original.address1[ii], "") 
	and NOT compare(person_grid.original.address2[ii], "") 
	and NOT compare(person_grid.original.city[ii], "") 
	and  NOT compare(person_grid.original.state[ii], "") 
	and NOT compare(person_grid.original.zip[ii], "")> 
	
	<cfif compare(person_grid.address1[ii], "") 
	or compare(person_grid.address2[ii], "") 
	or compare(person_grid.city[ii], "") 
	or compare(person_grid.state[ii], "") 
	or compare(person_grid.zip[ii], "")>
			<cfquery name="insert_location" datasource="#application.datasources.main#">
		         INSERT INTO location
			    (address1
			    , address2
			    , city
			  , state
			    , zip
			    , emp_id, location_type_id)
			    values('#address1#'
			    ,'#address2#'
			    ,'#city#', 
			   '#state#'
			    ,'#zip#'
			    , #PERSON_GRID.emp_id[ii]#, 1)
		     </cfquery>
		</cfif>
	<cfelseif compare(person_grid.address1[ii], "") 
	or compare(person_grid.address2[ii], "") 
	or compare(person_grid.city[ii], "") 
	or compare(person_grid.state[ii], "") 
	or compare(person_grid.zip[ii], "")>
		<cfquery name="update_location" datasource="#application.datasources.main#">
	         update location
		    set address1 = '#address1#'
		 	,address2 = '#address2#'
		    , city = '#city#'
		    ,state = '#state#'
		    ,zip = '#zip#'
		    where emp_id = #PERSON_GRID.emp_id[ii]# and location_type_id =1
	     </cfquery>
	</cfif>
	</cftransaction>
</cfif>
<cflocation addtoken="No" url="index.cfm?fuseaction=marketing">

<!--- INSERT AN ENTIERLY NEW MARKETING CONTACT --->
<cfelseif NOT compareNoCase(person_grid.RowStatus.Action[ii],  "i")>

<!--- Insert name in to  emp_contact as long as a name is specified. --->
<cfif compare(name, "") and compare(lname, "")>
	<cftransaction isolation="READ_COMMITTED">
	<cfquery name="insert_emp_contact" datasource="#application.datasources.main#">
	INSERT INTO Emp_Contact (name, lname, emp_contact_type)
	VALUES ('#name#', '#lname#', 3) 
	</cfquery>
	<cfquery name="get_emp_id" datasource="#application.datasources.main#">
	 CURRVAL('Emp_Contact_emp_id_SEQ') AS emp_id
	</cfquery>
<cfquery name="insert_marketing_emp" datasource="#application.datasources.main#">
INSERT INTO Marketing_Emp (emp_id, project_id)
VALUES (#get_emp_id.emp_id#, #project_id#)
</cfquery>
<!--- Insert new email address --->			 
	<cfif  compare(person_grid.email[ii], "")>
		<cfquery name="insert_email" datasource="#application.datasources.main#">
		INSERT INTO email (email, emp_id, email_type_id)
		VALUES ('#email#',#get_emp_id.emp_id# , 1)
		</cfquery>
	</cfif>
	<!--- insert new location information --->
	<cfif compare(person_grid.address1[ii], "") 
		or compare(person_grid.address2[ii], "") 
		or compare(person_grid.city[ii], "") 
		or compare(person_grid.state[ii], "") 
		or compare(person_grid.zip[ii], "")>
			<cfquery name="insert_location" datasource="#application.datasources.main#">
		         INSERT INTO location
			    (address1
			    , address2
			    , city
			  , state
			    , zip
			    , emp_id, location_type_id)
			    values('#address1#'
			    ,'#address2#'
			    ,'#city#', 
			   '#state#'
			    ,'#zip#'
			    , #get_emp_id.emp_id#, 1)
		     </cfquery>
		</cfif>	</cftransaction>
	<cflocation addtoken="No" url="index.cfm?fuseaction=marketing">
<cfelse>
		<div align="center" class="Note">You must enter a name for the contact.</div>
		<meta http-equiv="Refresh"  content="4; url=index.cfm">		
</cfif>

</cfif>


 </cfloop>
 
