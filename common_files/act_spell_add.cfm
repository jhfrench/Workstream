
<!--common_files/act_spell_add.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I email a word recommended to be added to the dictionary.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
 --->
<cfquery name="get_requestor" cachedafter="02/02/1978" datasource="#application.datasources.main#">
SELECT Emp_Contact.lname AS lname, Emp_Contact.name AS first_name
FROM Emp_Contact
WHERE Emp_Contact.emp_id=#session.user_account_id#
</cfquery>
<cfmail subject="Please add new word to dictionary" to="jeromy_french@hotmail.com" from="#application.erroremailfrom#" server="#application.emailserver#" type="HTML">
<font face="Arial,Helvetica,sans-serif" size="1">
Word: '#attributes.suggested_word#'<br />
Requestor: #get_requestor.lname#, #get_requestor.first_name#<br />
Date: #dateformat(now(),"mm/dd/yy")#<br />
Time: #TimeFormat(now(), "h:mm TT")#<br />

<form action="http://www.nucleusweb.com/cfx_spell/admin/dictadd.cfm">
	<input type="hidden" name="language" value="am">
	<input type="hidden" name="type" value="include">
	
	Add word:
	<input type="text" name="word" size="20" value="#attributes.suggested_word#">
	<input type="submit" value="add">
</form>
</font>
<cfmailparam name="Reply-To" value="jeromy_french@hotmail.com">
</cfmail>