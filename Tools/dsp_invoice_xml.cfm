
<!--Tools/dsp_invoice_xml.cfm
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
  <WindowHeight>10224</WindowHeight>
  <WindowWidth>11976</WindowWidth>
  <WindowTopX>11196</WindowTopX>
  <WindowTopY>24</WindowTopY>
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
  <Style ss:ID="s63">
   <Alignment ss:Horizontal="Right" ss:Vertical="Bottom"/>
   <Borders/>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="38"
    ss:Color="#808080" ss:Italic="1"/>
   <Interior/>
  </Style>
  <Style ss:ID="s64">
   <Interior/>
  </Style>
  <Style ss:ID="s65">
   <Alignment ss:Horizontal="Left" ss:Vertical="Bottom"/>
   <Borders/>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="12"
    ss:Color="#993366"/>
   <Interior/>
  </Style>
  <Style ss:ID="s66">
   <Alignment ss:Horizontal="Left" ss:Vertical="Bottom"/>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8"
    ss:Color="#993366"/>
   <Interior/>
  </Style>
  <Style ss:ID="s67">
   <Alignment ss:Horizontal="Left" ss:Vertical="Bottom"/>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8"
    ss:Color="#993366"/>
   <Interior/>
   <NumberFormat ss:Format="[ENG][$-409]mmmm\ d\,\ yyyy;@"/>
  </Style>
  <Style ss:ID="s68">
   <Font ss:FontName="Arial" x:Family="Swiss" ss:Color="#993366"/>
   <Interior/>
  </Style>
  <Style ss:ID="s69">
   <Alignment ss:Horizontal="Left" ss:Vertical="Bottom"/>
   <Borders/>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Color="#993366"/>
   <Interior/>
  </Style>
  <Style ss:ID="s70">
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8"
    ss:Color="#993366"/>
   <Interior/>
  </Style>
  <Style ss:ID="s71">
   <Alignment ss:Vertical="Top"/>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8"
    ss:Color="#993366"/>
   <Interior/>
  </Style>
  <Style ss:ID="s72">
   <Alignment ss:Horizontal="Left" ss:Vertical="Bottom"/>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8"
    ss:Color="#993366"/>
  </Style>
  <Style ss:ID="s74">
   <Alignment ss:Horizontal="Left" ss:Vertical="Bottom"/>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8"
    ss:Color="#993366" ss:Bold="1"/>
   <Interior/>
  </Style>
  <Style ss:ID="s75">
   <Alignment ss:Vertical="Bottom"/>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8"
    ss:Color="#993366"/>
   <Interior/>
  </Style>
  <Style ss:ID="s76">
   <Font ss:FontName="Arial" x:Family="Swiss" ss:Color="#993366"/>
  </Style>
  <Style ss:ID="s77">
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
  <Style ss:ID="s78">
   <Alignment ss:Horizontal="Left" ss:Vertical="Center"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"
     ss:Color="#D6DCE0"/>
   </Borders>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8"
    ss:Color="#993366" ss:Bold="1"/>
   <Interior ss:Color="#9DBEC3" ss:Pattern="Solid"/>
  </Style>
  <Style ss:ID="s79">
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
  <Style ss:ID="s80">
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
  <Style ss:ID="s81">
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
  <Style ss:ID="s82">
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
  <Style ss:ID="s83">
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
  <Style ss:ID="s84">
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
  <Style ss:ID="s85">
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
  <Style ss:ID="s87">
   <Alignment ss:Horizontal="Left" ss:Vertical="Center"/>
   <Borders/>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8"
    ss:Color="#993366"/>
   <Interior ss:Color="#FFFFFF" ss:Pattern="Solid"/>
   <NumberFormat/>
  </Style>
  <Style ss:ID="s88">
   <Alignment ss:Horizontal="Right" ss:Vertical="Center"/>
   <Borders/>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="12"
    ss:Color="#993366"/>
   <Interior ss:Color="#FFFFFF" ss:Pattern="Solid"/>
  </Style>
  <Style ss:ID="s89">
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
  <Style ss:ID="s91">
   <Alignment ss:Vertical="Bottom"/>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Color="#993366"/>
  </Style>
  <Style ss:ID="s93">
   <Alignment ss:Horizontal="Center" ss:Vertical="Center" ss:WrapText="1"/>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="14"
    ss:Color="#000000"/>
  </Style>
  <Style ss:ID="s94">
   <Alignment ss:Vertical="Center"/>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman"/>
  </Style>
  <Style ss:ID="s96">
   <Alignment ss:Horizontal="Center" ss:Vertical="Center"/>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8"
    ss:Color="#993366"/>
  </Style>
  <Style ss:ID="s97">
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Color="#993366"/>
  </Style>
  <Style ss:ID="s98">
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8"
    ss:Color="#993366"/>
  </Style>
  <Style ss:ID="s99">
   <Alignment ss:Horizontal="Left" ss:Vertical="Bottom"/>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="12"
    ss:Color="#993366" ss:Bold="1"/>
  </Style>
  <Style ss:ID="s100">
   <Alignment ss:Vertical="Top"/>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8"
    ss:Color="#993366"/>
  </Style>
  <Style ss:ID="s102">
   <Alignment ss:Vertical="Bottom"/>
   <Borders/>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8"
    ss:Color="#993366"/>
  </Style>
  <Style ss:ID="s103">
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
  <Style ss:ID="s104">
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
  <Style ss:ID="s105">
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
  <Style ss:ID="s106">
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
  <Style ss:ID="s107">
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Color="#FFFFFF"/>
  </Style>
  <Style ss:ID="s108">
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
  <Style ss:ID="s109">
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
  <Style ss:ID="s110">
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
  <Style ss:ID="s111">
   <Alignment ss:Horizontal="Right" ss:Vertical="Center"/>
   <Borders/>
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8"
    ss:Color="#993366"/>
   <Interior ss:Color="#FFFFFF" ss:Pattern="Solid"/>
  </Style>
  <Style ss:ID="s112">
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
  <Style ss:ID="s114">
   <Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Color="#FFFFFF"/>
  </Style>
 </Styles>
 <Worksheet ss:Name="Invoice Overview">
  <Table ss:ExpandedColumnCount="7" ss:ExpandedRowCount="23" x:FullColumns="1"
   x:FullRows="1" ss:DefaultRowHeight="13.2">
   <Column ss:Index="2" ss:Width="99"/>
   <Column ss:Width="150"/>
   <Column ss:Width="54.599999999999994"/>
   <Column ss:AutoFitWidth="0" ss:Width="78"/>
   <Row ss:AutoFitHeight="0" ss:Height="56.25">
    <Cell ss:MergeAcross="4" ss:StyleID="s63"><Data ss:Type="String">Invoice</Data></Cell>
    <Cell ss:StyleID="s64"/>
    <Cell ss:StyleID="s64"/>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="9">
    <Cell ss:StyleID="s65"/>
    <Cell ss:StyleID="s65"/>
    <Cell ss:StyleID="s65"/>
    <Cell ss:StyleID="s66"/>
    <Cell ss:StyleID="s67"/>
    <Cell ss:StyleID="s68"/>
    <Cell ss:StyleID="s68"/>
   </Row>
<cfoutput>
   <Row ss:AutoFitHeight="0" ss:Height="18">
    <Cell ss:StyleID="s65"><Data ss:Type="String">Applied Internet Technologies</Data></Cell>
    <Cell ss:StyleID="s65"/>
    <Cell ss:StyleID="s65"/>
    <Cell ss:StyleID="s66"><Data ss:Type="String">Date:</Data></Cell>
    <Cell ss:StyleID="s67"><Data ss:Type="DateTime">#dateformat(now(), 'yyyy-mm-dd')#T00:00:00.000</Data></Cell>
    <Cell ss:StyleID="s68"/>
    <Cell ss:StyleID="s68"/>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="15">
    <Cell ss:StyleID="s69"><Data ss:Type="String">Jeromy French</Data></Cell>
    <Cell ss:StyleID="s69"/>
    <Cell ss:StyleID="s69"/>
    <Cell ss:StyleID="s66"><Data ss:Type="String">Invoice ##:</Data></Cell>
    <Cell ss:StyleID="s66"><Data ss:Type="Number">#act_generate_invoice.invoice_id#</Data></Cell>
    <Cell ss:StyleID="s68"/>
    <Cell ss:StyleID="s68"/>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="18">
    <Cell ss:StyleID="s65"/>
    <Cell ss:StyleID="s65"/>
    <Cell ss:StyleID="s65"/>
    <Cell ss:StyleID="s66"><Data ss:Type="String">Customer ID:</Data></Cell>
    <Cell ss:StyleID="s66"><Data ss:Type="Number">#get_customer_invoice_details.root_code#</Data></Cell>
    <Cell ss:StyleID="s68"/>
    <Cell ss:StyleID="s68"/>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="9">
    <Cell ss:StyleID="s70"/>
    <Cell ss:StyleID="s70"/>
    <Cell ss:StyleID="s70"/>
    <Cell ss:StyleID="s70"/>
    <Cell ss:StyleID="s71"/>
    <Cell ss:StyleID="s68"/>
    <Cell ss:StyleID="s68"/>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="15">
    <Cell ss:StyleID="s66"><Data ss:Type="String">To:</Data></Cell>
    <Cell ss:MergeAcross="1" ss:StyleID="s72"><Data ss:Type="String">#get_customer_invoice_details.first_name# #get_customer_invoice_details.last_name#</Data></Cell>
    <Cell ss:StyleID="s71"/>
    <Cell ss:StyleID="s71"/>
    <Cell ss:StyleID="s68"/>
    <Cell ss:StyleID="s68"/>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="15">
    <Cell ss:StyleID="s74"/>
    <Cell ss:MergeAcross="1" ss:StyleID="s72"><Data ss:Type="String">#get_customer_invoice_details.customer_name#</Data></Cell>
    <Cell ss:StyleID="s71"/>
    <Cell ss:StyleID="s71"/>
    <Cell ss:StyleID="s68"/>
    <Cell ss:StyleID="s68"/>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="15">
    <Cell ss:StyleID="s75"/>
    <Cell ss:StyleID="s72"><Data ss:Type="String">#get_customer_invoice_details.company_address1#<cfif len(get_customer_invoice_details.company_address2)>, #get_customer_invoice_details.company_address2#</cfif></Data></Cell>
    <Cell ss:StyleID="s72"/>
    <Cell ss:StyleID="s71"/>
    <Cell ss:StyleID="s71"/>
    <Cell ss:StyleID="s68"/>
    <Cell ss:StyleID="s68"/>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="15">
    <Cell ss:StyleID="s75"/>
    <Cell ss:StyleID="s72"><Data ss:Type="String">#get_customer_invoice_details.company_city#, #get_customer_invoice_details.company_state# #get_customer_invoice_details.company_zip#</Data></Cell>
    <Cell ss:StyleID="s72"/>
    <Cell ss:StyleID="s71"/>
    <Cell ss:StyleID="s76"/>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="15">
    <Cell ss:StyleID="s75"/>
    <Cell ss:StyleID="s72"><Data ss:Type="String">#get_customer_invoice_details.work_phone#</Data></Cell>
    <Cell ss:StyleID="s72"/>
    <Cell ss:StyleID="s71"/>
    <Cell ss:StyleID="s71"/>
    <Cell ss:StyleID="s68"/>
    <Cell ss:StyleID="s68"/>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="9">
    <Cell ss:StyleID="s76"/>
    <Cell ss:StyleID="s76"/>
    <Cell ss:StyleID="s76"/>
    <Cell ss:StyleID="s76"/>
    <Cell ss:StyleID="s76"/>
    <Cell ss:StyleID="s76"/>
    <Cell ss:StyleID="s76"/>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="13.5">
    <Cell ss:StyleID="s76"/>
    <Cell ss:StyleID="s77"><Data ss:Type="String">Project</Data></Cell>
    <Cell ss:StyleID="s78"><Data ss:Type="String">Description</Data></Cell>
    <Cell ss:StyleID="s79"><Data ss:Type="String">Line Total</Data></Cell>
    <Cell ss:StyleID="s76"/>
    <Cell ss:StyleID="s76"/>
    <Cell ss:StyleID="s76"/>
   </Row>
<cfloop query="get_invoice_project_summary">
   <Row ss:AutoFitHeight="0" ss:Height="13.5">
    <Cell ss:StyleID="s76"/>
    <Cell ss:StyleID="s80"><Data ss:Type="String">#project_code#</Data></Cell>
    <Cell ss:StyleID="s81"><Data ss:Type="String">#project_name#</Data></Cell>
    <Cell ss:StyleID="s82" ss:Formula="='Project #project_code#'!R[#entry_count+4-(13+get_invoice_project_summary.currentrow)#]C[1]"><Data
      ss:Type="Number">1000000</Data></Cell>
    <Cell ss:StyleID="s76"/>
    <Cell ss:StyleID="s76"/>
    <Cell ss:StyleID="s76"/>
   </Row>
</cfloop>
   <Row ss:AutoFitHeight="0" ss:Height="18">
    <Cell ss:StyleID="s76"/>
    <Cell ss:StyleID="s87"/>
    <Cell ss:StyleID="s88"><Data ss:Type="String">Total</Data></Cell>
    <Cell ss:StyleID="s89" ss:Formula="=SUM(R[-#get_invoice_project_summary.recordcount#]C:R[-1]C)"><Data ss:Type="Number">1000000</Data></Cell>
    <Cell ss:StyleID="s76"/>
    <Cell ss:StyleID="s76"/>
    <Cell ss:StyleID="s76"/>
   </Row>
</cfoutput>
   <Row ss:AutoFitHeight="0" ss:Height="9">
    <Cell ss:MergeAcross="4" ss:StyleID="s91"/>
    <Cell ss:StyleID="s76"/>
    <Cell ss:StyleID="s76"/>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:MergeAcross="4" ss:MergeDown="1" ss:StyleID="s93"><ss:Data
      ss:Type="String" xmlns="http://www.w3.org/TR/REC-html40"><Font
       html:Color="#000000">Payment due upon receipt, please make all checks payable to Applied Internet Technologies</Font><Font
       html:Size="10" html:Color="#808080">&#10;Thank you for your business!</Font></ss:Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="39.450000000000003"/>
   <Row ss:AutoFitHeight="0" ss:Height="9">
    <Cell ss:StyleID="s94"/>
    <Cell ss:StyleID="s94"/>
    <Cell ss:StyleID="s94"/>
    <Cell ss:StyleID="s94"/>
    <Cell ss:StyleID="s94"/>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="13.5">
    <Cell ss:MergeAcross="4" ss:StyleID="s96"><Data ss:Type="String">2809 Marshall Street, Falls Church, VA 22042  703.850.6391 jeromy_french@hotmail.com</Data></Cell>
    <Cell ss:StyleID="s76"/>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s76"/>
    <Cell ss:StyleID="s76"/>
    <Cell ss:StyleID="s76"/>
    <Cell ss:StyleID="s76"/>
    <Cell ss:StyleID="s76"/>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s76"/>
    <Cell ss:StyleID="s76"/>
    <Cell ss:StyleID="s76"/>
    <Cell ss:StyleID="s76"/>
    <Cell ss:StyleID="s76"/>
   </Row>
  </Table>
  <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
   <PageSetup>
    <Header x:Margin="0.3"/>
    <Footer x:Margin="0.3"/>
    <PageMargins x:Bottom="0.75" x:Left="0.7" x:Right="0.7" x:Top="0.75"/>
   </PageSetup>
   <Unsynced/>
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
<cfoutput query="get_invoice_project_summary">
 <Worksheet ss:Name="Project #project_code#">
  <Names>
   <NamedRange ss:Name="Print_Area" ss:RefersTo="='Project #project_code#'!R1C1:R3C5"/>
  </Names>
  <Table ss:ExpandedColumnCount="6" ss:ExpandedRowCount="5" x:FullColumns="1"
   x:FullRows="1" ss:StyleID="s97" ss:DefaultRowHeight="15">
   <Column ss:StyleID="s97" ss:Width="46.2"/>
   <Column ss:StyleID="s97" ss:AutoFitWidth="0" ss:Width="40.799999999999997"/>
   <Column ss:StyleID="s97" ss:AutoFitWidth="0" ss:Width="412.8"/>
   <Column ss:StyleID="s97" ss:Width="45.599999999999994"/>
   <Column ss:StyleID="s97" ss:AutoFitWidth="0" ss:Width="41.4"/>
   <Row ss:AutoFitHeight="0" ss:Height="17.55" ss:StyleID="s98">
    <Cell ss:StyleID="s99"><Data ss:Type="String">Project:</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s99"><Data ss:Type="String">#project_name#</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s100"><NamedCell ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s100"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="9" ss:StyleID="s98">
    <Cell ss:MergeAcross="4" ss:StyleID="s102"><NamedCell ss:Name="Print_Area"/></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s77"><Data ss:Type="String">Date</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s78"><Data ss:Type="String">Hours</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s78"><Data ss:Type="String">Description</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s78"><Data ss:Type="String">Unit Price</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s79"><Data ss:Type="String">Line Total</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
   </Row>
	<cfquery dbtype="query" name="get_invoice_project_details">
	SELECT time_entry_id, performed_date, hours,
			rate, revenue, note
	FROM act_generate_invoice
	WHERE project_id=#get_invoice_project_summary.project_id#
	</cfquery>
<cfloop query="get_invoice_project_details">
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s103"><Data ss:Type="DateTime">#dateformat(performed_date, 'yyyy-mm-dd')#T00:00:00.000</Data></Cell>
    <Cell ss:StyleID="s104"><Data ss:Type="Number">#hours#</Data></Cell>
    <Cell ss:StyleID="s105"><Data ss:Type="String">#note#</Data></Cell>
    <Cell ss:StyleID="s81"><Data ss:Type="String">#rate#</Data></Cell>
    <Cell ss:StyleID="s106"><Data ss:Type="Number">#revenue#</Data></Cell>
    <Cell ss:StyleID="s107"><Data ss:Type="Number">#time_entry_id#</Data></Cell>
   </Row>
</cfloop>
   <Row ss:AutoFitHeight="0">
    <Cell ss:Index="4" ss:StyleID="s111"><Data ss:Type="String">Total</Data></Cell>
    <Cell ss:StyleID="s112" ss:Formula="=SUM(R[-#entry_count#]C:R[-1]C)"><Data ss:Type="Number">10000000</Data></Cell>
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
</cfoutput>
</Workbook>