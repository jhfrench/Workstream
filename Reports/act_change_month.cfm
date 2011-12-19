
<!--Reports/act_change_month.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the Monthly Revenue Report.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:03:45  stetzer
	<>

	Revision 1.1  2001-12-18 12:06:23-05  french
	I have no idea what I was working on.

	Revision 1.0  2001-11-07 16:37:05-05  french
	Adding team details to bottom of admin/planning report.

	||
	END FUSEDOC --->
<cf_htmlhead>
<SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript">
<!--
function change_month(time_month, time_year) { 
	document.drill_down.reset();
	document.drill_down.admin_month.value = time_month;
	document.drill_down.admin_year.value = time_year;
	document.drill_down.submit();
}
//-->
</script>
</cf_htmlhead>

