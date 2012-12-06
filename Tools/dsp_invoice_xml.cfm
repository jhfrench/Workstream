<cfsilent>
<!--Tools/dsp_invoice_xml.cfm
	Author: Jeromy F -->
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
  <Created>2006-01-23T19:37:33Z</Created>
  <LastSaved>2012-12-05T19:48:54Z</LastSaved>
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
   <Row ss:AutoFitHeight="0" ss:Height="18">
    <Cell ss:StyleID="s65"><Data ss:Type="String">Applied Internet Technologies</Data></Cell>
    <Cell ss:StyleID="s65"/>
    <Cell ss:StyleID="s65"/>
    <Cell ss:StyleID="s66"><Data ss:Type="String">Date:</Data></Cell>
    <Cell ss:StyleID="s67"><Data ss:Type="DateTime">2012-10-31T00:00:00.000</Data></Cell>
    <Cell ss:StyleID="s68"/>
    <Cell ss:StyleID="s68"/>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="15">
    <Cell ss:StyleID="s69"><Data ss:Type="String">Jeromy French</Data></Cell>
    <Cell ss:StyleID="s69"/>
    <Cell ss:StyleID="s69"/>
    <Cell ss:StyleID="s66"><Data ss:Type="String">Invoice #:</Data></Cell>
    <Cell ss:StyleID="s66"><Data ss:Type="Number">12</Data></Cell>
    <Cell ss:StyleID="s68"/>
    <Cell ss:StyleID="s68"/>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="18">
    <Cell ss:StyleID="s65"/>
    <Cell ss:StyleID="s65"/>
    <Cell ss:StyleID="s65"/>
    <Cell ss:StyleID="s66"><Data ss:Type="String">Customer ID:</Data></Cell>
    <Cell ss:StyleID="s66"><Data ss:Type="Number">1001</Data></Cell>
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
    <Cell ss:MergeAcross="1" ss:StyleID="s72"><Data ss:Type="String">Leo Geiger</Data></Cell>
    <Cell ss:StyleID="s71"/>
    <Cell ss:StyleID="s71"/>
    <Cell ss:StyleID="s68"/>
    <Cell ss:StyleID="s68"/>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="15">
    <Cell ss:StyleID="s74"/>
    <Cell ss:MergeAcross="1" ss:StyleID="s72"><Data ss:Type="String">International Code Design, Inc.</Data></Cell>
    <Cell ss:StyleID="s71"/>
    <Cell ss:StyleID="s71"/>
    <Cell ss:StyleID="s68"/>
    <Cell ss:StyleID="s68"/>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="15">
    <Cell ss:StyleID="s75"/>
    <Cell ss:StyleID="s72"><Data ss:Type="String">6411 Ivy Lane, Suite 305</Data></Cell>
    <Cell ss:StyleID="s72"/>
    <Cell ss:StyleID="s71"/>
    <Cell ss:StyleID="s71"/>
    <Cell ss:StyleID="s68"/>
    <Cell ss:StyleID="s68"/>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="15">
    <Cell ss:StyleID="s75"/>
    <Cell ss:StyleID="s72"><Data ss:Type="String">Greenbelt, MD 20770</Data></Cell>
    <Cell ss:StyleID="s72"/>
    <Cell ss:StyleID="s71"/>
    <Cell ss:StyleID="s76"/>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="15">
    <Cell ss:StyleID="s75"/>
    <Cell ss:StyleID="s72"><Data ss:Type="String">301.441.4917</Data></Cell>
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
   <Row ss:AutoFitHeight="0" ss:Height="13.5">
    <Cell ss:StyleID="s76"/>
    <Cell ss:StyleID="s80"><Data ss:Type="String">1001.01</Data></Cell>
    <Cell ss:StyleID="s81"><Data ss:Type="String">eAuth mura</Data></Cell>
    <Cell ss:StyleID="s82" ss:Formula="='Project 1001.01'!R[-9]C[1]"><Data
      ss:Type="Number">8.75</Data></Cell>
    <Cell ss:StyleID="s76"/>
    <Cell ss:StyleID="s76"/>
    <Cell ss:StyleID="s76"/>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="13.5">
    <Cell ss:StyleID="s76"/>
    <Cell ss:StyleID="s83"><Data ss:Type="String">1001.02</Data></Cell>
    <Cell ss:StyleID="s84" ss:Formula="='Project 1001.02'!R[-14]C[-1]"><Data
      ss:Type="String">Service Request Module</Data></Cell>
    <Cell ss:StyleID="s85" ss:Formula="='Project 1001.02'!R[26]C[1]"><Data
      ss:Type="Number">971.25</Data></Cell>
    <Cell ss:StyleID="s76"/>
    <Cell ss:StyleID="s76"/>
    <Cell ss:StyleID="s76"/>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="18">
    <Cell ss:StyleID="s76"/>
    <Cell ss:StyleID="s87"/>
    <Cell ss:StyleID="s88"><Data ss:Type="String">Total</Data></Cell>
    <Cell ss:StyleID="s89" ss:Formula="=SUM(R[-2]C:R[-1]C)"><Data ss:Type="Number">980</Data></Cell>
    <Cell ss:StyleID="s76"/>
    <Cell ss:StyleID="s76"/>
    <Cell ss:StyleID="s76"/>
   </Row>
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
 <Worksheet ss:Name="Project 1001.01">
  <Names>
   <NamedRange ss:Name="Print_Area" ss:RefersTo="='Project 1001.01'!R1C1:R3C5"/>
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
    <Cell ss:StyleID="s99"><Data ss:Type="String">eAuth mura</Data><NamedCell
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
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s103"><Data ss:Type="DateTime">2012-11-19T00:00:00.000</Data></Cell>
    <Cell ss:StyleID="s104"><Data ss:Type="Number">0.25</Data></Cell>
    <Cell ss:StyleID="s105"><Data ss:Type="String">No further word on this project; closing task as done.</Data></Cell>
    <Cell ss:StyleID="s81"><Data ss:Type="String">Hourly-$35</Data></Cell>
    <Cell ss:StyleID="s106"><Data ss:Type="Number">8.75</Data></Cell>
    <Cell ss:StyleID="s107"><Data ss:Type="Number">554</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:Index="4" ss:StyleID="s111"><Data ss:Type="String">Total</Data></Cell>
    <Cell ss:StyleID="s112" ss:Formula="=SUM(R[-1]C:R[-1]C)"><Data ss:Type="Number">8.75</Data></Cell>
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
 <Worksheet ss:Name="Project 1001.02">
  <Names>
   <NamedRange ss:Name="Print_Area" ss:RefersTo="='Project 1001.02'!R1C1:R4C5"/>
  </Names>
  <Table ss:ExpandedColumnCount="6" ss:ExpandedRowCount="41" x:FullColumns="1"
   x:FullRows="1" ss:StyleID="s97" ss:DefaultRowHeight="15">
   <Column ss:StyleID="s97" ss:Width="46.2"/>
   <Column ss:StyleID="s97" ss:AutoFitWidth="0" ss:Width="40.799999999999997"/>
   <Column ss:StyleID="s97" ss:AutoFitWidth="0" ss:Width="412.8"/>
   <Column ss:StyleID="s97" ss:AutoFitWidth="0" ss:Width="45.599999999999994"/>
   <Column ss:StyleID="s97" ss:Width="41.4"/>
   <Row ss:AutoFitHeight="0" ss:Height="17.55" ss:StyleID="s98">
    <Cell ss:StyleID="s99"><Data ss:Type="String">Project:</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s99"><Data ss:Type="String">Service Request Module</Data><NamedCell
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
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s103"><Data ss:Type="DateTime">2012-11-08T00:00:00.000</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s104"><Data ss:Type="Number">0.25</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s105"><Data ss:Type="String">Discovered scrunched image on Service Request. Documenting need to fix.</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s81"><Data ss:Type="String">Hourly-$35</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s106"><Data ss:Type="Number">8.75</Data><NamedCell
      ss:Name="Print_Area"/></Cell>
    <Cell ss:StyleID="s114"><Data ss:Type="Number">519</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s108"><Data ss:Type="DateTime">2012-11-08T00:00:00.000</Data></Cell>
    <Cell ss:StyleID="s109"><Data ss:Type="Number">0.5</Data></Cell>
    <Cell ss:StyleID="s110"><Data ss:Type="String">Importing SVN history into local Git copy of Service Request code so I can work remotely and still have the benefit of version control.</Data></Cell>
    <Cell ss:StyleID="s84"><Data ss:Type="String">Hourly-$35</Data></Cell>
    <Cell ss:StyleID="s110"><Data ss:Type="Number">17.5</Data></Cell>
    <Cell ss:StyleID="s114"><Data ss:Type="Number">520</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s103"><Data ss:Type="DateTime">2012-11-08T00:00:00.000</Data></Cell>
    <Cell ss:StyleID="s104"><Data ss:Type="Number">0.5</Data></Cell>
    <Cell ss:StyleID="s105"><Data ss:Type="String">Corrected, moved into development. Emailed James to have him take a look and approve for prod. Also pointed out that items in blue nav bar are different between service request and OSSI.</Data></Cell>
    <Cell ss:StyleID="s81"><Data ss:Type="String">Hourly-$35</Data></Cell>
    <Cell ss:StyleID="s106"><Data ss:Type="Number">17.5</Data></Cell>
    <Cell ss:StyleID="s114"><Data ss:Type="Number">521</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s108"><Data ss:Type="DateTime">2012-11-09T00:00:00.000</Data></Cell>
    <Cell ss:StyleID="s109"><Data ss:Type="Number">0.25</Data></Cell>
    <Cell ss:StyleID="s110"><Data ss:Type="String">James replied that he was aware and was making a list of things to fix in Service Request.</Data></Cell>
    <Cell ss:StyleID="s84"><Data ss:Type="String">Hourly-$35</Data></Cell>
    <Cell ss:StyleID="s110"><Data ss:Type="Number">8.75</Data></Cell>
    <Cell ss:StyleID="s114"><Data ss:Type="Number">527</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s103"><Data ss:Type="DateTime">2012-11-15T00:00:00.000</Data></Cell>
    <Cell ss:StyleID="s104"><Data ss:Type="Number">0.25</Data></Cell>
    <Cell ss:StyleID="s105"><Data ss:Type="String">James has some enhancements and bug fixes he wants to email to me today. I will send him an email of outstanding service-request tasks so he can compare to his list.</Data></Cell>
    <Cell ss:StyleID="s81"><Data ss:Type="String">Hourly-$35</Data></Cell>
    <Cell ss:StyleID="s106"><Data ss:Type="Number">8.75</Data></Cell>
    <Cell ss:StyleID="s114"><Data ss:Type="Number">533</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s108"><Data ss:Type="DateTime">2012-11-15T00:00:00.000</Data></Cell>
    <Cell ss:StyleID="s109"><Data ss:Type="Number">0.5</Data></Cell>
    <Cell ss:StyleID="s110"><Data ss:Type="String">Emailed list of outstanding Service Request and NSAVC Entry tasks to James.</Data></Cell>
    <Cell ss:StyleID="s84"><Data ss:Type="String">Hourly-$35</Data></Cell>
    <Cell ss:StyleID="s110"><Data ss:Type="Number">17.5</Data></Cell>
    <Cell ss:StyleID="s114"><Data ss:Type="Number">535</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s103"><Data ss:Type="DateTime">2012-11-19T00:00:00.000</Data></Cell>
    <Cell ss:StyleID="s104"><Data ss:Type="Number">0.25</Data></Cell>
    <Cell ss:StyleID="s105"><Data ss:Type="String">Need more detail...which pages error? Might want to table this task until error-handling is in-place, because then I'll be able to have a record of each error and would be able to more easily diagnose and correct.</Data></Cell>
    <Cell ss:StyleID="s81"><Data ss:Type="String">Hourly-$35</Data></Cell>
    <Cell ss:StyleID="s106"><Data ss:Type="Number">8.75</Data></Cell>
    <Cell ss:StyleID="s114"><Data ss:Type="Number">543</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s108"><Data ss:Type="DateTime">2012-11-19T00:00:00.000</Data></Cell>
    <Cell ss:StyleID="s109"><Data ss:Type="Number">0.25</Data></Cell>
    <Cell ss:StyleID="s110"><Data ss:Type="String">Need more detail: which link? Is the user already logged-in when they click on the link?</Data></Cell>
    <Cell ss:StyleID="s84"><Data ss:Type="String">Hourly-$35</Data></Cell>
    <Cell ss:StyleID="s110"><Data ss:Type="Number">8.75</Data></Cell>
    <Cell ss:StyleID="s114"><Data ss:Type="Number">544</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s103"><Data ss:Type="DateTime">2012-11-19T00:00:00.000</Data></Cell>
    <Cell ss:StyleID="s104"><Data ss:Type="Number">0.5</Data></Cell>
    <Cell ss:StyleID="s105"><Data ss:Type="String">Created tasks for new items in James's 11/18 email.</Data></Cell>
    <Cell ss:StyleID="s81"><Data ss:Type="String">Hourly-$35</Data></Cell>
    <Cell ss:StyleID="s106"><Data ss:Type="Number">17.5</Data></Cell>
    <Cell ss:StyleID="s114"><Data ss:Type="Number">545</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s108"><Data ss:Type="DateTime">2012-11-19T00:00:00.000</Data></Cell>
    <Cell ss:StyleID="s109"><Data ss:Type="Number">0.25</Data></Cell>
    <Cell ss:StyleID="s110"><Data ss:Type="String">Sent LOE via email to James and Leo so they can review and prioritize work.</Data></Cell>
    <Cell ss:StyleID="s84"><Data ss:Type="String">Hourly-$35</Data></Cell>
    <Cell ss:StyleID="s110"><Data ss:Type="Number">8.75</Data></Cell>
    <Cell ss:StyleID="s114"><Data ss:Type="Number">547</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s103"><Data ss:Type="DateTime">2012-11-19T00:00:00.000</Data></Cell>
    <Cell ss:StyleID="s104"><Data ss:Type="Number">0.5</Data></Cell>
    <Cell ss:StyleID="s105"><Data ss:Type="String">Adding James (jchi) to Workstream. Initial password is A1*7758A39ED6C9C3CBEC08AE5A</Data></Cell>
    <Cell ss:StyleID="s81"><Data ss:Type="String">Hourly-$35</Data></Cell>
    <Cell ss:StyleID="s106"><Data ss:Type="Number">17.5</Data></Cell>
    <Cell ss:StyleID="s114"><Data ss:Type="Number">551</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s108"><Data ss:Type="DateTime">2012-11-19T00:00:00.000</Data></Cell>
    <Cell ss:StyleID="s109"><Data ss:Type="Number">0.5</Data></Cell>
    <Cell ss:StyleID="s110"><Data ss:Type="String">Adjusted jchi Workstream access.</Data></Cell>
    <Cell ss:StyleID="s84"><Data ss:Type="String">Hourly-$35</Data></Cell>
    <Cell ss:StyleID="s110"><Data ss:Type="Number">17.5</Data></Cell>
    <Cell ss:StyleID="s114"><Data ss:Type="Number">552</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s103"><Data ss:Type="DateTime">2012-11-19T00:00:00.000</Data></Cell>
    <Cell ss:StyleID="s104"><Data ss:Type="Number">0.25</Data></Cell>
    <Cell ss:StyleID="s105"><Data ss:Type="String">Determined that correct link is &amp;quot;http://www.i-codedesign.com/service_request/index.cfm?hash_id=%23%29%3C&amp;quot;. Error-handling is developed in test; once it's in production we'll be able to see these errors and respond to them with the benefit of thorough diagnostics information. </Data></Cell>
    <Cell ss:StyleID="s81"><Data ss:Type="String">Hourly-$35</Data></Cell>
    <Cell ss:StyleID="s106"><Data ss:Type="Number">8.75</Data></Cell>
    <Cell ss:StyleID="s114"><Data ss:Type="Number">555</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s108"><Data ss:Type="DateTime">2012-11-19T00:00:00.000</Data></Cell>
    <Cell ss:StyleID="s109"><Data ss:Type="Number">4.25</Data></Cell>
    <Cell ss:StyleID="s110"><Data ss:Type="String">Created Error_Log.installation_id default of 0. Updated datasource for Error_Log inserts. Adjusted styling of display pages. Created test page at http://www.i-codedesign.com/service_request_development/test_page.cfm. Need to check if &quot;AIT&quot; references should be replaced by &quot;ICD&quot; references. This is ready for James to test.</Data></Cell>
    <Cell ss:StyleID="s84"><Data ss:Type="String">Hourly-$35</Data></Cell>
    <Cell ss:StyleID="s110"><Data ss:Type="Number">148.75</Data></Cell>
    <Cell ss:StyleID="s114"><Data ss:Type="Number">614</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s103"><Data ss:Type="DateTime">2012-11-19T00:00:00.000</Data></Cell>
    <Cell ss:StyleID="s104"><Data ss:Type="Number">2.25</Data></Cell>
    <Cell ss:StyleID="s105"><Data ss:Type="String">Defining additional variables used by error-handling.</Data></Cell>
    <Cell ss:StyleID="s81"><Data ss:Type="String">Hourly-$35</Data></Cell>
    <Cell ss:StyleID="s106"><Data ss:Type="Number">78.75</Data></Cell>
    <Cell ss:StyleID="s114"><Data ss:Type="Number">615</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s108"><Data ss:Type="DateTime">2012-11-19T00:00:00.000</Data></Cell>
    <Cell ss:StyleID="s109"><Data ss:Type="Number">3</Data></Cell>
    <Cell ss:StyleID="s110"><Data ss:Type="String">Added diagnostics viewer (http://www.i-codedesign.com/service_request_development/dsp_view_error_diagnostics.cfm)</Data></Cell>
    <Cell ss:StyleID="s84"><Data ss:Type="String">Hourly-$35</Data></Cell>
    <Cell ss:StyleID="s110"><Data ss:Type="Number">105</Data></Cell>
    <Cell ss:StyleID="s114"><Data ss:Type="Number">618</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s103"><Data ss:Type="DateTime">2012-11-21T00:00:00.000</Data></Cell>
    <Cell ss:StyleID="s104"><Data ss:Type="Number">0.25</Data></Cell>
    <Cell ss:StyleID="s105"><Data ss:Type="String">Asked for steps to reproduce.</Data></Cell>
    <Cell ss:StyleID="s81"><Data ss:Type="String">Hourly-$35</Data></Cell>
    <Cell ss:StyleID="s106"><Data ss:Type="Number">8.75</Data></Cell>
    <Cell ss:StyleID="s114"><Data ss:Type="Number">560</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s108"><Data ss:Type="DateTime">2012-11-21T00:00:00.000</Data></Cell>
    <Cell ss:StyleID="s109"><Data ss:Type="Number">1</Data></Cell>
    <Cell ss:StyleID="s110"><Data ss:Type="String">Added variable after hash_id in URL so that if the URL gets corrupted by an email program the useful parts of the link won't be damaged. Moved code to Service Request development area.</Data></Cell>
    <Cell ss:StyleID="s84"><Data ss:Type="String">Hourly-$35</Data></Cell>
    <Cell ss:StyleID="s110"><Data ss:Type="Number">35</Data></Cell>
    <Cell ss:StyleID="s114"><Data ss:Type="Number">561</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s103"><Data ss:Type="DateTime">2012-11-21T00:00:00.000</Data></Cell>
    <Cell ss:StyleID="s104"><Data ss:Type="Number">0.25</Data></Cell>
    <Cell ss:StyleID="s105"><Data ss:Type="String">Emailed James to see if he thinks we should replace pagination with table scrolling powered by javasript (see example at http://jsfiddle.net/jhfrench/eNP2N/)</Data></Cell>
    <Cell ss:StyleID="s81"><Data ss:Type="String">Hourly-$35</Data></Cell>
    <Cell ss:StyleID="s106"><Data ss:Type="Number">8.75</Data></Cell>
    <Cell ss:StyleID="s114"><Data ss:Type="Number">562</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s108"><Data ss:Type="DateTime">2012-11-21T00:00:00.000</Data></Cell>
    <Cell ss:StyleID="s109"><Data ss:Type="Number">0.25</Data></Cell>
    <Cell ss:StyleID="s110"><Data ss:Type="String">For the SPAM prevention&#45;-instead of spending time and money to install captcha on the server, I recommend a much lower-tech and cheaper solution:&#13;&#10;&#13;&#10;Prove you're human! 1 + 4 = [input field]&#13;&#10;The first two numbers would be randomly generated (something between 0 and 9) and the answer would be checked on server-side. Dead simple to code, easier to read/use for the user (I think my personal success rate with captcha phrases is probably 60%).</Data></Cell>
    <Cell ss:StyleID="s84"><Data ss:Type="String">Hourly-$35</Data></Cell>
    <Cell ss:StyleID="s110"><Data ss:Type="Number">8.75</Data></Cell>
    <Cell ss:StyleID="s114"><Data ss:Type="Number">564</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s103"><Data ss:Type="DateTime">2012-11-21T00:00:00.000</Data></Cell>
    <Cell ss:StyleID="s104"><Data ss:Type="Number">0.25</Data></Cell>
    <Cell ss:StyleID="s105"><Data ss:Type="String">I think they're talking about this one: http://www.i-codedesign.com/service_request/index.cfm?idnew_table=468&#13;&#10;The request came through with a bad phone number, but the phone field is not editable.&#13;&#10;&#13;&#10;We can handle in a couple of ways:&#13;&#10;1. Make the field editable if it's entered incorrectly (using javascript)&#13;&#10;2. Remove from validation routine any fields that the user can't alter&#13;&#10;3. Prevent these bad submissions from coming through by adding spam trapping&#13;&#10;4. Prevent these bad submissions from coming through by applying server-side validation (which can't be defeated by turning off javascript)&#13;&#10;&#13;&#10;I recommend a combination of options 1, 3 and 4 because it covers all the injection scenarios pretty nicely.</Data></Cell>
    <Cell ss:StyleID="s81"><Data ss:Type="String">Hourly-$35</Data></Cell>
    <Cell ss:StyleID="s106"><Data ss:Type="Number">8.75</Data></Cell>
    <Cell ss:StyleID="s114"><Data ss:Type="Number">565</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s108"><Data ss:Type="DateTime">2012-11-21T00:00:00.000</Data></Cell>
    <Cell ss:StyleID="s109"><Data ss:Type="Number">0.25</Data></Cell>
    <Cell ss:StyleID="s110"><Data ss:Type="String">James indicates in 11/21 9:38 email to go with this recommendation.</Data></Cell>
    <Cell ss:StyleID="s84"><Data ss:Type="String">Hourly-$35</Data></Cell>
    <Cell ss:StyleID="s110"><Data ss:Type="Number">8.75</Data></Cell>
    <Cell ss:StyleID="s114"><Data ss:Type="Number">566</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s103"><Data ss:Type="DateTime">2012-11-21T00:00:00.000</Data></Cell>
    <Cell ss:StyleID="s104"><Data ss:Type="Number">0.25</Data></Cell>
    <Cell ss:StyleID="s105"><Data ss:Type="String">James indicates in 11/21 9:38 email to develop this recommendation. </Data></Cell>
    <Cell ss:StyleID="s81"><Data ss:Type="String">Hourly-$35</Data></Cell>
    <Cell ss:StyleID="s106"><Data ss:Type="Number">8.75</Data></Cell>
    <Cell ss:StyleID="s114"><Data ss:Type="Number">567</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s108"><Data ss:Type="DateTime">2012-11-23T00:00:00.000</Data></Cell>
    <Cell ss:StyleID="s109"><Data ss:Type="Number">0.25</Data></Cell>
    <Cell ss:StyleID="s110"><Data ss:Type="String">Called Leo. Work on bugs first because NASA hasn't yet approved hours for any other work.</Data></Cell>
    <Cell ss:StyleID="s84"><Data ss:Type="String">Hourly-$35</Data></Cell>
    <Cell ss:StyleID="s110"><Data ss:Type="Number">8.75</Data></Cell>
    <Cell ss:StyleID="s114"><Data ss:Type="Number">568</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s103"><Data ss:Type="DateTime">2012-11-26T00:00:00.000</Data></Cell>
    <Cell ss:StyleID="s104"><Data ss:Type="Number">0.25</Data></Cell>
    <Cell ss:StyleID="s105"><Data ss:Type="String">Altered text area countdowns to alert user to correct number of max characters.</Data></Cell>
    <Cell ss:StyleID="s81"><Data ss:Type="String">Hourly-$35</Data></Cell>
    <Cell ss:StyleID="s106"><Data ss:Type="Number">8.75</Data></Cell>
    <Cell ss:StyleID="s114"><Data ss:Type="Number">569</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s108"><Data ss:Type="DateTime">2012-11-26T00:00:00.000</Data></Cell>
    <Cell ss:StyleID="s109"><Data ss:Type="Number">0.5</Data></Cell>
    <Cell ss:StyleID="s110"><Data ss:Type="String">Replaced &quot;onKeyUp/Down&quot; firing events of textarea countdown with onKeyPress. Augmented onKeyPress firing event (which, like onKeyUp/Down, is not 508-compliant) to &quot;onChange&quot;, which is accessible. </Data></Cell>
    <Cell ss:StyleID="s84"><Data ss:Type="String">Hourly-$35</Data></Cell>
    <Cell ss:StyleID="s110"><Data ss:Type="Number">17.5</Data></Cell>
    <Cell ss:StyleID="s114"><Data ss:Type="Number">571</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s103"><Data ss:Type="DateTime">2012-11-26T00:00:00.000</Data></Cell>
    <Cell ss:StyleID="s104"><Data ss:Type="Number">1.75</Data></Cell>
    <Cell ss:StyleID="s105"><Data ss:Type="String">Adding server-side validation to check for valid email address on new request submission. Added spam trapping that demands the user solve some simple equation that adds up to a number less than 9 (ie: 3+4=?). Added server-side validation for the answer.</Data></Cell>
    <Cell ss:StyleID="s81"><Data ss:Type="String">Hourly-$35</Data></Cell>
    <Cell ss:StyleID="s106"><Data ss:Type="Number">61.25</Data></Cell>
    <Cell ss:StyleID="s114"><Data ss:Type="Number">572</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s108"><Data ss:Type="DateTime">2012-11-26T00:00:00.000</Data></Cell>
    <Cell ss:StyleID="s109"><Data ss:Type="Number">0.25</Data></Cell>
    <Cell ss:StyleID="s110"><Data ss:Type="String">Edited development request 152 (http://www.i-codedesign.com/service_request_development/index.cfm?idnew_table=152) to change email address to invalid value.</Data></Cell>
    <Cell ss:StyleID="s84"><Data ss:Type="String">Hourly-$35</Data></Cell>
    <Cell ss:StyleID="s110"><Data ss:Type="Number">8.75</Data></Cell>
    <Cell ss:StyleID="s114"><Data ss:Type="Number">573</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s103"><Data ss:Type="DateTime">2012-11-26T00:00:00.000</Data></Cell>
    <Cell ss:StyleID="s104"><Data ss:Type="Number">0.25</Data></Cell>
    <Cell ss:StyleID="s105"><Data ss:Type="String">Closing in deference to duplicate task 197.</Data></Cell>
    <Cell ss:StyleID="s81"><Data ss:Type="String">Hourly-$35</Data></Cell>
    <Cell ss:StyleID="s106"><Data ss:Type="Number">8.75</Data></Cell>
    <Cell ss:StyleID="s114"><Data ss:Type="Number">575</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s108"><Data ss:Type="DateTime">2012-11-26T00:00:00.000</Data></Cell>
    <Cell ss:StyleID="s109"><Data ss:Type="Number">0.25</Data></Cell>
    <Cell ss:StyleID="s110"><Data ss:Type="String">Changed color used when a request is disapproved by the requestor.</Data></Cell>
    <Cell ss:StyleID="s84"><Data ss:Type="String">Hourly-$35</Data></Cell>
    <Cell ss:StyleID="s110"><Data ss:Type="Number">8.75</Data></Cell>
    <Cell ss:StyleID="s114"><Data ss:Type="Number">576</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s103"><Data ss:Type="DateTime">2012-11-26T00:00:00.000</Data></Cell>
    <Cell ss:StyleID="s104"><Data ss:Type="Number">0.25</Data></Cell>
    <Cell ss:StyleID="s105"><Data ss:Type="String">Asked James to elaborate on what's needed for this task.</Data></Cell>
    <Cell ss:StyleID="s81"><Data ss:Type="String">Hourly-$35</Data></Cell>
    <Cell ss:StyleID="s106"><Data ss:Type="Number">8.75</Data></Cell>
    <Cell ss:StyleID="s114"><Data ss:Type="Number">578</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s108"><Data ss:Type="DateTime">2012-11-26T00:00:00.000</Data></Cell>
    <Cell ss:StyleID="s109"><Data ss:Type="Number">0.25</Data></Cell>
    <Cell ss:StyleID="s110"><Data ss:Type="String">James called: fix alignment of radio buttons. He suspects that a table cell is unclosed and coloring extra contents green.</Data></Cell>
    <Cell ss:StyleID="s84"><Data ss:Type="String">Hourly-$35</Data></Cell>
    <Cell ss:StyleID="s110"><Data ss:Type="Number">8.75</Data></Cell>
    <Cell ss:StyleID="s114"><Data ss:Type="Number">579</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s103"><Data ss:Type="DateTime">2012-11-26T00:00:00.000</Data></Cell>
    <Cell ss:StyleID="s104"><Data ss:Type="Number">0.25</Data></Cell>
    <Cell ss:StyleID="s105"><Data ss:Type="String">Requester Review radio buttons and labels look good in Chrome, IE7 and IE9, even after re-sizing screen. Need to generate approval email so I can follow the link to make sure I'm looking in the right spot.</Data></Cell>
    <Cell ss:StyleID="s81"><Data ss:Type="String">Hourly-$35</Data></Cell>
    <Cell ss:StyleID="s106"><Data ss:Type="Number">8.75</Data></Cell>
    <Cell ss:StyleID="s114"><Data ss:Type="Number">580</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s108"><Data ss:Type="DateTime">2012-11-26T00:00:00.000</Data></Cell>
    <Cell ss:StyleID="s109"><Data ss:Type="Number">0.25</Data></Cell>
    <Cell ss:StyleID="s110"><Data ss:Type="String">index.cfm needs to require a login if idnew_table is defined. Otherwise, do not require a login.</Data></Cell>
    <Cell ss:StyleID="s84"><Data ss:Type="String">Hourly-$35</Data></Cell>
    <Cell ss:StyleID="s110"><Data ss:Type="Number">8.75</Data></Cell>
    <Cell ss:StyleID="s114"><Data ss:Type="Number">581</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s103"><Data ss:Type="DateTime">2012-11-26T00:00:00.000</Data></Cell>
    <Cell ss:StyleID="s104"><Data ss:Type="Number">2.5</Data></Cell>
    <Cell ss:StyleID="s105"><Data ss:Type="String">If &quot;phone number&quot; or &quot;email&quot; fields are not populated with valid values, the user is now allowed to edit those fields.</Data></Cell>
    <Cell ss:StyleID="s81"><Data ss:Type="String">Hourly-$35</Data></Cell>
    <Cell ss:StyleID="s106"><Data ss:Type="Number">87.5</Data></Cell>
    <Cell ss:StyleID="s114"><Data ss:Type="Number">620</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s108"><Data ss:Type="DateTime">2012-11-26T00:00:00.000</Data></Cell>
    <Cell ss:StyleID="s109"><Data ss:Type="Number">3.75</Data></Cell>
    <Cell ss:StyleID="s110"><Data ss:Type="String">Fixed pagination on admin.cfm (http://www.i-codedesign.com/service_request_development/admin.cfm) so that it will adhere to the sort order of the table through the different slices of data. Set pagination to slice data every 25 rows. Updated jQuery library to 1.8.3.</Data></Cell>
    <Cell ss:StyleID="s84"><Data ss:Type="String">Hourly-$35</Data></Cell>
    <Cell ss:StyleID="s110"><Data ss:Type="Number">131.25</Data></Cell>
    <Cell ss:StyleID="s114"><Data ss:Type="Number">621</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:StyleID="s103"><Data ss:Type="DateTime">2012-11-29T00:00:00.000</Data></Cell>
    <Cell ss:StyleID="s104"><Data ss:Type="Number">0.25</Data></Cell>
    <Cell ss:StyleID="s105"><Data ss:Type="String">Left a vmail for Leo detailing progress. Promised to follow-up with an email 11/30/2012.</Data></Cell>
    <Cell ss:StyleID="s81"><Data ss:Type="String">Hourly-$35</Data></Cell>
    <Cell ss:StyleID="s106"><Data ss:Type="Number">8.75</Data></Cell>
    <Cell ss:StyleID="s114"><Data ss:Type="Number">587</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0">
    <Cell ss:Index="4" ss:StyleID="s111"><Data ss:Type="String">Total</Data></Cell>
    <Cell ss:StyleID="s112" ss:Formula="=SUM(R[-37]C:R[-1]C)"><Data
      ss:Type="Number">971.25</Data></Cell>
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
