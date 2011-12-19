
<!--timekeeping/pag_file_attach.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I allow the user to associate a file path with a task.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:41:03  daugherty
Initial revision

Revision 1.1  2001-10-11 10:58:04-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
<SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript">
<!--
	function movename()
		{
			document.realform.filename.value=document.tempform.tempfilename.value;
		}
	
	
	function sync_files()
		{
			if(document.realform.additions.value != "" )
				{
					document.realform.additions.value = document.realform.additions.value + "," + document.tempform.tempfilename.value
				} 
			else 
				{
					document.realform.additions.value = document.tempform.tempfilename.value		
				}
			document.tempform.tempfilename.value = ""
			//alert("Cleared")
		}
	
	function checkfields()
		{
			alert(document.realform.additions.value)
		}
	
	function checkdocs()
		{
			additions_val = document.realform.additions.value
			if(additions_val.length < 0)
				{
					//alert("Empty!")
				}		
		}
	function ReturnForm(file_path) 
		{ 
			// set the following on the parent window: 1.hidden form fields to carry the actual values, 
			opener.document.task_details.file_path.value = file_path;
			// close 'child' window
			window.close();
		}
//-->

<cfif attributes.submit_flag>
	ReturnForm( <cfoutput>'#URLEncodedFormat(additions)#'</cfoutput>);
</cfif>
</SCRIPT>