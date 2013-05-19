
<!--Timekeeping/act_table_sorting.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I load and execute the JavaScript necessary to sort tables client-side.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
 --->
<cfscript>
	if (NOT isdefined("attributes.tabletools_ind")) {
		attributes.tabletools_ind=0;
	};
</cfscript>
</cfsilent>
<script type="text/javascript">
//if Modernizr determines they can be supported, load the following CSS and JavaScript resources
Modernizr.load([
	{
		load: [
			'../external/DataTables/DataTables/media/js/jquery.dataTables.js'<cfif attributes.tabletools_ind>,
			'../external/DataTables/TableTools/media/js/TableTools.js',
			'../external/DataTables/TableTools/media/js/ZeroClipboard.js'</cfif>
		],
		complete: function() {
			//power ACRQ detail table sorting
			$(document).ready(function () {
				$('table.tablesorter').each( function() {
	                if ($(this).prop('rows').length > 2) {
						$(this).dataTable({
							"bPaginate": false,
							"bAutoWidth": false,
							"bLengthChange": false,<cfif attributes.tabletools_ind>
							"sDom": "<'row-fluid'<'span6'f><'span6'<'pull-right'T>>r>t",
							"oTableTools": {
								"aButtons": [ "copy", "xls", "pdf" ],
								"sSwfPath": "http://10.20.17.226:7080/mockup_jf/js/copy_csv_xls_pdf.swf"
							}<cfelse>
							"bFilter": false</cfif>
						});
	                };
				});
<cfif attributes.tabletools_ind>
				//apply some additional Bootstrap styling
				$('.dataTables_length select').addClass('span3');
				$('.dataTables_filter input').addClass('span9 search-query');
				$('.DTTT_container').addClass('btn-group');
				$('div.dataTables_paginate a, a.DTTT_button').addClass('btn btn-small');</cfif>
			});
		}
	}
]);
</script>