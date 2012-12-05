
<!--Tools/pag_generate_invoice.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the invoice tool invoice list.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log$
	||
	Variables:
	END FUSEDOC --->
</cfsilent>
<cfinclude template="act_generate_invoice.cfm">

		<cfdump var="#get_customer_invoice_details#" />
		<cfdump var="#get_invoice_project_summary#" />
		<cfdump var="#act_generate_invoice#" />
		
<cfif variables.continue_processing_ind>
	<cfsavecontent variable="variables.generate_invoice">
<?xml version="1.0"?>
<?mso-application progid="Excel.Sheet"?>
<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:o="urn:schemas-microsoft-com:office:office"
 xmlns:x="urn:schemas-microsoft-com:office:excel"
 xmlns:dt="uuid:C2F41010-65B3-11d1-A29F-00AA00C14882"
 xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:html="http://www.w3.org/TR/REC-html40">
 <DocumentProperties xmlns="urn:schemas-microsoft-com:office:office">
  <Author>jfrench</Author>
  <LastAuthor>jhfrench</LastAuthor>
  <LastPrinted>2006-05-17T18:53:55Z</LastPrinted>
<cfoutput>
  <Created>#dateformat(now(), 'yyyy-mm-dd')#T#timeformat(now(), 'HH:mm:ss')#Z</Created>
  <LastSaved>#dateformat(now(), 'yyyy-mm-dd')#T#timeformat(now(), 'HH:mm:ss')#Z</LastSaved>
</cfoutput>
  <Company>Microsoft Corporation</Company>
  <Version>14.00</Version>
 </DocumentProperties>
 <CustomDocumentProperties xmlns="urn:schemas-microsoft-com:office:office">
  <_TemplateID dt:dt="string">TC101001301033</_TemplateID>
 </CustomDocumentProperties>
 <OfficeDocumentSettings xmlns="urn:schemas-microsoft-com:office:office">
  <AllowPNG/>
 </OfficeDocumentSettings>
 <ExcelWorkbook xmlns="urn:schemas-microsoft-com:office:excel">
  <WindowHeight>5640</WindowHeight>
  <WindowWidth>18912</WindowWidth>
  <WindowTopX>120</WindowTopX>
  <WindowTopY>6624</WindowTopY>
  <ProtectStructure>False</ProtectStructure>
  <ProtectWindows>False</ProtectWindows>
 </ExcelWorkbook>
 <Styles>
  <Style ss:ID="Default" ss:Name="Normal">
   <Alignment ss:Vertical="Bottom"/>
   <Borders/>
   <Font ss:FontName="Arial"/>
   <Interior/>
   <NumberFormat/>
   <Protection/>
  </Style>
  <Style ss:ID="s57">
   <Interior/>
  </Style>
  <Style ss:ID="s58">
   <Alignment ss:Horizontal="Left" ss:Vertical="Bottom"/>
   <Borders/>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="12"
    ss:Color="#993366"/>
   <Interior/>
  </Style>
  <Style ss:ID="s59">
   <Alignment ss:Horizontal="Left" ss:Vertical="Bottom"/>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8"
    ss:Color="#993366"/>
   <Interior/>
  </Style>
  <Style ss:ID="s60">
   <Alignment ss:Horizontal="Left" ss:Vertical="Bottom"/>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8"
    ss:Color="#993366"/>
   <Interior/>
   <NumberFormat ss:Format="[ENG][$-409]mmmm\ d\,\ yyyy;@"/>
  </Style>
  <Style ss:ID="s61">
   <Font ss:FontName="Arial" x:Family="Swiss" ss:Color="#993366"/>
   <Interior/>
  </Style>
  <Style ss:ID="s62">
   <Alignment ss:Horizontal="Left" ss:Vertical="Bottom"/>
   <Borders/>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Color="#993366"/>
   <Interior/>
  </Style>
  <Style ss:ID="s63">
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8"
    ss:Color="#993366"/>
   <Interior/>
  </Style>
  <Style ss:ID="s64">
   <Alignment ss:Vertical="Bottom"/>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8"
    ss:Color="#993366"/>
   <Interior/>
  </Style>
  <Style ss:ID="s65">
   <Alignment ss:Vertical="Top"/>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8"
    ss:Color="#993366"/>
   <Interior/>
  </Style>
  <Style ss:ID="s66">
   <Alignment ss:Horizontal="Left" ss:Vertical="Bottom"/>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8"
    ss:Color="#993366"/>
  </Style>
  <Style ss:ID="s67">
   <Alignment ss:Horizontal="Left" ss:Vertical="Bottom"/>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8"
    ss:Color="#993366" ss:Bold="1"/>
   <Interior/>
  </Style>
  <Style ss:ID="s68">
   <Font ss:FontName="Arial" x:Family="Swiss" ss:Color="#993366"/>
  </Style>
  <Style ss:ID="s69">
   <Alignment ss:Horizontal="Left" ss:Vertical="Center"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#9DBEC3"/>
   </Borders>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8"
    ss:Color="#993366" ss:Bold="1"/>
   <Interior ss:Color="#9DBEC3" ss:Pattern="Solid"/>
  </Style>
  <Style ss:ID="s70">
   <Alignment ss:Horizontal="Left" ss:Vertical="Center"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
   </Borders>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8"
    ss:Color="#993366" ss:Bold="1"/>
   <Interior ss:Color="#9DBEC3" ss:Pattern="Solid"/>
  </Style>
  <Style ss:ID="s71">
   <Alignment ss:Horizontal="Left" ss:Vertical="Center"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#9DBEC3"/>
   </Borders>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8"
    ss:Color="#993366" ss:Bold="1"/>
   <Interior ss:Color="#9DBEC3" ss:Pattern="Solid"/>
  </Style>
  <Style ss:ID="s72">
   <Alignment ss:Vertical="Top"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
   </Borders>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8"
    ss:Color="#993366"/>
   <Interior ss:Color="#EDF3F3" ss:Pattern="Solid"/>
   <NumberFormat ss:Format="@"/>
  </Style>
  <Style ss:ID="s73">
   <Alignment ss:Vertical="Top" ss:WrapText="1"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
   </Borders>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8"
    ss:Color="#993366"/>
   <Interior ss:Color="#EDF3F3" ss:Pattern="Solid"/>
   <NumberFormat/>
  </Style>
  <Style ss:ID="s74">
   <Alignment ss:Vertical="Top"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
   </Borders>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8"
    ss:Color="#993366"/>
   <Interior ss:Color="#E3EDED" ss:Pattern="Solid"/>
   <NumberFormat ss:Format="_(* #,##0.00_);_(* \(#,##0.00\);_(* &quot;-&quot;??_);_(@_)"/>
  </Style>
  <Style ss:ID="s75">
   <Alignment ss:Horizontal="Left" ss:Vertical="Center"/>
   <Borders/>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8"
    ss:Color="#993366"/>
   <Interior ss:Color="#FFFFFF" ss:Pattern="Solid"/>
   <NumberFormat/>
  </Style>
  <Style ss:ID="s76">
   <Alignment ss:Horizontal="Right" ss:Vertical="Center"/>
   <Borders/>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8"
    ss:Color="#993366"/>
   <Interior ss:Color="#FFFFFF" ss:Pattern="Solid"/>
  </Style>
  <Style ss:ID="s77">
   <Alignment ss:Vertical="Center"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
   </Borders>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8"
    ss:Color="#993366"/>
   <Interior ss:Color="#E3EDED" ss:Pattern="Solid"/>
   <NumberFormat
    ss:Format="_(&quot;$&quot;* #,##0.00_);_(&quot;$&quot;* \(#,##0.00\);_(&quot;$&quot;* &quot;-&quot;??_);_(@_)"/>
  </Style>
  <Style ss:ID="s78">
   <Alignment ss:Vertical="Center"/>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman"/>
  </Style>
  <Style ss:ID="s79">
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Color="#993366"/>
  </Style>
  <Style ss:ID="s80">
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8"
    ss:Color="#993366"/>
  </Style>
  <Style ss:ID="s81">
   <Alignment ss:Vertical="Top"/>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8"
    ss:Color="#993366"/>
  </Style>
  <Style ss:ID="s82">
   <Alignment ss:Vertical="Top"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
   </Borders>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8"
    ss:Color="#993366"/>
   <Interior ss:Color="#EDF3F3" ss:Pattern="Solid"/>
   <NumberFormat ss:Format="m/d/yy;@"/>
  </Style>
  <Style ss:ID="s83">
   <Alignment ss:Vertical="Top" ss:WrapText="1"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
   </Borders>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8"
    ss:Color="#993366"/>
   <Interior ss:Color="#EDF3F3" ss:Pattern="Solid"/>
   <NumberFormat/>
  </Style>
  <Style ss:ID="s84">
   <Alignment ss:Vertical="Top" ss:WrapText="1"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
   </Borders>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8"
    ss:Color="#993366"/>
   <Interior ss:Color="#EDF3F3" ss:Pattern="Solid"/>
   <NumberFormat/>
  </Style>
  <Style ss:ID="s85">
   <Alignment ss:Vertical="Top"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
   </Borders>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8"
    ss:Color="#993366"/>
   <Interior/>
   <NumberFormat ss:Format="m/d/yy;@"/>
  </Style>
  <Style ss:ID="s86">
   <Alignment ss:Vertical="Top" ss:WrapText="1"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
   </Borders>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8"
    ss:Color="#993366"/>
   <Interior/>
   <NumberFormat/>
  </Style>
  <Style ss:ID="s87">
   <Alignment ss:Vertical="Top" ss:WrapText="1"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
   </Borders>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8"
    ss:Color="#993366"/>
   <Interior/>
   <NumberFormat ss:Format="_(* #,##0.00_);_(* \(#,##0.00\);_(* &quot;-&quot;??_);_(@_)"/>
  </Style>
  <Style ss:ID="s88">
   <Alignment ss:Vertical="Top" ss:WrapText="1"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
   </Borders>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8"
    ss:Color="#993366"/>
   <Interior/>
   <NumberFormat/>
  </Style>
  <Style ss:ID="s89">
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Color="#FFFFFF"/>
  </Style>
  <Style ss:ID="s90">
   <Alignment ss:Horizontal="Left" ss:Vertical="Bottom"/>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="12"
    ss:Color="#993366" ss:Bold="1"/>
  </Style>
  <Style ss:ID="s101">
   <Alignment ss:Horizontal="Center" ss:Vertical="Center"/>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8"
    ss:Color="#993366"/>
  </Style>
  <Style ss:ID="s102">
   <Alignment ss:Horizontal="Right" ss:Vertical="Bottom"/>
   <Borders/>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="38"
    ss:Color="#808080" ss:Italic="1"/>
   <Interior/>
  </Style>
  <Style ss:ID="s104">
   <Alignment ss:Vertical="Bottom"/>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Color="#993366"/>
  </Style>
  <Style ss:ID="s105">
   <Alignment ss:Horizontal="Center" ss:Vertical="Center" ss:WrapText="1"/>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8"
    ss:Color="#000000"/>
  </Style>
  <Style ss:ID="s106">
   <Alignment ss:Vertical="Bottom"/>
   <Borders/>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8"
    ss:Color="#993366"/>
  </Style>
  <Style ss:ID="s112">
   <Alignment ss:Horizontal="Right" ss:Vertical="Top"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
   </Borders>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8"
    ss:Color="#993366"/>
   <Interior ss:Color="#E3EDED" ss:Pattern="Solid"/>
   <NumberFormat ss:Format="_(* #,##0.00_);_(* \(#,##0.00\);_(* &quot;-&quot;??_);_(@_)"/>
  </Style>
  <Style ss:ID="s123">
   <Alignment ss:Horizontal="Right" ss:Vertical="Center"/>
   <Borders/>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="12"
    ss:Color="#993366"/>
   <Interior ss:Color="#FFFFFF" ss:Pattern="Solid"/>
  </Style>
  <Style ss:ID="s128">
   <Alignment ss:Vertical="Top"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
   </Borders>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8"
    ss:Color="#993366"/>
   <Interior/>
   <NumberFormat ss:Format="@"/>
  </Style>
  <Style ss:ID="s129">
   <Alignment ss:Horizontal="Right" ss:Vertical="Top"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
   </Borders>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8"
    ss:Color="#993366"/>
   <Interior/>
   <NumberFormat ss:Format="_(* #,##0.00_);_(* \(#,##0.00\);_(* &quot;-&quot;??_);_(@_)"/>
  </Style>
  <Style ss:ID="s130">
   <Alignment ss:Horizontal="Right" ss:Vertical="Top"/>
   <Borders>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
   </Borders>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8"
    ss:Color="#993366"/>
   <Interior ss:Color="#E3EDED" ss:Pattern="Solid"/>
   <NumberFormat ss:Format="_(* #,##0.00_);_(* \(#,##0.00\);_(* &quot;-&quot;??_);_(@_)"/>
  </Style>
  <Style ss:ID="s131">
   <Alignment ss:Horizontal="Right" ss:Vertical="Top"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Double" ss:Weight="3"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="12"
    ss:Color="#993366"/>
   <Interior/>
   <NumberFormat
    ss:Format="_(&quot;$&quot;* #,##0.00_);_(&quot;$&quot;* \(#,##0.00\);_(&quot;$&quot;* &quot;-&quot;??_);_(@_)"/>
  </Style>
 </Styles>
 <Worksheet ss:Name="Invoice Overview">
  <Table ss:ExpandedColumnCount="7" ss:ExpandedRowCount="24" x:FullColumns="1"
   x:FullRows="1" ss:DefaultRowHeight="13.2">
   <Column ss:Index="2" ss:Width="99"/>
   <Column ss:Width="150"/>
   <Column ss:Width="54.599999999999994"/>
   <Column ss:AutoFitWidth="0" ss:Width="78"/>
   <Row ss:AutoFitHeight="0" ss:Height="56.25">
    <Cell ss:MergeAcross="4" ss:StyleID="s102"><Data ss:Type="String">Invoice</Data></Cell>
    <Cell ss:StyleID="s57"/>
    <Cell ss:StyleID="s57"/>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="9">
    <Cell ss:StyleID="s58"/>
    <Cell ss:StyleID="s58"/>
    <Cell ss:StyleID="s58"/>
    <Cell ss:StyleID="s59"/>
    <Cell ss:StyleID="s60"/>
    <Cell ss:StyleID="s61"/>
    <Cell ss:StyleID="s61"/>
   </Row>
<cfoutput>
   <Row ss:AutoFitHeight="0" ss:Height="18">
    <Cell ss:StyleID="s58"><Data ss:Type="String">Applied Internet Technologies</Data></Cell>
    <Cell ss:StyleID="s58"/>
    <Cell ss:StyleID="s58"/>
    <Cell ss:StyleID="s59"><Data ss:Type="String">Date:</Data></Cell>
    <Cell ss:StyleID="s60"><Data ss:Type="DateTime">#dateformat(now(), 'yyyy-mm-dd')#T00:00:00.000</Data></Cell>
    <Cell ss:StyleID="s61"/>
    <Cell ss:StyleID="s61"/>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="15">
    <Cell ss:StyleID="s62"><Data ss:Type="String">Jeromy French</Data></Cell>
    <Cell ss:StyleID="s62"/>
    <Cell ss:StyleID="s62"/>
    <Cell ss:StyleID="s59"><Data ss:Type="String">Invoice ##:</Data></Cell>
    <Cell ss:StyleID="s59"><Data ss:Type="Number">#act_generate_invoice.invoice_id#</Data></Cell>
    <Cell ss:StyleID="s61"/>
    <Cell ss:StyleID="s61"/>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="18">
    <Cell ss:StyleID="s58"/>
    <Cell ss:StyleID="s58"/>
    <Cell ss:StyleID="s58"/>
    <Cell ss:StyleID="s59"><Data ss:Type="String">Customer ID:</Data></Cell>
    <Cell ss:StyleID="s59"><Data ss:Type="Number">#get_customer_invoice_details.root_code#</Data></Cell>
    <Cell ss:StyleID="s61"/>
    <Cell ss:StyleID="s61"/>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="9">
    <Cell ss:StyleID="s63"/>
    <Cell ss:StyleID="s63"/>
    <Cell ss:StyleID="s63"/>
    <Cell ss:StyleID="s63"/>
    <Cell ss:StyleID="s65"/>
    <Cell ss:StyleID="s61"/>
    <Cell ss:StyleID="s61"/>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="15">
    <Cell ss:StyleID="s59"><Data ss:Type="String">To:</Data></Cell>
    <Cell ss:MergeAcross="1" ss:StyleID="s66"><Data ss:Type="String">#get_customer_invoice_details.first_name# #get_customer_invoice_details.last_name#</Data></Cell>
    <Cell ss:StyleID="s65"/>
    <Cell ss:StyleID="s65"/>
    <Cell ss:StyleID="s61"/>
    <Cell ss:StyleID="s61"/>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="15">
    <Cell ss:StyleID="s67"/>
    <Cell ss:MergeAcross="1" ss:StyleID="s66"><Data ss:Type="String">#get_customer_invoice_details.customer_name#</Data></Cell>
    <Cell ss:StyleID="s65"/>
    <Cell ss:StyleID="s65"/>
    <Cell ss:StyleID="s61"/>
    <Cell ss:StyleID="s61"/>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="15">
    <Cell ss:StyleID="s64"/>
    <Cell ss:StyleID="s66"><Data ss:Type="String">#get_customer_invoice_details.company_address1#<cfif len(get_customer_invoice_details.company_address2)>, #get_customer_invoice_details.company_address2#</cfif></Data></Cell>
    <Cell ss:StyleID="s66"/>
    <Cell ss:StyleID="s65"/>
    <Cell ss:StyleID="s65"/>
    <Cell ss:StyleID="s61"/>
    <Cell ss:StyleID="s61"/>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="15">
    <Cell ss:StyleID="s64"/>
    <Cell ss:StyleID="s66"><Data ss:Type="String">#get_customer_invoice_details.company_city#, #get_customer_invoice_details.company_state# #get_customer_invoice_details.company_zip#</Data></Cell>
    <Cell ss:StyleID="s66"/>
    <Cell ss:StyleID="s65"/>
    <Cell ss:StyleID="s68"/>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="15">
    <Cell ss:StyleID="s64"/>
    <Cell ss:StyleID="s66"><Data ss:Type="String">#get_customer_invoice_details.work_phone#</Data></Cell>
    <Cell ss:StyleID="s66"/>
    <Cell ss:StyleID="s65"/>
    <Cell ss:StyleID="s65"/>
    <Cell ss:StyleID="s61"/>
    <Cell ss:StyleID="s61"/>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="9">
    <Cell ss:StyleID="s68"/>
    <Cell ss:StyleID="s68"/>
    <Cell ss:StyleID="s68"/>
    <Cell ss:StyleID="s68"/>
    <Cell ss:StyleID="s68"/>
    <Cell ss:StyleID="s68"/>
    <Cell ss:StyleID="s68"/>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="13.5">
    <Cell ss:StyleID="s68"/>
    <Cell ss:StyleID="s69"><Data ss:Type="String">Project</Data></Cell>
    <Cell ss:StyleID="s70"><Data ss:Type="String">Description</Data></Cell>
    <Cell ss:StyleID="s71"><Data ss:Type="String">Line Total</Data></Cell>
    <Cell ss:StyleID="s68"/>
    <Cell ss:StyleID="s68"/>
    <Cell ss:StyleID="s68"/>
   </Row>
<cfloop query="get_invoice_project_summary">
   <Row ss:AutoFitHeight="0" ss:Height="13.5">
    <Cell ss:StyleID="s68"/>
    <Cell ss:StyleID="s72"><Data ss:Type="String">#project_code#</Data></Cell>
    <Cell ss:StyleID="s73"><Data ss:Type="String">#project_name#</Data></Cell>
    <Cell ss:StyleID="s112" ss:Formula="='Project #project_code#'!R[-8]C[1]"><Data
      ss:Type="Number">#entry_count+4#</Data></Cell>
    <Cell ss:StyleID="s68"/>
    <Cell ss:StyleID="s68"/>
    <Cell ss:StyleID="s68"/>
   </Row>
</cfloop>
   <Row ss:Height="18">
    <Cell ss:StyleID="s68"/>
    <Cell ss:StyleID="s75"/>
    <Cell ss:StyleID="s123"><Data ss:Type="String">Total</Data></Cell>
    <Cell ss:StyleID="s131" ss:Formula="=SUM(R[-#get_invoice_project_summary.recordcount#]C:R[-1]C)"><Data ss:Type="Number">280</Data></Cell>
    <Cell ss:StyleID="s68"/>
    <Cell ss:StyleID="s68"/>
    <Cell ss:StyleID="s68"/>
   </Row>
</cfoutput>
   <Row ss:AutoFitHeight="0" ss:Height="9">
    <Cell ss:MergeAcross="4" ss:StyleID="s104"/>
    <Cell ss:StyleID="s68"/>
    <Cell ss:StyleID="s68"/>
   </Row>
   <Row>
    <Cell ss:MergeAcross="4" ss:MergeDown="1" ss:StyleID="s105"><ss:Data
      ss:Type="String" xmlns="http://www.w3.org/TR/REC-html40"><Font html:Size="14"
       html:Color="#000000">Payment due upon receipt, please make all checks payable to Applied Internet Technologies</Font><Font
       html:Size="10" html:Color="#808080">&#10;Thank you for your business!</Font></ss:Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="39.6"/>
   <Row ss:AutoFitHeight="0" ss:Height="9">
    <Cell ss:StyleID="s78"/>
    <Cell ss:StyleID="s78"/>
    <Cell ss:StyleID="s78"/>
    <Cell ss:StyleID="s78"/>
    <Cell ss:StyleID="s78"/>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="13.5">
    <Cell ss:MergeAcross="4" ss:StyleID="s101"><Data ss:Type="String">2809 Marshall Street, Falls Church, VA 22042  703.850.6391 jeromy_french@hotmail.com</Data></Cell>
    <Cell ss:StyleID="s68"/>
   </Row>
   <Row>
    <Cell ss:StyleID="s68"/>
    <Cell ss:StyleID="s68"/>
    <Cell ss:StyleID="s68"/>
    <Cell ss:StyleID="s68"/>
    <Cell ss:StyleID="s68"/>
   </Row>
   <Row>
    <Cell ss:StyleID="s68"/>
    <Cell ss:StyleID="s68"/>
    <Cell ss:StyleID="s68"/>
    <Cell ss:StyleID="s68"/>
    <Cell ss:StyleID="s68"/>
   </Row>
  </Table>
  <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
   <PageSetup>
    <Header x:Margin="0.3"/>
    <Footer x:Margin="0.3"/>
    <PageMargins x:Bottom="0.75" x:Left="0.7" x:Right="0.7" x:Top="0.75"/>
   </PageSetup>
   <Print>
    <ValidPrinterInfo/>
    <HorizontalResolution>600</HorizontalResolution>
    <VerticalResolution>600</VerticalResolution>
   </Print>
   <Selected/>
   <Panes>
    <Pane>
     <Number>3</Number>
     <RangeSelection>R1C1:R1C5</RangeSelection>
    </Pane>
   </Panes>
   <ProtectObjects>False</ProtectObjects>
   <ProtectScenarios>False</ProtectScenarios>
  </WorksheetOptions>
 </Worksheet>
 <Worksheet ss:Name="Project 1001.01">
  <Names>
   <NamedRange ss:Name="Print_Area" ss:RefersTo="='Project 1001.01'!R1C1:R3C5"/>
  </Names>
  <Table ss:ExpandedColumnCount="5" ss:ExpandedRowCount="6" x:FullColumns="1"
   x:FullRows="1" ss:StyleID="s79" ss:DefaultRowHeight="15">
   <Column ss:StyleID="s79" ss:Width="46.2"/>
   <Column ss:StyleID="s79" ss:AutoFitWidth="0" ss:Width="40.799999999999997"/>
   <Column ss:StyleID="s79" ss:AutoFitWidth="0" ss:Width="387.6"/>
   <Column ss:StyleID="s79" ss:Width="42.6"/>
   <Column ss:StyleID="s79" ss:AutoFitWidth="0" ss:Width="72"/>
   <Row ss:Height="17.399999999999999" ss:StyleID="s80">
    <Cell ss:StyleID="s90"><Data ss:Type="String">Project:</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s90"><Data ss:Type="String">eAuth mura</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s81"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s81"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="9" ss:StyleID="s80">
    <Cell ss:MergeAcross="4" ss:StyleID="s106"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s69"><Data ss:Type="String">Date</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s70"><Data ss:Type="String">Hours</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s70"><Data ss:Type="String">Description</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s70"><Data ss:Type="String">Unit Price</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s71"><Data ss:Type="String">Line Total</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s82"><Data ss:Type="DateTime">2012-09-18T00:00:00.000</Data></Cell>
    <Cell ss:StyleID="s83"><Data ss:Type="Number">0.25</Data></Cell>
    <Cell ss:StyleID="s84"><Data ss:Type="String">Looking up relevant CSS file.</Data></Cell>
    <Cell ss:StyleID="s73"><Data ss:Type="String">Hourly-$35</Data></Cell>
    <Cell ss:StyleID="s74"><Data ss:Type="Number">8.75</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s85"><Data ss:Type="DateTime">2012-09-18T00:00:00.000</Data></Cell>
    <Cell ss:StyleID="s86"><Data ss:Type="Number">0.25</Data></Cell>
    <Cell ss:StyleID="s87"><Data ss:Type="String">Added margin-left:auto;margin-right:auto; to .main_content on css/service_request.css</Data></Cell>
    <Cell ss:StyleID="s88"><Data ss:Type="String">Hourly-$35</Data></Cell>
    <Cell ss:StyleID="s87"><Data ss:Type="Number">8.75</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:Index="4" ss:StyleID="s76"><Data ss:Type="String">Total</Data></Cell>
    <Cell ss:StyleID="s77" ss:Formula="=SUM(R[-2]C:R[-1]C)"><Data ss:Type="Number">17.5</Data></Cell>
   </Row>
  </Table>
  <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
   <PageSetup>
    <Layout x:CenterHorizontal="1"/>
    <PageMargins x:Bottom="0.5" x:Top="0.5"/>
   </PageSetup>
   <Print>
    <ValidPrinterInfo/>
    <HorizontalResolution>600</HorizontalResolution>
    <VerticalResolution>600</VerticalResolution>
   </Print>
   <DoNotDisplayGridlines/>
   <ProtectObjects>False</ProtectObjects>
   <ProtectScenarios>False</ProtectScenarios>
  </WorksheetOptions>
 </Worksheet>
 <Worksheet ss:Name="Project 1001.02">
  <Names>
   <NamedRange ss:Name="Print_Area" ss:RefersTo="='Project 1001.02'!R1C1:R4C5"/>
  </Names>
  <Table ss:ExpandedColumnCount="6" ss:ExpandedRowCount="9" x:FullColumns="1"
   x:FullRows="1" ss:StyleID="s79" ss:DefaultRowHeight="15">
   <Column ss:StyleID="s79" ss:Width="46.2"/>
   <Column ss:StyleID="s79" ss:AutoFitWidth="0" ss:Width="40.799999999999997"/>
   <Column ss:StyleID="s79" ss:AutoFitWidth="0" ss:Width="411.6"/>
   <Column ss:StyleID="s79" ss:Width="42.6"/>
   <Column ss:StyleID="s79" ss:AutoFitWidth="0" ss:Width="72"/>
   <Row ss:Height="17.399999999999999" ss:StyleID="s80">
    <Cell ss:StyleID="s90"><Data ss:Type="String">Project:</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s90"><Data ss:Type="String">Service Request Module</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s81"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s81"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="9" ss:StyleID="s80">
    <Cell ss:MergeAcross="4" ss:StyleID="s106"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s69"><Data ss:Type="String">Date</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s70"><Data ss:Type="String">Hours</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s70"><Data ss:Type="String">Description</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s70"><Data ss:Type="String">Unit Price</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s71"><Data ss:Type="String">Line Total</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s82"><Data ss:Type="DateTime">2012-09-18T00:00:00.000</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s83"><Data ss:Type="Number">0.25</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s84"><Data ss:Type="String">Looking up relevant CSS file.</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s73"><Data ss:Type="String">Hourly-$35</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s74"><Data ss:Type="Number">8.75</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s89"><Data ss:Type="Number">446</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s85"><Data ss:Type="DateTime">2012-09-18T00:00:00.000</Data></Cell>
    <Cell ss:StyleID="s86"><Data ss:Type="Number">0.25</Data></Cell>
    <Cell ss:StyleID="s87"><Data ss:Type="String">Added margin-left:auto;margin-right:auto; to .main_content on css/service_request.css</Data></Cell>
    <Cell ss:StyleID="s88"><Data ss:Type="String">Hourly-$35</Data></Cell>
    <Cell ss:StyleID="s87"><Data ss:Type="Number">8.75</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s82"><Data ss:Type="DateTime">2012-09-18T00:00:00.000</Data></Cell>
    <Cell ss:StyleID="s83"><Data ss:Type="Number">0.5</Data></Cell>
    <Cell ss:StyleID="s84"><Data ss:Type="String">Determined that reset.css includes a css rule to set float: left; on label elements. Removing the float causes everything to center, which doesn't look right either.</Data></Cell>
    <Cell ss:StyleID="s73"><Data ss:Type="String">Hourly-$35</Data></Cell>
    <Cell ss:StyleID="s74"><Data ss:Type="Number">17.5</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s85"><Data ss:Type="DateTime">2012-10-19T00:00:00.000</Data></Cell>
    <Cell ss:StyleID="s86"><Data ss:Type="Number">2.25</Data></Cell>
    <Cell ss:StyleID="s87"><Data ss:Type="String">Researched issue, determined the following facts:&#10;•	The production database has no records entered between Oct 12 (Fri) and 17 (Wed). There have been other gaps of 4+ days in the system’s history (see attached).&#10;•	The current production database has the following attributes for tickets 443 and 444:&#10;requestor	date_received	description&#10;Ricks, Karen	10/17/2012 16:22	Project eClips need to be added to the FY12 list o...&#10;Ricks, Karen	10/17/2012 16:27	Project:  Comp.NASA Innovations in Climate Educati...&#10;&#10;•	The development database has not had an entry since early August; that last record was given tracking number 152. This rules out a production vs development database possibility.&#10;•	The Service Request source code has not been altered in weeks; this anomaly is not a result of a bug introduced into the code this week.&#10;&#10;Further thoughts:&#10;I considered the possibility Jessica had shared an edit link for ticket 443 with Bryan and Karen, but editing a ticket does not send out the announcement email (only ticket creation). Besides, Karen created tickets 443 and 444 within 5 minutes of each other, so I don’t think she was using a bad link.&#10;My suspicion remains that the database was restored from an old backup (that didn’t have tickets 443 and 444)&#45;-twice, or (less likely) Expert Host has a replication problem (*if* they even are replicating this database across multiple servers).&#10;&#10;Recommended steps:&#10;Determine a way to schedule twice-a-day backups of database, keeping 2 weeks of backups, so that at most we’d only “lose�? 12 hours of data.&#10;Contact Expert Host to determine if they changed our database host, responded to a corrupt database, or took any other action that might have resulted in lost data.&#10;Re-enter tickets using information stored within the emails Tasha forwarded to us.&#10;</Data></Cell>
    <Cell ss:StyleID="s88"><Data ss:Type="String">Hourly-$35</Data></Cell>
    <Cell ss:StyleID="s87"><Data ss:Type="Number">78.75</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s82"><Data ss:Type="DateTime">2012-10-22T00:00:00.000</Data></Cell>
    <Cell ss:StyleID="s83"><Data ss:Type="Number">1</Data></Cell>
    <Cell ss:StyleID="s84"><Data ss:Type="String">Created the replacement tickets (461-463) with a note that references the number (and date created) of the original ticket. I wasn't able to look-up the correct phone numbers, so I substituted mine. Will continue to follow up with ExpertHost. Emailed customer.</Data></Cell>
    <Cell ss:StyleID="s73"><Data ss:Type="String">Hourly-$35</Data></Cell>
    <Cell ss:StyleID="s74"><Data ss:Type="Number">35</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:Index="4" ss:StyleID="s76"><Data ss:Type="String">Total</Data></Cell>
    <Cell ss:StyleID="s77" ss:Formula="=SUM(R[-5]C:R[-1]C)"><Data ss:Type="Number">148.75</Data></Cell>
   </Row>
  </Table>
  <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
   <PageSetup>
    <Layout x:CenterHorizontal="1"/>
    <PageMargins x:Bottom="0.5" x:Top="0.5"/>
   </PageSetup>
   <Print>
    <ValidPrinterInfo/>
    <HorizontalResolution>600</HorizontalResolution>
    <VerticalResolution>600</VerticalResolution>
   </Print>
   <DoNotDisplayGridlines/>
   <Panes>
    <Pane>
     <Number>3</Number>
     <ActiveRow>1</ActiveRow>
     <RangeSelection>R2</RangeSelection>
    </Pane>
   </Panes>
   <ProtectObjects>False</ProtectObjects>
   <ProtectScenarios>False</ProtectScenarios>
  </WorksheetOptions>
 </Worksheet>
 <Worksheet ss:Name="Project 1001.03">
  <Names>
   <NamedRange ss:Name="Print_Area" ss:RefersTo="='Project 1001.03'!R1C1:R3C5"/>
  </Names>
  <Table ss:ExpandedColumnCount="5" ss:ExpandedRowCount="8" x:FullColumns="1"
   x:FullRows="1" ss:StyleID="s79" ss:DefaultRowHeight="15">
   <Column ss:StyleID="s79" ss:Width="46.2"/>
   <Column ss:StyleID="s79" ss:AutoFitWidth="0" ss:Width="40.799999999999997"/>
   <Column ss:StyleID="s79" ss:AutoFitWidth="0" ss:Width="203.4"/>
   <Column ss:StyleID="s79" ss:Width="42.6"/>
   <Column ss:StyleID="s79" ss:AutoFitWidth="0" ss:Width="72"/>
   <Row ss:Height="17.399999999999999" ss:StyleID="s80">
    <Cell ss:StyleID="s90"><Data ss:Type="String">Project:</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s90"><Data ss:Type="String">NSAVC Cohort IV Training Module and Bios</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s81"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s81"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="9" ss:StyleID="s80">
    <Cell ss:MergeAcross="4" ss:StyleID="s106"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s69"><Data ss:Type="String">Date</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s70"><Data ss:Type="String">Hours</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s70"><Data ss:Type="String">Description</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s70"><Data ss:Type="String">Unit Price</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s71"><Data ss:Type="String">Line Total</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s82"><Data ss:Type="DateTime">2012-09-18T00:00:00.000</Data></Cell>
    <Cell ss:StyleID="s83"><Data ss:Type="Number">0.25</Data></Cell>
    <Cell ss:StyleID="s84"><Data ss:Type="String">Looking up relevant CSS file.</Data></Cell>
    <Cell ss:StyleID="s73"><Data ss:Type="String">Hourly-$35</Data></Cell>
    <Cell ss:StyleID="s74"><Data ss:Type="Number">8.75</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s85"><Data ss:Type="DateTime">2012-09-18T00:00:00.000</Data></Cell>
    <Cell ss:StyleID="s86"><Data ss:Type="Number">0.25</Data></Cell>
    <Cell ss:StyleID="s87"><Data ss:Type="String">Added margin-left:auto;margin-right:auto; to .main_content on css/service_request.css</Data></Cell>
    <Cell ss:StyleID="s88"><Data ss:Type="String">Hourly-$35</Data></Cell>
    <Cell ss:StyleID="s87"><Data ss:Type="Number">8.75</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s82"><Data ss:Type="DateTime">2012-09-18T00:00:00.000</Data></Cell>
    <Cell ss:StyleID="s83"><Data ss:Type="Number">0.5</Data></Cell>
    <Cell ss:StyleID="s84"><Data ss:Type="String">Determined that reset.css includes a css rule to set float: left; on label elements. Removing the float causes everything to center, which doesn't look right either.</Data></Cell>
    <Cell ss:StyleID="s73"><Data ss:Type="String">Hourly-$35</Data></Cell>
    <Cell ss:StyleID="s74"><Data ss:Type="Number">17.5</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s85"><Data ss:Type="DateTime">2012-10-19T00:00:00.000</Data></Cell>
    <Cell ss:StyleID="s86"><Data ss:Type="Number">2.25</Data></Cell>
    <Cell ss:StyleID="s87"><Data ss:Type="String">Researched issue, determined the following facts:&#10;•	The production database has no records entered between Oct 12 (Fri) and 17 (Wed). There have been other gaps of 4+ days in the system’s history (see attached).&#10;•	The current production database has the following attributes for tickets 443 and 444:&#10;requestor	date_received	description&#10;Ricks, Karen	10/17/2012 16:22	Project eClips need to be added to the FY12 list o...&#10;Ricks, Karen	10/17/2012 16:27	Project:  Comp.NASA Innovations in Climate Educati...&#10;&#10;•	The development database has not had an entry since early August; that last record was given tracking number 152. This rules out a production vs development database possibility.&#10;•	The Service Request source code has not been altered in weeks; this anomaly is not a result of a bug introduced into the code this week.&#10;&#10;Further thoughts:&#10;I considered the possibility Jessica had shared an edit link for ticket 443 with Bryan and Karen, but editing a ticket does not send out the announcement email (only ticket creation). Besides, Karen created tickets 443 and 444 within 5 minutes of each other, so I don’t think she was using a bad link.&#10;My suspicion remains that the database was restored from an old backup (that didn’t have tickets 443 and 444)&#45;-twice, or (less likely) Expert Host has a replication problem (*if* they even are replicating this database across multiple servers).&#10;&#10;Recommended steps:&#10;Determine a way to schedule twice-a-day backups of database, keeping 2 weeks of backups, so that at most we’d only “lose�? 12 hours of data.&#10;Contact Expert Host to determine if they changed our database host, responded to a corrupt database, or took any other action that might have resulted in lost data.&#10;Re-enter tickets using information stored within the emails Tasha forwarded to us.&#10;</Data></Cell>
    <Cell ss:StyleID="s88"><Data ss:Type="String">Hourly-$35</Data></Cell>
    <Cell ss:StyleID="s87"><Data ss:Type="Number">78.75</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:Index="4" ss:StyleID="s76"><Data ss:Type="String">Total</Data></Cell>
    <Cell ss:StyleID="s77" ss:Formula="=SUM(R[-4]C:R[-1]C)"><Data ss:Type="Number">113.75</Data></Cell>
   </Row>
  </Table>
  <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
   <PageSetup>
    <Layout x:CenterHorizontal="1"/>
    <PageMargins x:Bottom="0.5" x:Top="0.5"/>
   </PageSetup>
   <Unsynced/>
   <Print>
    <ValidPrinterInfo/>
    <HorizontalResolution>600</HorizontalResolution>
    <VerticalResolution>600</VerticalResolution>
   </Print>
   <DoNotDisplayGridlines/>
   <ProtectObjects>False</ProtectObjects>
   <ProtectScenarios>False</ProtectScenarios>
  </WorksheetOptions>
 </Worksheet>
</Workbook>
		<cfheader name="Content-Disposition" value="filename=Invoice_#replace(get_customer_invoice_details.customer_name, ' ', '_', 'All')#_#dateformat(now(), 'yyyy_mm_dd')#.xml">
	</cfsavecontent>
	<cfset variables.file_path=gettempfile(gettempdirectory(),"excel_")/>
	<cffile action="WRITE" file="#variables.file_path#" output="#variables.generate_invoice.trim()#"/>
	<cfcontent type="application/msexcel" file="#variables.file_path#" deletefile="true"/>
</cfif>

