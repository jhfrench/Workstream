<!-- Home/dsp_calendar_commands.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_calendar_commands.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="9/28/2007" role="FuseCoder" comments="Created File">
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

<cfobject action="create" type="java" class="gov.nasa.hq.encrypt.SimpleEncDec" name="encDec">
<cfset variables.encoded_username=encDec.encryptText(session.user_name)>

<cfoutput>
<form action="#application.application_specific_settings.calendar_location#" method="post" id="calForm" name="calForm" target="_blank" style="display: inline;">
	<input type="hidden" name="uname" value="#variables.encoded_username#">
	<!--- <input type="image" name="submit" id="submit" src="images/mini_cal.jpg" alt="Submit to view the #application.product_name# calendar"> --->

<!--- Calendar Code --->
	<!--- Set the month and year parameters to equal the current values if they do not exist. --->
	<cfset variables.month=month(now())>
	<cfset variables.year=year(now())>
	<cfset variables.current_day=datepart('d', now())>
	<cfset variables.start_month=variables.month>
	<cfset variables.start_year=variables.year>

	<!--- Set the requested (or current) month/year date and determine the number of days in the month. --->
	<cfset variables.this_month_year=createdate(variables.year, variables.month, '1')>
	<cfset variables.days_in_month=daysinmonth(variables.this_month_year)>

	<!--- Set the values for the previous and next months for the back/next links. --->
	<cfset variables.previous_month_date=dateadd('m', -1, variables.this_month_year)>
	<cfset variables.previous_month=month(variables.previous_month_date)>
	<cfset variables.previous_year=year(variables.previous_month_date)>
	<cfset variables.next_month_year=dateadd('m', 1, variables.this_month_year)>
	<cfset variables.next_month=month(variables.next_month_year)>
	<cfset variables.next_year=year(variables.next_month_year)>
	<cfset variables.loop_day=0>
	<table align="center" class="bluetable" summary="Table displays the calendar">
		<tr>
			<td align="center" >
				<!--- Display the current month/year as well as the back/next links. --->
		
			<!---	NEXT/prev MONTH ARROWS -- Commented out by Akhan on 11.28.2007 need to evaluate how to incorporate page submit with Fusebox
					<cfoutput>
					<nobr>
					<A HREF="#application.application_specific_settings.calendar_location#?month=#Last_Month#&year=#Last_Year#" class="calendar"><<</A>
					<font class="caltexthighlight">#MonthAsString(month)# #year#</font>
					<A HREF="#application.application_specific_settings.calendar_location#?month=#Next_Month#&year=#Next_Year#" class="calendar">>></A>
				</cfoutput>
				--->
				<cfoutput>
					<nobr>
					<font class="caltexthighlight">#monthasstring(variables.month)# #variables.year#</font>
				</cfoutput>
				<br />
				<table border="1" cellspacing=0 cellpadding=3 summary="Table displays days of the week for calendar">
					<!--- Display the day of week headers. I've truncate the values to display only the first letter of each day of the week. --->
					<tr class="calendarheader">
						<cfloop from="1" to="7" index="variables.loop_day">
							<cfoutput>
								<td width="15" align="center">#left(dayofweekasstring(variables.loop_day), 1)#</td>
							</cfoutput>
						</cfloop>
					</tr>
				
					<!---Set the ThisDay variable to 0. This value will remain 0 until the day of the week on which the first day of the month falls on is reached.--->
					<cfset variables.this_day=0>
				
					<!--- Loop through until the number of days in the month is reached. --->
					<cfloop condition="variables.this_day LTE variables.days_in_month">
						<tr class="calendar">
							<!--- Loop through each day of the week. --->
							<cfloop from="1" to="7" index="variables.loop_day">
								<!---
								If ThisDay is still 0, check to see if the current day of the week in the loop
								matches the day of the week for the first day of the month.
								If the values match, set ThisDay to 1.
								Otherwise, the value will remain 0 until the correct day of the week is found.
								--->
								<cfif variables.this_day EQ 0>
									<cfif dayofweek(variables.this_month_year) EQ variables.loop_day>
										<cfset variables.this_day=1>
									</cfif>
								</cfif>
							
								<!---
								If the ThisDay value is still 0, or it is greater than the number of days in the month,
								display nothing in the column. Otherwise, display the day of the month and increment the value.
								--->
								<cfif (variables.this_day NEQ 0) AND (variables.this_day LTE variables.days_in_month)>
									<!--- I choose to highlight the current day of year using an IF-ELSE. ---->
									<td align="center">
										<cfset variables.dayview=dateformat(createdate(variables.year, variables.month, variables.this_day), "mm/dd/yyyy")>
										<font class="calendar<cfif (variables.this_day EQ variables.current_day) AND (variables.month EQ variables.start_month) AND (variables.year EQ variables.start_year)>today</cfif>"><cfoutput>#variables.this_day#</cfoutput></font>
									</td>
									<cfset variables.this_day=incrementvalue(variables.this_day)>
								<cfelse>
									<td>&nbsp;</td>
								</cfif>
							</cfloop>
						</tr>
					</cfloop>
				</table>
			
			</td>
		</tr>
	</table>
</form>
</cfoutput>
<br />
<!--- 
<div style="color:white;padding-bottom:3px;padding-top:12px;font-weight: bold;">Sample Upcoming Events:</div> --->

<table cellspacing="1" cellpadding="3" border="0" width="100%" align="center" style="border:1px solid white;" summary="Table displays Calenar details">
<!--- Removed from phase 1; bring back when events can be pulled from calendar db (JF | 10/4/7) 
	<tr>
		<td bgcolor="#aaaaaa" onmouseover="this.bgColor='#eeeeee';this.style.cursor='hand';" onmouseout="this.bgColor='#aaaaaa';this.style.cursor='default';">
			<div style="float:left;width:15px;padding-left:0px;color:black" id="ln1_plus">+</div>
			<div style="float:left;width:15px;padding-left:0px;color:black;display:none;" id="ln1_minus">&ndash;</div>
			<a href="javascript:void(Element.toggle('ln1_minus'));void(Element.toggle('ln1_plus'));void(Element.toggle('var_sub'));void(checkTrack());" onclick="Element.toggle('ln1_minus');Element.toggle('ln1_plus');Element.toggle('for_sub');checkTrack();">NASA Portal</a><br />
			<div style="margin-top:2px;margin-left:15px;margin-right:2px;display:none;" id="for_sub">
				<table cellspacing="1" cellpadding="3" border="0" width="100%" align="center" style="border:1px solid black;" bgcolor="#aaaaaa">
					<tr>
						<td bgcolor="#cccccc" onmouseover="this.bgColor='#eeeeee';this.style.cursor='hand';" onmouseout="this.bgColor='#cccccc';this.style.cursor='default';">
							<div style="float:left;width:15px;">&nbsp</div>
							<div style="float:left;width:150px;"><a href="index.cfm?fuseaction=Home.view_forum">Discovery Preps for October Launch</a></div>
						</td>
					</tr>
					<tr>
						<td bgcolor="#cccccc" onmouseover="this.bgColor='#eeeeee';this.style.cursor='hand';" onmouseout="this.bgColor='#cccccc';this.style.cursor='default';">
							<div style="float:left;width:15px;">&nbsp</div>
							<div style="float:left;width:150px;"><a href="index.cfm?fuseaction=Home.view_forum">Expedition 15</a></div>
						</td>
					</tr>
					<tr>
						<td bgcolor="#cccccc" onmouseover="this.bgColor='#eeeeee';this.style.cursor='hand';" onmouseout="this.bgColor='#cccccc';this.style.cursor='default';">
							<div style="float:left;width:15px;">&nbsp</div>
							<div style="float:left;width:150px;"><a href="index.cfm?fuseaction=Home.view_forum">Astronaut Health Reviews</a></div>
						</td>
					</tr>
				</table>
			</div>
		</td>
	</tr>
--->
	<tr>
		<td bgcolor="#aaaaaa" onmouseover="this.bgColor='#eeeeee';this.style.cursor='hand';" onmouseout="this.bgColor='#aaaaaa';this.style.cursor='default';">
			<div style="float:left;width:15px;">&nbsp</div>
			<div style="float:left;width:160px;"><a href="javascript:document.calForm.submit();">Launch <cfoutput>#application.product_name#</cfoutput> calendar</a></div>
		</td>
	</tr>
</table>

<script type="text/javascript" language="javascript">
	checkTrack();
</script>
