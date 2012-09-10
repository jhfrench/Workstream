<!-- sourcecode/fusebox.init.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="fusebox.init.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/12/2007" role="FuseCoder" comments="Created File">
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
<cfif ( StructKeyExists(myFusebox.getApplication(), "fuseactionvariable") ) >

	<cfset variables.fa2Check = attributes[myFusebox.getApplication().fuseactionvariable] /> 
	<!--- check that the fuseaction is valid... --->
	<cfif (ListLen(variables.fa2Check, ".") neq 2)
		Or (
			Not StructKeyExists(myFusebox.getApplication().circuits, ListFirst(variables.fa2Check, '.') )
		)
		Or (
			Not StructKeyExists(myFusebox.getApplication().circuits[ListFirst(variables.fa2Check,'.')].fuseactions, ListLast(variables.fa2Check, '.') )
		) >
		<!--- 
		fuseaction is invalid, could set it to the defaultFuseaction or leave it and allow 
		fb errortemplates to trap it... 
		
		I'm going to flag it as a 404 and show an custom page in my fusebox application
		--->
		<cfheader statuscode="404" statustext="Not Found" />
		
		<cfset attributes[myFusebox.getApplication().fuseactionvariable] = "common_files.bad_fuseaction" />
	</cfif>
<cfelse>
HERE2<cfabort>
</cfif>