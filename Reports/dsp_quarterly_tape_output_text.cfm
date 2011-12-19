<!--- Reports/dsp_quarterly_tape_output.cfm
	Author: Jeromy French --->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_quarterly_tape_output.cfm">
	<responsibilities>
		I display the quarterly tape report.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="3/15/2009" role="FuseCoder" comments="Created File">
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
<cfoutput><!---RUN DATE #dateformat(now(), "mm/dd/yyyy")#                             NATIONAL AERONAUTICS AND SPACE ADMINISTRATION                             AS OF DATE #get_quarter_as_of.as_of_date#
                                                       HEADQUARTERS, WASHINGTON, D. C.
                                                      FINANCIAL AND CONTRACTUAL STATUS
                                                    FEDERAL ASSISTANCE AWARD DATA SYSTEM
                                             QUARTERLY EXTRACT BY CONTRACTOR FOR FY #left(attributes.fiscal_qtr,4)# QTR #right(attributes.fiscal_qtr,1)#
											 
---><cfloop query="get_quarterly_tape">
43.AAASAI EXEMPT          #rec_name##rec_city_cd##rec_city_name##rec_county_cd##rec_county_name##rec_state##rec_zip_cd##proj_desc##type_recip##type_action##rec_cong_dist##ag_org_cd##fed_award_id_number##fed_fund_sign##fed_fund_amount#                       #action_date##start_date##end_date##type_assist##record_type##late_indicator##correction##geog_cd#</cfloop></cfoutput>