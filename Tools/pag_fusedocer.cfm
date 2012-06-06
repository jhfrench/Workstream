
<!--Tools/pag_fusedocer.cfm
	Author: Jeromy F -->
	<!---FUSEDOC
	||
	Responsibilities: I enter and display information that makes a fusedoc. This template can be easily modified to use queries to extract information such as programmer's names, etc.
	||
	Name: Jeromy French (jeromy_french@hotmail.com)
	||
	Edits:
	$Log$
	||
	<-> directory: string passed from entry form
	<-> prefix: string passed from entry form
	<-> name: string passed from entry form
	<-> suffix: string passed from entry form
	<-- pin: string returned from query
	--> pin: string passed from entry form
	<-> responsibilities: string passed from entry form
	<-> variables: string passed from entry form
 --->
<cfform name="submit_fusedoc" action="index.cfm?fuseaction=Tools.fusedocer" method="POST">
<cfinclude template="../common_files/qry_team_select.cfm">
<cfparam name="attributes.pin" default="  123  ">
<cfoutput>
<table>
	<cfmodule template="../common_files/dsp_section_title.cfm" title_class="HeadTextWhite" section_color="636332" section_title="&nbsp;FuseDoc'er" colspan="6" gutter=0>
	<tr class="SubHeadText">
		<td></td>
		<td>Directory</td>
		<td>Prefix</td>
		<td>Page Name</td>
		<td>Suffix</td>
	</tr>
	<tr class="SubHeadText">
		<td align="right" valign="top" class="SubHeadText">&lt;--</td>
		<td><select name="directory">
				<cfloop list="directory1,directory2,sample_Directory/sub_directory,etc" index="ii">
				<option value="#ii#" selected>#ii#/</option></cfloop>
			</select>
		</td>
		<td><select name="prefix">
				<cfloop list="act,app,dsp,pag,qry,sql" index="ii">
				<option value="#ii#" selected>#ii#_</option></cfloop>
			</select>
		</td>
		<td align="left" valign="top" width="5%">
			<cfinput name="name" type="Text" maxlength="25" value="" required="Yes" message="Please enter a template name">
		</td>
		<td align="left">
			<select name="suffix">
				<option value="cfm" selected>.cfm</option>
				<option value="html">.html</option>
			</select>
		</td>
	</tr>
	<tr>
		<td align="right" valign="top"></td>
		<td align="right" valign="top" class="SubHeadText">Author: </td>
		<td>
				<select name="pin"></cfoutput><cfoutput query="team_select">
					<option value="#name#_#lname#"<cfif NOT comparenocase(attributes.pin, "#name#_#lname#")> selected</cfif>>#name# #lname#</option></cfoutput>
				</select>
		</td>
		<cfoutput><td align="left" valign="top" class="SubHeadText">--&gt;</td>
	</tr>
	<tr>
		<td align="right" valign="top"></td>
		<td colspan="2" align="right" valign="top" class="SubHeadText">Responsibilities (written in first person)</td>
		<td colspan="2" align="left" valign="top"><textarea name="responsibilities" cols="60">I</textarea></td>
	</tr>
	<tr>
		<td colspan="5" align="left" valign="top" class="SubHeadText">
			Variables and includes: Use commas to separate variables.<br /> Be sure to use proper identifiers (+++ for includes, &lt;-- for outgoing variables, --&gt; for incoming variables).
		</td>
	</tr>
	<tr>
		<td></td>
		<td colspan="4" align="left" valign="top"><textarea name="variables" cols="90"></textarea></td>
	</tr>
	<tr>
		<td colspan="5" align="center" valign="top">
			<input type="reset"> <input type="submit" value="Generate FuseDoc">
		</td>
	</tr>
</cfoutput>
</table>
</cfform>
<cfif isdefined("form.prefix")>
<p class="RptTitle">
Cut and Paste the following code:
<hr></p>
	<cfset first_name="">
<cfif NOT Compare(form.pin, "TBD")>
	<cfset auth_name="To Be Determined">
	<cfset author=form.pin>
<cfelse>
	<cfset auth_name=Replace(form.pin, "_", " ")>
	<cfif NOT ListLen(form.pin, "_") GT 2>
		<cfset first_name=ListFirst(form.pin, "_")>
		<cfset last_init=Left(listgetat(form.pin, 2, "_"), 1)>
	<cfelse>
		<cfloop list="#form.pin#" index="ii">
		<cfset first_name="#first_name# #ii#"></cfloop>
		<cfset last_init=Left(listlast(form.pin, "_"), 1)>
	</cfif>
	<cfset author="#first_name# #last_init#">
</cfif>
<pre>
&lt;!-- <cfoutput>#form.directory#</cfoutput>/<cfoutput>#form.prefix#_#Replace(form.name, " ", "_", "ALL")#.#form.suffix#</cfoutput>
	Author: <cfoutput>#trim(author)#</cfoutput> --&gt;
<cfif left(Server.ColdFusion.ProductVersion, 1) GT 3>&lt;cfsilent&gt;</cfif>
	&lt;!--- FUSEDOC
	||
	Responsibilities: <cfoutput>#form.responsibilities#<cfif NOT Right(form.responsibilities, 1) IS ".">.</cfif></cfoutput>
	||
	Name: <cfoutput>#trim(auth_name)#</cfoutput>
	||
	Edits:
	$Log$
	||<cfif isdefined("form.variables") AND len(form.variables)><cfloop list="#form.variables#" index="ii">
	<cfoutput>#Trim(ii)#</cfoutput></cfloop><cfelse>
	Variables:
	/*ATTENTION <cfif form.pin IS "TBD"><cfoutput>#auth_name#</cfoutput><cfelse><cfoutput>#first_name#</cfoutput></cfif>: replace this line with names of templates and variables necesary for the page to function. Use FuseDoc conventions as defined in FuseDoc Primer/</cfif>
	END FUSEDOC ---&gt;
<cfif left(Server.ColdFusion.ProductVersion, 1) GT 3>&lt;/cfsilent&gt;</cfif>

</pre>
<p>&nbsp;
<p>&nbsp;
<p>&nbsp;
<p>&nbsp;
<p>&nbsp;
<p>&nbsp;
<p>&nbsp;
<p>&nbsp;
<p>&nbsp;
<p>&nbsp;
<p>&nbsp;
</cfif>