<!-- common_files/act_upload.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_upload.cfm">
	<responsibilities>
		I help the user upload data into the system backend.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/12/2007" role="FuseCoder" comments="Created File">
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

<cfinclude template="qry_get_ref_upload_source.cfm">
<script language="JavaScript" type="text/javascript">
function upload_file_type_check() {
	if (document.forms.admin_upload.MY_FILE.value=='') {
		alert('Please select a file to upload.');
		return false;
	}
	else {
<cfif get_ref_upload_source.recordcount GT 1>
		if (document.forms.admin_upload.upload_source_id.selectedIndex==0) {
			alert('Please choose an insert type.');
			return false;
		}
		else {
			Element.toggle('admin_upload_table');
			Element.toggle('upload_in_progress');
			return true;
		}
<cfelse>
		Element.toggle('admin_upload_table');
		Element.toggle('upload_in_progress');
		return true;
</cfif>
	}
}
</script>