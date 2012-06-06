<!-- Help/dsp_submit_faq.cfm
	Author: Jeromy French -->
<!--- 
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_submit_faq.cfm">
	<responsibilities>
		I show the Help_Article records associated with the fuseaction of the page the user is viewing.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/18/2007" role="FuseCoder" comments="Created File">
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
<cfsetting showdebugoutput="no">
<cfset variables.question_processed_ind=0>
<cfif len(attributes.question)>
	<cfinclude template="act_submit_faq.cfm">
</cfif>
<p id="faq_result">
<cfif variables.question_processed_ind>
Your question was submitted and will be answered as soon as possible.
<cfelse>
We were unable to process your question.
</cfif>
</p>