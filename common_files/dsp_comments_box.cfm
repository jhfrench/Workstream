
<!-- common_files/dsp_comments_box.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display a comments box of varying size and name.

	||
	Edits:
	$Log$
	||
	Variables:
	==> form: this tells us if the module should allow the user to change or add to the information in the box.
	==> title_row: optional text for the row above the text box.
	==> col_num: the number of columns to make the text box
	==> row_num: the number of rows to make the text box
	==> fill_value: the value to put in the text box
	==> box_name: the name of the text box
	==> col_span: the colspan attribute of the TD tag surrounding the text box
	<== attributes.box_name:
	END FUSEDOC --->
<cfparam name="attributes.col_num" default="100">
<cfparam name="attributes.row_num" default="5">
<cfparam name="attributes.fill_value" default="">
<cfparam name="attributes.box_name" default="comments">
<cfparam name="attributes.col_span" default="1">
<cfparam name="attributes.form" default="true">
<cfparam name="attributes.align" default="left">
<cfparam name="attributes.BGCOLOR1" default="">
<cfparam name="attributes.BGCOLOR2" default="">

<cfif isdefined("attributes.title_row")>
<tr valign="top"<cfif len(attributes.bgcolor1)> bgcolor="<cfoutput>#attributes.bgcolor1#</cfoutput>"</cfif>>
	<td colspan="<cfoutput>#attributes.col_span#</cfoutput>">
		<cfoutput>#attributes.title_row#</cfoutput>
	</td>
</tr>
</cfif>
<tr<cfif len(attributes.bgcolor2)> bgcolor=<cfoutput>#attributes.bgcolor2#</cfoutput></cfif>>
	<td align="<cfoutput>#attributes.Align#</cfoutput>" colspan="<cfoutput>#attributes.col_span#</cfoutput>">
<cfoutput>
<textarea cols="#attributes.col_num#" rows="#attributes.row_num#" name="#attributes.box_name#"<cfif NOT attributes.form> onfocus="blur()" readonly</cfif>>#attributes.fill_value#</textarea>
</cfoutput>
	</td>
</tr>
