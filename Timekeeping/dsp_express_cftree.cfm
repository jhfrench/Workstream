
<!--Timekeeping/dsp_express_cftree.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the cftree for the Timekeeping module's express entry page.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
 --->
<!--- <cfparam name="session.workstream_expand" default="yes,yes,no">
<cfset variables.tree_expand=listdeleteat(session.workstream_expand,1)> --->
<cfset variables.sort_order=0>
</cfsilent>

<div class="tree">
<cfoutput query="get_express_time_entries">
	<!-- loop from="#sort_order#" to="#variables.sort_order#"  -->
	<cfloop from="#sort_order#" to="#variables.sort_order#" index="variables.close_ul_ii"><!-- "#variables.close_ul_ii#"  --></li><cfif sort_order NEQ 3></ul></cfif></cfloop>
	<cfset variables.sort_order=sort_order>
<cfswitch expression="#sort_order#">
	<cfcase value="1">
	<ul>
		<li>
			<span><i class="icon-calendar"></i> #date_year#, Week #date_week#</span>
	</cfcase>
	<cfcase value="2">
			<ul>
				<li>
					<span class="badge badge-<cfif hours GTE 8>success<cfelseif hours GTE 6>warning<cfelse>important</cfif>"><i class="icon-minus-sign"></i> #dayofweekasstring(day_of_week_number)#, #monthasstring(date_month)# #dateformat(work_date, "d")#: #numberformat(hours, "__0.00")# hours</span>
	</cfcase>
	<cfcase value="3">
					<ul>
						<li>
							<a href="javascript:time_entry_edit(#time_entry_id#);" title="edit this entry" class=""><span><i class="icon-time"></i> #numberformat(hours, "_0.00")#</span> &ndash; #note#...</a>
	</cfcase>
	<cfdefaultcase>
		<li>This is a level of data Workstream cannot handle.</li>
	</cfdefaultcase>
</cfswitch>
</cfoutput>
<!-- final closers  -->
<cfloop from="1" to="#variables.sort_order#" index="variables.close_ul_ii"><!-- "#variables.close_ul_ii#"  --></li></ul></cfloop>
	<ul>
		<li>
			<span><i class="icon-calendar"></i> 2013, Week 2</span>
			<ul>
				<li>
					<span class="badge badge-success"><i class="icon-minus-sign"></i> Monday, January 7: 8.00 hours</span>
					<ul>
						<li>
							<a href=""><span><i class="icon-time"></i> 8.00</span> &ndash; Changed CSS to accomodate...</a>
						</li>
					</ul>
				</li>
				<li>
					<span class="badge badge-success"><i class="icon-minus-sign"></i> Tuesday, January 8: 8.00 hours</span>
					<ul>
						<li>
							<span><i class="icon-time"></i> 6.00</span> &ndash; <a href="">Altered code...</a>
						</li>
						<li>
							<span><i class="icon-time"></i> 2.00</span> &ndash; <a href="">Simplified our approach to...</a>
						</li>
					</ul>
				</li>
				<li>
					<span class="badge badge-warning"><i class="icon-minus-sign"></i> Wednesday, January 9: 6.00 hours</span>
					<ul>
						<li>
							<a href=""><span><i class="icon-time"></i> 3.00</span> &ndash; Fixed bug caused by...</a>
						</li>
						<li>
							<a href=""><span><i class="icon-time"></i> 3.00</span> &ndash; Comitting latest code to Git...</a>
						</li>
					</ul>
				</li>
				<li>
					<span class="badge badge-important"><i class="icon-minus-sign"></i> Wednesday, January 9: 4.00 hours</span>
					<ul>
						<li>
							<a href=""><span><i class="icon-time"></i> 2.00</span> &ndash; Create component that...</a>
						</li>
					</ul>
				</li>
			</ul>
		</li>
		<li>
			<span><i class="icon-calendar"></i> 2013, Week 3</span>
			<ul>
				<li>
					<span class="badge badge-success"><i class="icon-minus-sign"></i> Monday, January 14: 8.00 hours</span>
					<ul>
						<li>
							<span><i class="icon-time"></i> 7.75</span> &ndash; <a href="">Writing documentation...</a>
						</li>
						<li>
							<span><i class="icon-time"></i> 0.25</span> &ndash; <a href="">Reverting code back to...</a>
						</li>
					</ul>
				</li>
			</ul>
		</li>
	</ul>
</div>




<!-- loop from="1" to="0" -->
<ul>
	<li>
		<span><i class="icon-calendar"></i> 2013, Week 13</span>
		<!-- loop from="2" to="1" -->
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Sunday, March 31: 000.00 hours</span>
		<!-- loop from="1" to="2" -->
		<!-- "1" --></li></ul><!-- "2" --></li></ul>
		<ul>
		<li>
		<span><i class="icon-calendar"></i> 2013, Week 14</span>
		<!-- loop from="2" to="1" -->
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Monday, April 1: 000.00 hours</span>
		<!-- loop from="3" to="2" -->
		<ul>
		<li>
		<a href="javascript:time_entry_edit(1070);" title="edit this entry" class=""><span><i class="icon-time"></i> 01.00</span> &ndash; Creating report that includes project name, task name, and time entry notes....</a>
		<!-- loop from="3" to="3" -->
		<!-- "3" --></li>
		<ul>
		<li>
		<a href="javascript:time_entry_edit(1071);" title="edit this entry" class=""><span><i class="icon-time"></i> 00.25</span> &ndash; Generated and emailed monthly progress report to Michele:
		No problem, please see attached.
		My monthly invoice contains all the time-entry level detail. I send that report to Leo (and his accountant). I’ll start including that detail in the monthly progress report from now on.
		Leo called Sat to advise about sequestration and pausing service request work; priority user-support is still approved.
		...</a>
		<!-- loop from="2" to="3" -->
		<!-- "2" --></li></ul><!-- "3" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Tuesday, April 2: 001.25 hours</span>
		<!-- loop from="2" to="2" -->
		<!-- "2" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Wednesday, April 3: 000.00 hours</span>
		<!-- loop from="2" to="2" -->
		<!-- "2" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Thursday, April 4: 000.00 hours</span>
		<!-- loop from="2" to="2" -->
		<!-- "2" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Friday, April 5: 000.00 hours</span>
		<!-- loop from="2" to="2" -->
		<!-- "2" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Saturday, April 6: 000.00 hours</span>
		<!-- loop from="2" to="2" -->
		<!-- "2" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Sunday, April 7: 000.00 hours</span>
		<!-- loop from="3" to="2" -->
		<ul>
		<li>
		<a href="javascript:time_entry_edit(1072);" title="edit this entry" class=""><span><i class="icon-time"></i> 02.00</span> &ndash; Tinkered with flot library (https://github.com/flot/flot) at http://jsfiddle.net/jhfrench/m3w5b....</a>
		<!-- loop from="1" to="3" -->
		<!-- "1" --></li></ul><!-- "2" --></li></ul><!-- "3" --></li></ul>
		<ul>
		<li>
		<span><i class="icon-calendar"></i> 2013, Week 15</span>
		<!-- loop from="2" to="1" -->
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Monday, April 8: 002.00 hours</span>
		<!-- loop from="3" to="2" -->
		<ul>
		<li>
		<a href="javascript:time_entry_edit(1073);" title="edit this entry" class=""><span><i class="icon-time"></i> 02.75</span> &ndash; Completed adjustments to JavaScript for call to flot. Styled with Bootstrap. COnverted hardcoded values to be supplied by CFML. Added external submodule from Workstream/common_files/js/flot to git://github.com/flot/flot.git)....</a>
		<!-- loop from="2" to="3" -->
		<!-- "2" --></li></ul><!-- "3" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Tuesday, April 9: 002.75 hours</span>
		<!-- loop from="3" to="2" -->
		<ul>
		<li>
		<a href="javascript:time_entry_edit(1074);" title="edit this entry" class=""><span><i class="icon-time"></i> 00.25</span> &ndash; Emailed Cindy and Tasha: Hi Cindy, Tasha,
		I got the following notice from the Service Request application that you each ran into a problem—looks like the “assigned narrative” for request 641 has too much text. Can you try with fewer characters? If that fixes it, I’ll adjust the form to try to prevent it from happening again…
		jf
		...</a>
		<!-- loop from="3" to="3" -->
		<!-- "3" --></li>
		<ul>
		<li>
		<a href="javascript:time_entry_edit(1075);" title="edit this entry" class=""><span><i class="icon-time"></i> 00.75</span> &ndash; Researching SSD installs. See http://www.pcadvisor.co.uk/how-to/laptop/3366618/how-upgrade-your-laptop-hard-disk-ssd/...</a>
		<!-- loop from="2" to="3" -->
		<!-- "2" --></li></ul><!-- "3" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Wednesday, April 10: 001.00 hours</span>
		<!-- loop from="3" to="2" -->
		<ul>
		<li>
		<a href="javascript:time_entry_edit(1076);" title="edit this entry" class=""><span><i class="icon-time"></i> 00.50</span> &ndash; Looked through Craig's List gigs and jobs. Replied to a few postings....</a>
		<!-- loop from="2" to="3" -->
		<!-- "2" --></li></ul><!-- "3" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Thursday, April 11: 000.50 hours</span>
		<!-- loop from="2" to="2" -->
		<!-- "2" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Friday, April 12: 000.00 hours</span>
		<!-- loop from="2" to="2" -->
		<!-- "2" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Saturday, April 13: 000.00 hours</span>
		<!-- loop from="2" to="2" -->
		<!-- "2" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Sunday, April 14: 000.00 hours</span>
		<!-- loop from="3" to="2" -->
		<ul>
		<li>
		<a href="javascript:time_entry_edit(1086);" title="edit this entry" class=""><span><i class="icon-time"></i> 01.00</span> &ndash; Purchased SSD from Crucial....</a>
		<!-- loop from="1" to="3" -->
		<!-- "1" --></li></ul><!-- "2" --></li></ul><!-- "3" --></li></ul>
		<ul>
		<li>
		<span><i class="icon-calendar"></i> 2013, Week 16</span>
		<!-- loop from="2" to="1" -->
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Monday, April 15: 001.00 hours</span>
		<!-- loop from="2" to="2" -->
		<!-- "2" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Tuesday, April 16: 000.00 hours</span>
		<!-- loop from="3" to="2" -->
		<ul>
		<li>
		<a href="javascript:time_entry_edit(1077);" title="edit this entry" class=""><span><i class="icon-time"></i> 00.25</span> &ndash; Moved template back into Administration, fixed syntax error in supporting query....</a>
		<!-- loop from="3" to="3" -->
		<!-- "3" --></li>
		<ul>
		<li>
		<a href="javascript:time_entry_edit(1078);" title="edit this entry" class=""><span><i class="icon-time"></i> 01.25</span> &ndash; Created Workstream_Hierarchy() PostgreSQL function (see attached sql file)....</a>
		<!-- loop from="3" to="3" -->
		<!-- "3" --></li>
		<ul>
		<li>
		<a href="javascript:time_entry_edit(1079);" title="edit this entry" class=""><span><i class="icon-time"></i> 00.50</span> &ndash; Tested; query works now....</a>
		<!-- loop from="2" to="3" -->
		<!-- "2" --></li></ul><!-- "3" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Wednesday, April 17: 002.00 hours</span>
		<!-- loop from="3" to="2" -->
		<ul>
		<li>
		<a href="javascript:time_entry_edit(1080);" title="edit this entry" class=""><span><i class="icon-time"></i> 00.25</span> &ndash; Set up Google Alert to search for jquery OR cfml OR railo OR coldfusion OR sql OR mssql OR postgresql OR postgres site:washingtondc.craigslist.org...</a>
		<!-- loop from="2" to="3" -->
		<!-- "2" --></li></ul><!-- "3" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Thursday, April 18: 000.25 hours</span>
		<!-- loop from="2" to="2" -->
		<!-- "2" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Friday, April 19: 000.00 hours</span>
		<!-- loop from="2" to="2" -->
		<!-- "2" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Saturday, April 20: 000.00 hours</span>
		<!-- loop from="2" to="2" -->
		<!-- "2" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Sunday, April 21: 000.00 hours</span>
		<!-- loop from="3" to="2" -->
		<ul>
		<li>
		<a href="javascript:time_entry_edit(1087);" title="edit this entry" class=""><span><i class="icon-time"></i> 02.00</span> &ndash; Installed SSD on Cooperstown....</a>
		<!-- loop from="1" to="3" -->
		<!-- "1" --></li></ul><!-- "2" --></li></ul><!-- "3" --></li></ul>
		<ul>
		<li>
		<span><i class="icon-calendar"></i> 2013, Week 17</span>
		<!-- loop from="2" to="1" -->
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Monday, April 22: 002.00 hours</span>
		<!-- loop from="2" to="2" -->
		<!-- "2" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Tuesday, April 23: 000.00 hours</span>
		<!-- loop from="3" to="2" -->
		<ul>
		<li>
		<a href="javascript:time_entry_edit(1081);" title="edit this entry" class=""><span><i class="icon-time"></i> 00.25</span> &ndash; Worked all night. I suspect a Windows7 update fixed the problem....</a>
		<!-- loop from="2" to="3" -->
		<!-- "2" --></li></ul><!-- "3" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Wednesday, April 24: 000.25 hours</span>
		<!-- loop from="3" to="2" -->
		<ul>
		<li>
		<a href="javascript:time_entry_edit(1082);" title="edit this entry" class=""><span><i class="icon-time"></i> 00.25</span> &ndash; See http://www.larryullman.com/2011/02/20/using-amazons-cloudfront-as-a-cdn/...</a>
		<!-- loop from="3" to="3" -->
		<!-- "3" --></li>
		<ul>
		<li>
		<a href="javascript:time_entry_edit(1083);" title="edit this entry" class=""><span><i class="icon-time"></i> 00.25</span> &ndash; httpd can be edited by `cd /etc/httpd/conf` then `sudo nano httpd.conf`...</a>
		<!-- loop from="2" to="3" -->
		<!-- "2" --></li></ul><!-- "3" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Thursday, April 25: 000.50 hours</span>
		<!-- loop from="2" to="2" -->
		<!-- "2" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Friday, April 26: 000.00 hours</span>
		<!-- loop from="2" to="2" -->
		<!-- "2" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Saturday, April 27: 000.00 hours</span>
		<!-- loop from="2" to="2" -->
		<!-- "2" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Sunday, April 28: 000.00 hours</span>
		<!-- loop from="3" to="2" -->
		<ul>
		<li>
		<a href="javascript:time_entry_edit(1088);" title="edit this entry" class=""><span><i class="icon-time"></i> 00.50</span> &ndash; Called Dell tech support about spot on monitor. Dell will replace....</a>
		<!-- loop from="1" to="3" -->
		<!-- "1" --></li></ul><!-- "2" --></li></ul><!-- "3" --></li></ul>
		<ul>
		<li>
		<span><i class="icon-calendar"></i> 2013, Week 18</span>
		<!-- loop from="2" to="1" -->
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Monday, April 29: 000.50 hours</span>
		<!-- loop from="3" to="2" -->
		<ul>
		<li>
		<a href="javascript:time_entry_edit(1084);" title="edit this entry" class=""><span><i class="icon-time"></i> 03.00</span> &ndash; See http://jsfiddle.net/jhfrench/6b74w/68/...</a>
		<!-- loop from="2" to="3" -->
		<!-- "2" --></li></ul><!-- "3" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Tuesday, April 30: 003.00 hours</span>
		<!-- loop from="1" to="2" -->
		<!-- "1" --></li></ul><!-- "2" --></li></ul>
		<ul>
		<li>
		<span><i class="icon-calendar"></i> 2013, Week 18</span>
		<!-- loop from="2" to="1" -->
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Wednesday, May 1: 000.00 hours</span>
		<!-- loop from="3" to="2" -->
		<ul>
		<li>
		<a href="javascript:time_entry_edit(1085);" title="edit this entry" class=""><span><i class="icon-time"></i> 00.25</span> &ndash; AWS has worked very well....</a>
		<!-- loop from="3" to="3" -->
		<!-- "3" --></li>
		<ul>
		<li>
		<a href="javascript:time_entry_edit(1089);" title="edit this entry" class=""><span><i class="icon-time"></i> 00.50</span> &ndash; Dell replaced monitor today....</a>
		<!-- loop from="3" to="3" -->
		<!-- "3" --></li>
		<ul>
		<li>
		<a href="javascript:time_entry_edit(1090);" title="edit this entry" class=""><span><i class="icon-time"></i> 00.75</span> &ndash; Changed get_week_days query to join to Employee and Demographics so that Employee.week_hours can be multipled by the number of work days in the month (divided by 7). This returns expected capacity instead of assuming all employees work 8 hours a day. Adjusted JavaScript and output to accomodate change to query....</a>
		<!-- loop from="3" to="3" -->
		<!-- "3" --></li>
		<ul>
		<li>
		<a href="javascript:time_entry_edit(1091);" title="edit this entry" class=""><span><i class="icon-time"></i> 00.25</span> &ndash; Rounding capacity to second decimal....</a>
		<!-- loop from="3" to="3" -->
		<!-- "3" --></li>
		<ul>
		<li>
		<a href="javascript:time_entry_edit(1092);" title="edit this entry" class=""><span><i class="icon-time"></i> 00.25</span> &ndash; If we're excluding weekends from the numerator than we should also exclude from the denominator....</a>
		<!-- loop from="3" to="3" -->
		<!-- "3" --></li>
		<ul>
		<li>
		<a href="javascript:time_entry_edit(1093);" title="edit this entry" class=""><span><i class="icon-time"></i> 00.25</span> &ndash; Looks good....</a>
		<!-- loop from="2" to="3" -->
		<!-- "2" --></li></ul><!-- "3" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Thursday, May 2: 002.25 hours</span>
		<!-- loop from="3" to="2" -->
		<ul>
		<li>
		<a href="javascript:time_entry_edit(1094);" title="edit this entry" class=""><span><i class="icon-time"></i> 00.25</span> &ndash; Also see http://www.postgresql.org/docs/9.0/static/install-upgrading.html...</a>
		<!-- loop from="3" to="3" -->
		<!-- "3" --></li>
		<ul>
		<li>
		<a href="javascript:time_entry_edit(1095);" title="edit this entry" class=""><span><i class="icon-time"></i> 00.75</span> &ndash; See http://stackoverflow.com/questions/6273175/problem-using-jquery-ajax-to-submit-form-to-php-and-display-new-content-in-div-w and http://forum.jquery.com/topic/load-results-of-submitted-form-to-specific-div for ideas....</a>
		<!-- loop from="3" to="3" -->
		<!-- "3" --></li>
		<ul>
		<li>
		<a href="javascript:time_entry_edit(1096);" title="edit this entry" class=""><span><i class="icon-time"></i> 00.75</span> &ndash; Altered script.js to manipulate any forms embedded within #utility_body so that the embedded forms post their data via AJAX and reload the modal with the server response....</a>
		<!-- loop from="3" to="3" -->
		<!-- "3" --></li>
		<ul>
		<li>
		<a href="javascript:time_entry_edit(1097);" title="edit this entry" class=""><span><i class="icon-time"></i> 00.25</span> &ndash; See http://stackoverflow.com/questions/5392344/sending-multipart-formdata-with-jquery-ajax for how to submit files via AJAX...</a>
		<!-- loop from="2" to="3" -->
		<!-- "2" --></li></ul><!-- "3" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Friday, May 3: 002.00 hours</span>
		<!-- loop from="2" to="2" -->
		<!-- "2" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Saturday, May 4: 000.00 hours</span>
		<!-- loop from="2" to="2" -->
		<!-- "2" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Sunday, May 5: 000.00 hours</span>
		<!-- loop from="1" to="2" -->
		<!-- "1" --></li></ul><!-- "2" --></li></ul>
		<ul>
		<li>
		<span><i class="icon-calendar"></i> 2013, Week 19</span>
		<!-- loop from="2" to="1" -->
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Monday, May 6: 000.00 hours</span>
		<!-- loop from="2" to="2" -->
		<!-- "2" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Tuesday, May 7: 000.00 hours</span>
		<!-- loop from="2" to="2" -->
		<!-- "2" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Wednesday, May 8: 000.00 hours</span>
		<!-- loop from="2" to="2" -->
		<!-- "2" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Thursday, May 9: 000.00 hours</span>
		<!-- loop from="3" to="2" -->
		<ul>
		<li>
		<a href="javascript:time_entry_edit(1098);" title="edit this entry" class=""><span><i class="icon-time"></i> 00.50</span> &ndash; Researching steps for installing WordPress on AWS. See http://mornin.org/blog/scalable-wordpress-amazon-web-services/...</a>
		<!-- loop from="3" to="3" -->
		<!-- "3" --></li>
		<ul>
		<li>
		<a href="javascript:time_entry_edit(1099);" title="edit this entry" class=""><span><i class="icon-time"></i> 00.25</span> &ndash; Read http://www.codelord.net/2011/11/30/how-i-moved-my-wordpress-blog-from-dreamhost-to-a-free-ec2-instance...</a>
		<!-- loop from="3" to="3" -->
		<!-- "3" --></li>
		<ul>
		<li>
		<a href="javascript:time_entry_edit(1101);" title="edit this entry" class=""><span><i class="icon-time"></i> 00.25</span> &ndash; Asked Leo for details about the Wordpress site to be migrated....</a>
		<!-- loop from="2" to="3" -->
		<!-- "2" --></li></ul><!-- "3" --></li>ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Friday, May 10: 001.00 hours</span>
		<!-- loop from="2" to="2" -->
		<!-- "2" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Saturday, May 11: 000.00 hours</span>
		<!-- loop from="2" to="2" -->
		<!-- "2" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Sunday, May 12: 000.00 hours</span>
		<!-- loop from="1" to="2" -->
		<!-- "1" --></li></ul><!-- "2" --></li></ul>
		<ul>
		<li>
		<span><i class="icon-calendar"></i> 2013, Week 20</span>
		<!-- loop from="2" to="1" -->
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Monday, May 13: 000.00 hours</span>
		<!-- loop from="2" to="2" -->
		<!-- "2" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Tuesday, May 14: 000.00 hours</span>
		<!-- loop from="2" to="2" -->
		<!-- "2" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Wednesday, May 15: 000.00 hours</span>
		<!-- loop from="3" to="2" -->
		<ul>
		<li>
		<a href="javascript:time_entry_edit(1100);" title="edit this entry" class=""><span><i class="icon-time"></i> 00.25</span> &ndash; Emailed Briggitte Akalovsky proposing a demo. She agreed to see it when she comes back from vacation May 21....</a>
		<!-- loop from="2" to="3" -->
		<!-- "2" --></li></ul><!-- "3" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Thursday, May 16: 000.25 hours</span>
		<!-- loop from="3" to="2" -->
		<ul>
		<li>
		<a href="javascript:time_entry_edit(1102);" title="edit this entry" class=""><span><i class="icon-time"></i> 00.25</span> &ndash; http://www.jstree.com/ is a jQuery plugin that does what we need. Would probably need to style it for Bootstrap (see https://github.com/vakata/jstree/issues/366)....</a>
		<!-- loop from="2" to="3" -->
		<!-- "2" --></li></ul><!-- "3" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Friday, May 17: 000.25 hours</span>
		<!-- loop from="3" to="2" -->
		<ul>
		<li>
		<a href="javascript:time_entry_edit(1103);" title="edit this entry" class=""><span><i class="icon-time"></i> 00.75</span> &ndash; Implemented DataTables (http://datatables.net/) for DOM-side sorting. ...</a>
		<!-- loop from="2" to="3" -->
		<!-- "2" --></li></ul><!-- "3" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Saturday, May 18: 000.75 hours</span>
		<!-- loop from="2" to="2" -->
		<!-- "2" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Sunday, May 19: 000.00 hours</span>
		<!-- loop from="1" to="2" -->
		<!-- "1" --></li></ul><!-- "2" --></li></ul>
		<ul>
		<li>
		<span><i class="icon-calendar"></i> 2013, Week 21</span>
		<!-- loop from="2" to="1" -->
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Monday, May 20: 000.00 hours</span>
		<!-- loop from="3" to="2" -->
		<ul>
		<li>
		<a href="javascript:time_entry_edit(1104);" title="edit this entry" class=""><span><i class="icon-time"></i> 00.50</span> &ndash; I can cook up a site just like foundstaff.com, and can do so (no extra charge) in a more mobile-/tablet-friendly way. I’d also recommend transmitting resumes via the website (as opposed to giving an email address)—less spam that way.
		I’ll give you a call tonight and get your thoughts on what you like/want and don’t like/want, and we can get cooking!
		...</a>
		<!-- loop from="2" to="3" -->
		<!-- "2" --></li></ul><!-- "3" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Tuesday, May 21: 000.50 hours</span>
		<!-- loop from="3" to="2" -->
		<ul>
		<li>
		<a href="javascript:time_entry_edit(1105);" title="edit this entry" class=""><span><i class="icon-time"></i> 00.75</span> &ndash; Spoke with Christine. Covered my questions (see attached), followed-up with email. Work can progress at $40/hour....</a>
		<!-- loop from="2" to="3" -->
		<!-- "2" --></li></ul><!-- "3" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Wednesday, May 22: 000.75 hours</span>
		<!-- loop from="2" to="2" -->
		<!-- "2" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Thursday, May 23: 000.00 hours</span>
		<!-- loop from="3" to="2" -->
		<ul>
		<li>
		<a href="javascript:time_entry_edit(1106);" title="edit this entry" class=""><span><i class="icon-time"></i> 00.50</span> &ndash; Created Santacroce folder, filled with generic folder structure. Created santacroce.less file which maps to externa;s/Bootstrap less files and compiles to santacroce.css....</a>
		<!-- loop from="2" to="3" -->
		<!-- "2" --></li></ul><!-- "3" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Friday, May 24: 000.50 hours</span>
		<!-- loop from="2" to="2" -->
		<!-- "2" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Saturday, May 25: 000.00 hours</span>
		<!-- loop from="3" to="2" -->
		<ul>
		<li>
		<a href="javascript:time_entry_edit(1107);" title="edit this entry" class=""><span><i class="icon-time"></i> 01.00</span> &ndash; Making wider use of `RETURNING` clause....</a>
		<!-- loop from="3" to="3" -->
		<!-- "3" --></li>
		<ul>
		<li>
		<a href="javascript:time_entry_edit(1108);" title="edit this entry" class=""><span><i class="icon-time"></i> 00.50</span> &ndash; Changing the way we notify the user about attempted non-numeric time entries....</a>
		<!-- loop from="2" to="3" -->
		<!-- "2" --></li></ul><!-- "3" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Sunday, May 26: 001.50 hours</span>
		<!-- loop from="1" to="2" -->
		<!-- "1" --></li></ul><!-- "2" --></li></ul>
		<ul>
		<li>
		<span><i class="icon-calendar"></i> 2013, Week 22</span>
		<!-- loop from="2" to="1" -->
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Monday, May 27: 000.00 hours</span>
		<!-- loop from="3" to="2" -->
		<ul>
		<li>
		<a href="javascript:time_entry_edit(1109);" title="edit this entry" class=""><span><i class="icon-time"></i> 02.50</span> &ndash; Demonstrated workstream to Brigitte (using http://54.235.154.213/Workstream). Brigitte thinks the value is mostly to line managers and wants to get their input on the usefulness of something like Workstream. She also voiced concern that Worksrteam be DCAA-compliant. She will discuss with Alex and get back to me about maybe doing a pilot program....</a>
		<!-- loop from="3" to="3" -->
		<!-- "3" --></li>
		<ul>
		<li>
		<a href="javascript:time_entry_edit(1110);" title="edit this entry" class=""><span><i class="icon-time"></i> 01.00</span> &ndash; Consolidated entry form for express (task-centric) and time entry (project-centric) pages....</a>
		<!-- loop from="2" to="3" -->
		<!-- "2" --></li></ul><!-- "3" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Tuesday, May 28: 003.50 hours</span>
		<!-- loop from="3" to="2" -->
		<ul>
		<li>
		<a href="javascript:time_entry_edit(1111);" title="edit this entry" class=""><span><i class="icon-time"></i> 02.00</span> &ndash; Created LESS/CSS/JS code for Bootstrapped tree widget. See http://stackoverflow.com/a/16823729/1430996...</a>
		<!-- loop from="2" to="3" -->
		<!-- "2" --></li></ul><!-- "3" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Wednesday, May 29: 002.00 hours</span>
		<!-- loop from="2" to="2" -->
		<!-- "2" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Thursday, May 30: 000.00 hours</span>
		<!-- loop from="2" to="2" -->
		<!-- "2" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Friday, May 31: 000.00 hours</span>
		<!-- loop from="1" to="2" -->
		<!-- "1" --></li></ul><!-- "2" --></li></ul>
		<ul>
		<li>
		<span><i class="icon-calendar"></i> 2013, Week 22</span>
		<!-- loop from="2" to="1" -->
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Saturday, June 1: 000.00 hours</span>
		<!-- loop from="2" to="2" -->
		<!-- "2" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Sunday, June 2: 000.00 hours</span>
		<!-- loop from="1" to="2" -->
		<!-- "1" --></li></ul><!-- "2" --></li></ul>
		<ul>
		<li>
		<span><i class="icon-calendar"></i> 2013, Week 23</span>
		<!-- loop from="2" to="1" -->
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Monday, June 3: 000.00 hours</span>
		<!-- loop from="2" to="2" -->
		<!-- "2" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Tuesday, June 4: 000.00 hours</span>
		<!-- loop from="2" to="2" -->
		<!-- "2" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Wednesday, June 5: 000.00 hours</span>
		<!-- loop from="2" to="2" -->
		<!-- "2" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Thursday, June 6: 000.00 hours</span>
		<!-- loop from="2" to="2" -->
		<!-- "2" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Friday, June 7: 000.00 hours</span>
		<!-- loop from="2" to="2" -->
		<!-- "2" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Saturday, June 8: 000.00 hours</span>
		<!-- loop from="2" to="2" -->
		<!-- "2" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Sunday, June 9: 000.00 hours</span>
		<!-- loop from="1" to="2" -->
		<!-- "1" --></li></ul><!-- "2" --></li></ul>
		<ul>
		<li>
		<span><i class="icon-calendar"></i> 2013, Week 24</span>
		<!-- loop from="2" to="1" -->
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Monday, June 10: 000.00 hours</span>
		<!-- loop from="2" to="2" -->
		<!-- "2" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Tuesday, June 11: 000.00 hours</span>
		<!-- loop from="2" to="2" -->
		<!-- "2" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Wednesday, June 12: 000.00 hours</span>
		<!-- loop from="2" to="2" -->
		<!-- "2" --></li></ul>
		<ul>
		<li>
		<span class="badge badge-important"><i class="icon-minus-sign"></i> Thursday, June 13: 000.00 hours</span>
	</li>
</ul>