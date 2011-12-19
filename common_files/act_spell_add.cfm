
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
Revision 1.0  2005/02/15 20:41:09  daugherty
Initial revision

Revision 1.2  2002-04-11 16:26:04-04  lee
changed email from address and added reply-to param

Revision 1.1  2001-10-11 10:58:01-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
<cfquery name="get_requestor" cachedafter="02/02/1978" datasource="#application.datasources.main#">
SELECT Emp_Contact.lname AS lname, Emp_Contact.name AS first_name
FROM Emp_Contact
WHERE Emp_Contact.emp_id=#session.user_account_id#
</cfquery>
<cfmail subject="Please add new word to dictionary" to="french@nucleusweb.com" from="#application.erroremailfrom#" server="#application.emailserver#" type="HTML">
<font face="Arial,Helvetica,sans-serif" size="1">
Word: '#attributes.suggested_word#'<br>
Requestor: #get_requestor.lname#, #get_requestor.first_name#<br>
Date: #DateFormat(now(),"mm/dd/yy")#<br>
Time: #TimeFormat(now(), "h:mm TT")#<br>

<form action="http://www.nucleusweb.com/cfx_spell/admin/dictadd.cfm">
	<input type="hidden" name="language" value="am">
	<input type="hidden" name="type" value="include">
	
	Add word:
	<input type="text" name="word" size="20" value="#attributes.suggested_word#">
	<input type="submit" value="add">
</form>
</font>
<cfmailparam name="Reply-To" value="french@nucleusweb.com">
</cfmail>