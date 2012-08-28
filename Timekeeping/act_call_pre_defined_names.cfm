
<!--common_files/act_call_pre_defined_names.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I present a list of pre-defined task names.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
 --->
<cfparam name="attributes.dir_level" default="">
</cfsilent>
<cfoutput>
<script language="JavaScript">
<!--
function OpenPreTaskWindow(arg, arg1){
<cfloop list="task_name" index="ii">
if (arg == "#ii#")
{
	document.forms[0].#ii#.value = window.showModalDialog('#attributes.dir_level#index.cfm?fuseaction=Timekeeping.pre_name&formname=#ii#&date=#dateformat(now(),"m/d/yyyy")#&hour=#hour(now())#&minute=#minute(now())#',"#ii#","center=yes;dialogWidth=350pt;dialogHeight=200pt");
}
</cfloop>
  }
//-->
</script>
</cfoutput>

