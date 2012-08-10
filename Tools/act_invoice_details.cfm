<cfoutput>
<cfsavecontent variable="variables.invoice_xml">
<?xml version="1.0"?>
<?mso-application progid="Excel.Sheet"?>
<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns:dt="uuid:C2F41010-65B3-11d1-A29F-00AA00C14882" xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet" xmlns:html="http://www.w3.org/TR/REC-html40">
	<DocumentProperties xmlns="urn:schemas-microsoft-com:office:office">
		<Author>#session.user_name#</Author>
		<LastAuthor>#session.first_name# #session.last_name#</LastAuthor>
		<Created>#dateformat(now(), "yyyy-mm-dd")#T#timeformat(now(), "HH:mm:ss")#Z</Created>
		<LastSaved>#dateformat(now(), "yyyy-mm-dd")#T#timeformat(now(), "HH:mm:ss")#Z</LastSaved>
		<Company>Microsoft Corporation</Company>
		<Version>14.00</Version>
	</DocumentProperties>
	<CustomDocumentProperties xmlns="urn:schemas-microsoft-com:office:office">
		<_TemplateID dt:dt="string">TC101001301033</_TemplateID>
	</CustomDocumentProperties>
	<OfficeDocumentSettings xmlns="urn:schemas-microsoft-com:office:office">
		<AllowPNG/>
		<Colors>
			<Color>
				<Index>12</Index>
				<RGB>##C0C0C0</RGB>
			</Color>
			<Color>
				<Index>32</Index>
				<RGB>##E3EDED</RGB>
			</Color>
			<Color>
				<Index>33</Index>
				<RGB>##D6DCE0</RGB>
			</Color>
			<Color>
				<Index>36</Index>
				<RGB>##9DBEC3</RGB>
			</Color>
			<Color>
				<Index>38</Index>
				<RGB>##EDF3F3</RGB>
			</Color>
			<Color>
				<Index>46</Index>
				<RGB>##969696</RGB>
			</Color>
			<Color>
				<Index>53</Index>
				<RGB>##4B7279</RGB>
			</Color>
			<Color>
				<Index>54</Index>
				<RGB>##969696</RGB>
			</Color>
		</Colors>
	</OfficeDocumentSettings>
	<ExcelWorkbook xmlns="urn:schemas-microsoft-com:office:excel">
		<WindowHeight>6225</WindowHeight>
		<WindowWidth>19170</WindowWidth>
		<WindowTopX>-15</WindowTopX>
		<WindowTopY>6165</WindowTopY>
		<ProtectStructure>False</ProtectStructure>
		<ProtectWindows>False</ProtectWindows>
	</ExcelWorkbook>
	<Styles>
		<Style ss:ID="Default" ss:Name="Normal">
			<Alignment ss:Vertical="Bottom" />
			<Borders/>
			<Font ss:FontName="Arial" />
			<Interior/>
			<NumberFormat/>
			<Protection/>
		</Style>
		<Style ss:ID="s63">
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" />
		</Style>
		<Style ss:ID="s64">
			<Alignment ss:Horizontal="Left" ss:Vertical="Bottom" />
			<Borders/>
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="12" />
		</Style>
		<Style ss:ID="s65">
			<Alignment ss:Horizontal="Left" ss:Vertical="Bottom" />
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8" />
		</Style>
		<Style ss:ID="s66">
			<Alignment ss:Horizontal="Left" ss:Vertical="Bottom" />
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8" />
			<NumberFormat ss:Format="[ENG][$-409]mmmm\ d\,\ yyyy;@" />
		</Style>
		<Style ss:ID="s67">
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8" />
		</Style>
		<Style ss:ID="s68">
			<Alignment ss:Vertical="Bottom" />
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8" />
		</Style>
		<Style ss:ID="s69">
			<Alignment ss:Horizontal="Left" ss:Vertical="Center" />
			<Borders/>
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8" />
			<Interior ss:Color="##FFFFFF" ss:Pattern="Solid" />
		</Style>
		<Style ss:ID="s70">
			<Alignment ss:Vertical="Center" />
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" />
		</Style>
		<Style ss:ID="s71">
			<Alignment ss:Vertical="Center" />
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8" />
		</Style>
		<Style ss:ID="s72">
			<Borders/>
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8" ss:Italic="1" />
			<Interior ss:Color="##FFFFFF" ss:Pattern="Solid" />
		</Style>
		<Style ss:ID="s73">
			<Alignment ss:Vertical="Bottom" />
			<Borders/>
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8" />
			<Interior ss:Color="##FFFFFF" ss:Pattern="Solid" />
		</Style>
		<Style ss:ID="s74">
			<Alignment ss:Horizontal="Center" ss:Vertical="Bottom" />
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Bold="1" />
		</Style>
		<Style ss:ID="s75">
			<Alignment ss:Horizontal="Center" ss:Vertical="Bottom" />
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Color="##EDF3F3" ss:Bold="1" ss:Italic="1" />
		</Style>
		<Style ss:ID="s76">
			<Alignment ss:Horizontal="Center" ss:Vertical="Bottom" />
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Color="##EDF3F3" />
		</Style>
		<Style ss:ID="s77">
			<Alignment ss:Horizontal="Center" ss:Vertical="Bottom" />
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Color="##D6DCE0" ss:Bold="1" />
		</Style>
		<Style ss:ID="s78">
			<Alignment ss:Horizontal="Left" ss:Vertical="Center" />
			<Borders/>
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8" />
			<Interior ss:Color="##FFFFFF" ss:Pattern="Solid" />
			<NumberFormat/>
		</Style>
		<Style ss:ID="s79">
			<Alignment ss:Horizontal="Left" ss:Vertical="Bottom" />
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8" ss:Color="##4B7279" />
		</Style>
		<Style ss:ID="s80">
			<Alignment ss:Horizontal="Left" ss:Vertical="Bottom" />
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8" ss:Color="##4B7279" />
			<NumberFormat ss:Format="[ENG][$-409]mmmm\ d\,\ yyyy;@" />
		</Style>
		<Style ss:ID="s81">
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8" ss:Color="##4B7279" />
		</Style>
		<Style ss:ID="s82">
			<Alignment ss:Vertical="Bottom" />
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8" ss:Color="##4B7279" />
		</Style>
		<Style ss:ID="s83">
			<Alignment ss:Vertical="Top" />
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8" ss:Color="##4B7279" />
		</Style>
		<Style ss:ID="s84">
			<Alignment ss:Horizontal="Left" ss:Vertical="Bottom" />
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8" ss:Color="##4B7279" ss:Bold="1" />
		</Style>
		<Style ss:ID="s85">
			<Alignment ss:Horizontal="Left" ss:Vertical="Center" />
			<Borders>
				<Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
				<Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
				<Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
				<Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
			</Borders>
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8" ss:Color="##4B7279" />
			<Interior ss:Color="##FFFFFF" ss:Pattern="Solid" />
			<NumberFormat ss:Format="Fixed" />
		</Style>
		<Style ss:ID="s86">
			<Alignment ss:Horizontal="Left" ss:Vertical="Center" />
			<Borders>
				<Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
				<Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
				<Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
				<Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
			</Borders>
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8" ss:Color="##4B7279" />
			<Interior ss:Color="##EDF3F3" ss:Pattern="Solid" />
			<NumberFormat ss:Format="Fixed" />
		</Style>
		<Style ss:ID="s87">
			<Alignment ss:Horizontal="Right" ss:Vertical="Center" />
			<Borders/>
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8" ss:Color="##4B7279" />
			<Interior ss:Color="##FFFFFF" ss:Pattern="Solid" />
		</Style>
		<Style ss:ID="s88">
			<Alignment ss:Horizontal="Left" ss:Vertical="Center" />
			<Borders>
				<Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
				<Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##9DBEC3" />
			</Borders>
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8" ss:Color="##FFFFFF" ss:Bold="1" />
			<Interior ss:Color="##9DBEC3" ss:Pattern="Solid" />
		</Style>
		<Style ss:ID="s89">
			<Alignment ss:Horizontal="Left" ss:Vertical="Center" />
			<Borders>
				<Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
			</Borders>
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8" ss:Color="##FFFFFF" ss:Bold="1" />
			<Interior ss:Color="##9DBEC3" ss:Pattern="Solid" />
		</Style>
		<Style ss:ID="s90">
			<Alignment ss:Horizontal="Left" ss:Vertical="Center" />
			<Borders>
				<Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
				<Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##9DBEC3" />
			</Borders>
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8" ss:Color="##FFFFFF" ss:Bold="1" />
			<Interior ss:Color="##9DBEC3" ss:Pattern="Solid" />
		</Style>
		<Style ss:ID="s91">
			<Alignment ss:Vertical="Center" />
			<Borders>
				<Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
				<Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
				<Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
				<Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
			</Borders>
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8" ss:Color="##4B7279" />
			<Interior ss:Color="##E3EDED" ss:Pattern="Solid" />
			<NumberFormat ss:Format="_(&quot;$&quot;* ##,####0.00_);_(&quot;$&quot;* \(##,####0.00\);_(&quot;$&quot;* &quot;-&quot;??_);_(@_)" />
		</Style>
		<Style ss:ID="s92">
			<Alignment ss:Vertical="Center" />
			<Borders>
				<Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
				<Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
				<Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
				<Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
			</Borders>
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8" ss:Color="##4B7279" />
			<Interior ss:Color="##EDF3F3" ss:Pattern="Solid" />
			<NumberFormat ss:Format="_(* ##,####0.00_);_(* \(##,####0.00\);_(* &quot;-&quot;??_);_(@_)" />
		</Style>
		<Style ss:ID="s93">
			<Alignment ss:Vertical="Center" />
			<Borders>
				<Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
				<Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
				<Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
				<Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
			</Borders>
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8" ss:Color="##4B7279" />
			<Interior ss:Color="##E3EDED" ss:Pattern="Solid" />
			<NumberFormat ss:Format="_(* ##,####0.00_);_(* \(##,####0.00\);_(* &quot;-&quot;??_);_(@_)" />
		</Style>
		<Style ss:ID="s94">
			<Alignment ss:Vertical="Center" />
			<Borders>
				<Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
				<Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
				<Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
				<Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
			</Borders>
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8" ss:Color="##4B7279" />
			<Interior ss:Color="##FFFFFF" ss:Pattern="Solid" />
			<NumberFormat ss:Format="_(* ##,####0.00_);_(* \(##,####0.00\);_(* &quot;-&quot;??_);_(@_)" />
		</Style>
		<Style ss:ID="s95">
			<Alignment ss:Vertical="Center" />
			<Borders>
				<Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
				<Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
				<Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
				<Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
			</Borders>
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8" ss:Color="##4B7279" ss:Bold="1" />
			<Interior ss:Color="##E3EDED" ss:Pattern="Solid" />
			<NumberFormat ss:Format="_(&quot;$&quot;* ##,####0.00_);_(&quot;$&quot;* \(##,####0.00\);_(&quot;$&quot;* &quot;-&quot;??_);_(@_)" />
		</Style>
		<Style ss:ID="s96">
			<Alignment ss:Horizontal="Left" ss:Vertical="Center" ss:WrapText="1" />
			<Borders>
				<Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
				<Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
				<Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
			</Borders>
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8" ss:Color="##4B7279" />
			<Interior ss:Color="##FFFFFF" ss:Pattern="Solid" />
			<NumberFormat/>
		</Style>
		<Style ss:ID="s97">
			<Alignment ss:Horizontal="Left" ss:Vertical="Center" ss:WrapText="1" />
			<Borders>
				<Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
				<Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
				<Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
			</Borders>
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8" ss:Color="##4B7279" />
			<Interior ss:Color="##EDF3F3" ss:Pattern="Solid" />
			<NumberFormat/>
		</Style>
		<Style ss:ID="s98">
			<Alignment ss:Horizontal="Left" ss:Vertical="Center" ss:WrapText="1" />
			<Borders>
				<Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
				<Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
			</Borders>
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8" ss:Color="##4B7279" />
			<Interior ss:Color="##EDF3F3" ss:Pattern="Solid" />
			<NumberFormat/>
		</Style>
		<Style ss:ID="s99">
			<Alignment ss:Vertical="Bottom" />
			<Borders>
				<Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
				<Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
			</Borders>
		</Style>
		<Style ss:ID="s100">
			<Alignment ss:Vertical="Top" ss:WrapText="1" />
			<Borders>
				<Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
				<Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
				<Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
				<Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
			</Borders>
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8" ss:Color="##4B7279" />
			<Interior ss:Color="##EDF3F3" ss:Pattern="Solid" />
			<NumberFormat ss:Format="_(* ##,####0.00_);_(* \(##,####0.00\);_(* &quot;-&quot;??_);_(@_)" />
		</Style>
		<Style ss:ID="s101">
			<Alignment ss:Vertical="Top" />
			<Borders>
				<Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
				<Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
				<Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
				<Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
			</Borders>
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8" ss:Color="##4B7279" />
			<Interior ss:Color="##E3EDED" ss:Pattern="Solid" />
			<NumberFormat ss:Format="_(* ##,####0.00_);_(* \(##,####0.00\);_(* &quot;-&quot;??_);_(@_)" />
		</Style>
		<Style ss:ID="s102">
			<Alignment ss:Vertical="Top" ss:WrapText="1" />
			<Borders>
				<Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
				<Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
				<Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
			</Borders>
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8" ss:Color="##4B7279" />
			<Interior ss:Color="##EDF3F3" ss:Pattern="Solid" />
			<NumberFormat/>
		</Style>
		<Style ss:ID="s103">
			<Alignment ss:Vertical="Top" ss:WrapText="1" />
			<Borders>
				<Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
				<Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
			</Borders>
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8" ss:Color="##4B7279" />
			<Interior ss:Color="##EDF3F3" ss:Pattern="Solid" />
			<NumberFormat/>
		</Style>
		<Style ss:ID="s104">
			<Alignment ss:Vertical="Top" ss:WrapText="1" />
			<Borders>
				<Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
				<Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
			</Borders>
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8" ss:Color="##4B7279" />
			<Interior/>
			<NumberFormat/>
		</Style>
		<Style ss:ID="s105">
			<Alignment ss:Vertical="Top" />
			<Borders>
				<Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
				<Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
				<Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
				<Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
			</Borders>
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8" ss:Color="##4B7279" />
			<Interior ss:Color="##EDF3F3" ss:Pattern="Solid" />
			<NumberFormat ss:Format="m/d/yyyy;@" />
		</Style>
		<Style ss:ID="s106">
			<Alignment ss:Vertical="Top" />
			<Borders>
				<Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
				<Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
				<Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
				<Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
			</Borders>
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8" ss:Color="##4B7279" />
			<Interior/>
			<NumberFormat ss:Format="m/d/yyyy;@" />
		</Style>
		<Style ss:ID="s107">
			<Alignment ss:Vertical="Top" ss:WrapText="1" />
			<Borders>
				<Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
				<Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
				<Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
			</Borders>
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8" ss:Color="##4B7279" />
			<Interior/>
			<NumberFormat/>
		</Style>
		<Style ss:ID="s108">
			<Alignment ss:Vertical="Top" ss:WrapText="1" />
			<Borders>
				<Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
				<Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
				<Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
				<Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1" ss:Color="##D6DCE0" />
			</Borders>
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8" ss:Color="##4B7279" />
			<Interior/>
			<NumberFormat ss:Format="_(* ##,####0.00_);_(* \(##,####0.00\);_(* &quot;-&quot;??_);_(@_)" />
		</Style>
		<Style ss:ID="s116">
			<Alignment ss:Horizontal="Left" ss:Vertical="Bottom" />
			<Borders/>
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="12" ss:Color="##4B7279" />
		</Style>
		<Style ss:ID="s118">
			<Alignment ss:Horizontal="Right" ss:Vertical="Bottom" />
			<Borders/>
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="38" ss:Color="##D6DCE0" ss:Italic="1" />
		</Style>
		<Style ss:ID="s122">
			<Alignment ss:Vertical="Bottom" />
			<Borders/>
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8" ss:Color="##4B7279" />
		</Style>
		<Style ss:ID="s125">
			<Alignment ss:Vertical="Bottom" />
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" />
		</Style>
		<Style ss:ID="s126">
			<Alignment ss:Horizontal="Center" ss:Vertical="Center" ss:WrapText="1" />
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8" ss:Color="##9DBEC3" />
		</Style>
		<Style ss:ID="s128">
			<Alignment ss:Horizontal="Center" ss:Vertical="Center" />
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8" ss:Color="##9DBEC3" />
		</Style>
		<Style ss:ID="s129">
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Color="##FFFFFF" />
		</Style>
		<Style ss:ID="s131">
			<Alignment ss:Vertical="Top" />
			<Borders>
				<Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1" ss:Color=="##D6DCE0" />
				<Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1" ss:Color=="##D6DCE0" />
				<Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1" ss:Color=="##D6DCE0" />
				<Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1" ss:Color=="##D6DCE0" />
			</Borders>
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8" ss:Color=="##4B7279" />
			<Interior ss:Color="##EDF3F3" ss:Pattern="Solid" />
			<NumberFormat ss:Format="@" />
		</Style>
		<Style ss:ID="s132">
			<Alignment ss:Vertical="Top" />
			<Borders>
				<Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1" ss:Color=="##D6DCE0" />
				<Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1" ss:Color=="##D6DCE0" />
				<Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1" ss:Color=="##D6DCE0" />
				<Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1" ss:Color=="##D6DCE0" />
			</Borders>
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8" ss:Color=="##4B7279" />
			<Interior/>
			<NumberFormat ss:Format="@" />
		</Style>
		<Style ss:ID="s135">
			<Alignment ss:Horizontal="Left" ss:Vertical="Bottom" />
			<Borders/>
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Color="##4B7279" />
		</Style>
		<Style ss:ID="s139">
			<Alignment ss:Vertical="Top" />
			<Borders>
				<Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1" ss:Color=="##D6DCE0" />
				<Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1" ss:Color=="##D6DCE0" />
				<Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1" ss:Color=="##D6DCE0" />
				<Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1" ss:Color=="##D6DCE0" />
			</Borders>
			<Font ss:FontName="Palatino Linotype" x:Family="Roman" ss:Size="8" ss:Color=="##4B7279" />
			<Interior ss:Color="##FFFFFF" ss:Pattern="Solid" />
			<NumberFormat ss:Format="_(* ##,####0.00_);_(* \(##,####0.00\);_(* &quot;-&quot;??_);_(@_)" />
		</Style>
	</Styles>
 <Worksheet ss:Name="Invoice Overview">
  <Table ss:ExpandedColumnCount="7" ss:ExpandedRowCount="26" x:FullColumns="1" x:FullRows="1">
   <Column ss:Index="2" ss:AutoFitWidth="0" ss:Width="125.25" />
   <Column ss:Index="4" ss:Width="54.75" />
   <Column ss:Width="70.5" />
   <Row ss:Height="56.25">
    <Cell ss:MergeAcross="4" ss:StyleID="s118"><Data ss:Type="String">Invoice</Data></Cell>
   </Row>
   <Row ss:Height="18">
    <Cell ss:StyleID="s64" />
    <Cell ss:StyleID="s64" />
    <Cell ss:StyleID="s64" />
    <Cell ss:StyleID="s65" />
    <Cell ss:StyleID="s66" />
   </Row>
   <Row ss:Height="18">
    <Cell ss:StyleID="s116"><Data ss:Type="String">#session.first_name# #session.last_name#</Data></Cell>
    <Cell ss:StyleID="s116" />
    <Cell ss:StyleID="s116" />
    <Cell ss:StyleID="s79"><Data ss:Type="String">Date:</Data></Cell>
    <Cell ss:StyleID="s80" ss:Formula="=TODAY()"><Data ss:Type="DateTime">#dateformat(now(), "yyyy-mm-dd")#T#timeformat(now(), "HH:mm:ss")#.000</Data></Cell>
   </Row>
   <Row ss:Height="15">
    <Cell ss:StyleID="s135"><Data ss:Type="String">#session.workstream_company_name#</Data></Cell>
    <Cell ss:StyleID="s135" />
    <Cell ss:StyleID="s135" />
    <Cell ss:StyleID="s79"><Data ss:Type="String">Invoice ##:</Data></Cell>
    <Cell ss:StyleID="s79"><Data ss:Type="Number">#get_invoice_header.invoice_number#</Data></Cell>
   </Row>
   <Row ss:Height="18">
    <Cell ss:StyleID="s116" />
    <Cell ss:StyleID="s116" />
    <Cell ss:StyleID="s116" />
    <Cell ss:StyleID="s79"><Data ss:Type="String">Customer ID:</Data></Cell>
    <Cell ss:StyleID="s79"><Data ss:Type="Number">#get_invoice_header.root_code#</Data></Cell>
   </Row>
   <Row ss:Height="14.25">
    <Cell ss:StyleID="s81" />
    <Cell ss:StyleID="s81" />
    <Cell ss:StyleID="s81" />
    <Cell ss:StyleID="s81" />
    <Cell ss:StyleID="s82" />
   </Row>
   <Row ss:Height="14.25">
    <Cell ss:StyleID="s81" />
    <Cell ss:StyleID="s81" />
    <Cell ss:StyleID="s81" />
    <Cell ss:StyleID="s81" />
    <Cell ss:StyleID="s83" />
   </Row>
   <Row ss:Height="14.25">
    <Cell ss:StyleID="s79"><Data ss:Type="String">To:</Data></Cell>
    <Cell ss:MergeAcross="1" ss:StyleID="s79"><Data ss:Type="String">#get_invoice_header.name# #get_invoice_header.name#</Data></Cell>
    <Cell ss:StyleID="s83" />
    <Cell ss:StyleID="s83" />
   </Row>
   <Row ss:Height="14.25">
    <Cell ss:StyleID="s84" />
    <Cell ss:MergeAcross="1" ss:StyleID="s79"><Data ss:Type="String">#get_invoice_header.customer_name#</Data></Cell>
    <Cell ss:StyleID="s83" />
    <Cell ss:StyleID="s83" />
   </Row>
   <Row ss:Height="14.25">
    <Cell ss:StyleID="s82" />
    <Cell ss:StyleID="s79"><Data ss:Type="String">#get_invoice_header.company_address1#<cfif len(get_invoice_header.company_address2)>, #get_invoice_header.company_address2#</cfif></Data></Cell>
    <Cell ss:StyleID="s79" />
    <Cell ss:StyleID="s83" />
    <Cell ss:StyleID="s83" />
   </Row>
   <Row ss:Height="18">
    <Cell ss:StyleID="s82" />
    <Cell ss:StyleID="s79"><Data ss:Type="String">#get_invoice_header.company_city#, #get_invoice_header.company_state# #get_invoice_header.company_zip#</Data></Cell>
    <Cell ss:StyleID="s79" />
    <Cell ss:StyleID="s83" />
    <Cell ss:MergeAcross="2" ss:StyleID="s116" />
   </Row>
   <Row ss:Height="14.25">
    <Cell ss:StyleID="s82" />
    <Cell ss:StyleID="s79"><Data ss:Type="String">#get_invoice_header.phone_number#</Data></Cell>
    <Cell ss:StyleID="s79" />
    <Cell ss:StyleID="s83" />
    <Cell ss:StyleID="s83" />
   </Row>
   <Row ss:Index="14" ss:Height="13.5">
    <Cell ss:Index="2" ss:StyleID="s88"><Data ss:Type="String">Project</Data></Cell>
    <Cell ss:StyleID="s89"><Data ss:Type="String">Description</Data></Cell>
    <Cell ss:StyleID="s90"><Data ss:Type="String">Line Total</Data></Cell>
   </Row>
  <cfloop query="get_invoice_projects">
  <cfscript>
  	if (currentrow MOD 2) {
  	variables.code_style_id=131;
  	variables.description_style_id=102;
  	variables.subtotal_style_id=101;
  	variables.formula_code=5;
	}
	else {
  	variables.code_style_id=132;
  	variables.description_style_id=107;
  	variables.subtotal_style_id=139;
  	variables.formula_code=4;
	}
  </cfscript>
   <Row ss:Height="13.5">
    <Cell ss:Index="2" ss:StyleID="s#variables.code_style_id#"><Data ss:Type="Number">#project_code#</Data></Cell>
    <Cell ss:StyleID="s#variables.description_style_id#"><Data ss:Type="String">#project_description#</Data></Cell>
    <Cell ss:StyleID="s#variables.subtotal_style_id#" ss:Formula="='Project #project_code#'!R[-6]C[1]"><Data ss:Type="Number">227.5</Data></Cell>
   </Row>
  </cfloop>
   <Row ss:Height="13.5">
    <Cell ss:Index="2" ss:StyleID="s132"><Data ss:Type="Number">1002</Data></Cell>
    <Cell ss:StyleID="s107"><Data ss:Type="String">remote</Data></Cell>
    <Cell ss:StyleID="s139" ss:Formula="='##project_code##2'!R[4]C[1]"><Data ss:Type="Number">227.5</Data></Cell>
   </Row>
   <Row ss:Height="27">
    <Cell ss:Index="2" ss:StyleID="s105"><Data ss:Type="String">##project_code##</Data></Cell>
    <Cell ss:StyleID="s102"><Data ss:Type="String">##description##</Data></Cell>
    <Cell ss:StyleID="s101" ss:Formula="=##REF!"><Data ss:Type="Error">##REF!</Data></Cell>
   </Row>
   <Row ss:Height="13.5">
    <Cell ss:Index="2" ss:StyleID="s106"><Data ss:Type="String">##date_performed##</Data></Cell>
    <Cell ss:StyleID="s107"><Data ss:Type="String">##rate##</Data></Cell>
    <Cell ss:StyleID="s108"><Data ss:Type="String">##revenue##</Data></Cell>
   </Row>
   <Row ss:Height="13.5">
    <Cell ss:Index="2" ss:StyleID="s78" />
    <Cell ss:StyleID="s87"><Data ss:Type="String">Subtotal</Data></Cell>
    <Cell ss:StyleID="s91"
     ss:Formula="=IF(SUM(R[-4]C:R[-1]C)&gt;0,SUM(R[-4]C:R[-1]C),&quot;&quot;)"><Data
      ss:Type="Error">##REF!</Data></Cell>
   </Row>
   <Row ss:Height="13.5">
    <Cell ss:Index="2" ss:StyleID="s69" />
    <Cell ss:StyleID="s87"><Data ss:Type="String">Sales Tax</Data></Cell>
    <Cell ss:StyleID="s94" />
   </Row>
   <Row ss:Height="13.5">
    <Cell ss:Index="2" ss:StyleID="s69" />
    <Cell ss:StyleID="s87"><Data ss:Type="String">Total</Data></Cell>
    <Cell ss:StyleID="s95"
     ss:Formula="=IF(SUM(R[-2]C)&gt;0,SUM((R[-2]C*R[-1]C)+R[-2]C),&quot;&quot;)"><Data
      ss:Type="Error">##REF!</Data></Cell>
   </Row>
   <Row ss:Height="15">
    <Cell ss:MergeAcross="4" ss:StyleID="s125" />
   </Row>
   <Row>
    <Cell ss:MergeAcross="4" ss:MergeDown="1" ss:StyleID="s126"><ss:Data
      ss:Type="String" xmlns="http://www.w3.org/TR/REC-html40"><Font
       html:Color="##9DBEC3">Payment due upon receipt, please make all checks payable to #session.workstream_company_name#</Font><Font
       html:Size="10" html:Color="##9DBEC3">&##10;</Font><Font html:Size="10"
       html:Color="##4B7279">Thank you for your business!</Font></ss:Data></Cell>
   </Row>
   <Row ss:Index="25" ss:Height="15">
    <Cell ss:StyleID="s70" />
    <Cell ss:StyleID="s70" />
    <Cell ss:StyleID="s70" />
    <Cell ss:StyleID="s70" />
    <Cell ss:StyleID="s70" />
   </Row>
   <Row ss:Height="13.5">
    <Cell ss:MergeAcross="4" ss:StyleID="s128"><Data ss:Type="String">7203 Stover Drive, Alexandria, VA 22306  703.850.6391 #session.first_name#_#session.last_name#@hotmail.com</Data></Cell>
   </Row>
  </Table>
  <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
   <PageSetup>
    <Header x:Margin="0.3" />
    <Footer x:Margin="0.3" />
    <PageMargins x:Bottom="0.75" x:Left="0.7" x:Right="0.7" x:Top="0.75" />
   </PageSetup>
   <Selected/>
   <TopRowVisible>4</TopRowVisible>
   <Panes>
    <Pane>
     <Number>3</Number>
     <ActiveRow>4</ActiveRow>
     <ActiveCol>10</ActiveCol>
    </Pane>
   </Panes>
   <ProtectObjects>False</ProtectObjects>
   <ProtectScenarios>False</ProtectScenarios>
  </WorksheetOptions>
 </Worksheet>
 <Worksheet ss:Name="##project_code##">
  <Names>
   <NamedRange ss:Name="Print_Area" ss:RefersTo="='##project_code##'!R1C1:R25C5" />
  </Names>
  <Table ss:ExpandedColumnCount="6" ss:ExpandedRowCount="30" x:FullColumns="1"
   x:FullRows="1" ss:StyleID="s63" ss:DefaultRowHeight="15">
   <Column ss:StyleID="s63" ss:Width="33.75" />
   <Column ss:StyleID="s63" ss:AutoFitWidth="0" ss:Width="115.5" />
   <Column ss:StyleID="s63" ss:Width="27.75" />
   <Column ss:StyleID="s63" ss:Width="201" />
   <Column ss:StyleID="s63" ss:AutoFitWidth="0" ss:Width="72" />
   <Row ss:Height="13.5" ss:StyleID="s67">
    <Cell ss:StyleID="s79"><Data ss:Type="String">Project:</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s79"><Data ss:Type="String">#project_code#</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s83"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s83"><NamedCell ss:Name="Print_Area" /></Cell>
   </Row>
   <Row ss:Height="13.5" ss:StyleID="s67">
    <Cell ss:MergeAcross="4" ss:StyleID="s122"><NamedCell ss:Name="Print_Area" /></Cell>
   </Row>
   <Row>
    <Cell ss:StyleID="s88"><Data ss:Type="String">Date</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s89"><Data ss:Type="String">Unit Price</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s89"><Data ss:Type="String">Hours</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s89"><Data ss:Type="String">Description</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s90"><Data ss:Type="String">Line Total</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s129"><Data ss:Type="String">time_entry_id</Data></Cell>
   </Row>
   <Row ss:Height="40.5">
    <Cell ss:StyleID="s105"><Data ss:Type="DateTime">2010-03-10T00:00:00.000</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s102"><Data ss:Type="String">remote</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s103"><Data ss:Type="Number">0.5</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s100"><Data ss:Type="String">Researched list of files I modified since November 16, 2009. Suggested setting up test installation to test deployment.</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s101"
     ss:Formula="=IF(RC[-3]=&quot;remote&quot;,35,IF(RC[-3]=&quot;on-site&quot;,45,50))*RC[-2]"><Data
      ss:Type="Number">17.5</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s129"><Data ss:Type="Number">1</Data></Cell>
   </Row>
   <Row>
    <Cell ss:StyleID="s106"><Data ss:Type="DateTime">2010-03-11T00:00:00.000</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s107"><Data ss:Type="String">remote</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s104"><Data ss:Type="Number">1.25</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s108"><Data ss:Type="String">Assisting with deployment.</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s108"
     ss:Formula="=IF(RC[-3]=&quot;remote&quot;,35,IF(RC[-3]=&quot;on-site&quot;,45,50))*RC[-2]"><Data
      ss:Type="Number">43.75</Data><NamedCell ss:Name="Print_Area" /></Cell>
   </Row>
   <Row ss:Height="67.5">
    <Cell ss:StyleID="s105"><Data ss:Type="DateTime">2010-03-21T00:00:00.000</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s102"><Data ss:Type="String">remote</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s103"><Data ss:Type="Number">1.5</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s100"><Data ss:Type="String">Improving add/edit individual javascript. Altered organization query to replace quote marks with tick marks so the quotes would no longer break the javascript for related-selects. Noted where to reinstate division requirement.</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s101"
     ss:Formula="=IF(RC[-3]=&quot;remote&quot;,35,IF(RC[-3]=&quot;on-site&quot;,45,50))*RC[-2]"><Data
      ss:Type="Number">52.5</Data><NamedCell ss:Name="Print_Area" /></Cell>
   </Row>
   <Row>
    <Cell ss:StyleID="s106"><Data ss:Type="DateTime">2010-03-22T00:00:00.000</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s107"><Data ss:Type="String">remote</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s104"><Data ss:Type="Number">2</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s108"><Data ss:Type="String">Continuing corrections to JavaScript validation.</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s108"
     ss:Formula="=IF(RC[-3]=&quot;remote&quot;,35,IF(RC[-3]=&quot;on-site&quot;,45,50))*RC[-2]"><Data
      ss:Type="Number">70</Data><NamedCell ss:Name="Print_Area" /></Cell>
   </Row>
   <Row ss:Height="27">
    <Cell ss:StyleID="s105"><Data ss:Type="DateTime">2010-03-23T00:00:00.000</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s102"><Data ss:Type="String">remote</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s103"><Data ss:Type="Number">1.25</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s100"><Data ss:Type="String">Improving the front-end add individual javascript for display/validation logic.</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s101"
     ss:Formula="=IF(RC[-3]=&quot;remote&quot;,35,IF(RC[-3]=&quot;on-site&quot;,45,50))*RC[-2]"><Data
      ss:Type="Number">43.75</Data><NamedCell ss:Name="Print_Area" /></Cell>
   </Row>
   <Row ss:Height="27">
    <Cell ss:StyleID="s106"><Data ss:Type="String">##date_performed##</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s107"><Data ss:Type="String">##rate##</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s104"><Data ss:Type="String">##hours##</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s108"><Data ss:Type="String">##note##</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s108"><Data ss:Type="String">##revenue##</Data><NamedCell ss:Name="Print_Area" /></Cell>
   </Row>
   <Row>
    <Cell ss:StyleID="s86"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s97"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s98"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s92"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s93" ss:Formula="=IF(SUM(RC[-4])&gt;0,SUM(RC[-4]*RC[-1]),&quot;&quot;)"><Data
      ss:Type="String"></Data><NamedCell ss:Name="Print_Area" /></Cell>
   </Row>
   <Row>
    <Cell ss:StyleID="s85"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s96"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s99"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s94"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s108" ss:Formula="=IF(SUM(RC[-4])&gt;0,SUM(RC[-4]*RC[-1]),&quot;&quot;)"><Data
      ss:Type="String"></Data><NamedCell ss:Name="Print_Area" /></Cell>
   </Row>
   <Row>
    <Cell ss:StyleID="s86"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s97"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s98"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s92"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s93" ss:Formula="=IF(SUM(RC[-4])&gt;0,SUM(RC[-4]*RC[-1]),&quot;&quot;)"><Data
      ss:Type="String"></Data><NamedCell ss:Name="Print_Area" /></Cell>
   </Row>
   <Row>
    <Cell ss:StyleID="s85"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s96"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s99"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s94"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s108" ss:Formula="=IF(SUM(RC[-4])&gt;0,SUM(RC[-4]*RC[-1]),&quot;&quot;)"><Data
      ss:Type="String"></Data><NamedCell ss:Name="Print_Area" /></Cell>
   </Row>
   <Row>
    <Cell ss:StyleID="s86"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s97"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s98"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s92"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s93" ss:Formula="=IF(SUM(RC[-4])&gt;0,SUM(RC[-4]*RC[-1]),&quot;&quot;)"><Data
      ss:Type="String"></Data><NamedCell ss:Name="Print_Area" /></Cell>
   </Row>
   <Row>
    <Cell ss:StyleID="s85"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s96"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s99"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s94"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s108" ss:Formula="=IF(SUM(RC[-4])&gt;0,SUM(RC[-4]*RC[-1]),&quot;&quot;)"><Data
      ss:Type="String"></Data><NamedCell ss:Name="Print_Area" /></Cell>
   </Row>
   <Row>
    <Cell ss:StyleID="s86"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s97"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s98"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s92"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s93" ss:Formula="=IF(SUM(RC[-4])&gt;0,SUM(RC[-4]*RC[-1]),&quot;&quot;)"><Data
      ss:Type="String"></Data><NamedCell ss:Name="Print_Area" /></Cell>
   </Row>
   <Row>
    <Cell ss:StyleID="s85"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s96"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s99"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s94"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s108" ss:Formula="=IF(SUM(RC[-4])&gt;0,SUM(RC[-4]*RC[-1]),&quot;&quot;)"><Data
      ss:Type="String"></Data><NamedCell ss:Name="Print_Area" /></Cell>
   </Row>
   <Row>
    <Cell ss:StyleID="s86"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s97"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s98"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s92"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s93" ss:Formula="=IF(SUM(RC[-4])&gt;0,SUM(RC[-4]*RC[-1]),&quot;&quot;)"><Data
      ss:Type="String"></Data><NamedCell ss:Name="Print_Area" /></Cell>
   </Row>
   <Row>
    <Cell ss:StyleID="s85"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s96"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s99"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s94"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s108" ss:Formula="=IF(SUM(RC[-4])&gt;0,SUM(RC[-4]*RC[-1]),&quot;&quot;)"><Data
      ss:Type="String"></Data><NamedCell ss:Name="Print_Area" /></Cell>
   </Row>
   <Row>
    <Cell ss:StyleID="s78"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s69"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s69"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s87"><Data ss:Type="String">Total</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s91"
     ss:Formula="=IF(SUM(R[-16]C:R[-1]C)&gt;0,SUM(R[-16]C:R[-1]C),&quot;&quot;)"><Data
      ss:Type="Number">227.5</Data><NamedCell ss:Name="Print_Area" /></Cell>
   </Row>
   <Row>
    <Cell ss:MergeAcross="4" ss:StyleID="s125"><NamedCell ss:Name="Print_Area" /></Cell>
   </Row>
   <Row>
    <Cell ss:MergeAcross="4" ss:MergeDown="1" ss:StyleID="s126"><NamedCell ss:Name="Print_Area" /></Cell>
   </Row>
   <Row ss:Index="24">
    <Cell ss:StyleID="s70"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s70"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s70"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s70"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s70"><NamedCell ss:Name="Print_Area" /></Cell>
   </Row>
   <Row ss:Height="13.5" ss:StyleID="s71">
    <Cell ss:MergeAcross="4" ss:StyleID="s128"><NamedCell ss:Name="Print_Area" /></Cell>
   </Row>
   <Row>
    <Cell ss:StyleID="s72" />
    <Cell ss:StyleID="s73" />
    <Cell ss:StyleID="s73" />
    <Cell ss:StyleID="s68" />
    <Cell ss:StyleID="s68" />
   </Row>
   <Row>
    <Cell ss:Index="2" ss:MergeAcross="2" ss:StyleID="s74" />
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s75" />
    <Cell ss:StyleID="s76" />
    <Cell ss:StyleID="s76" />
   </Row>
   <Row ss:Index="30">
    <Cell ss:StyleID="s77" />
    <Cell ss:StyleID="s74" />
    <Cell ss:StyleID="s74" />
    <Cell ss:StyleID="s74" />
    <Cell ss:StyleID="s74" />
   </Row>
  </Table>
  <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
   <PageSetup>
    <Layout x:CenterHorizontal="1" />
    <PageMargins x:Bottom="0.5" x:Top="0.5" />
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
     <ActiveRow>13</ActiveRow>
     <ActiveCol>7</ActiveCol>
    </Pane>
   </Panes>
   <ProtectObjects>False</ProtectObjects>
   <ProtectScenarios>False</ProtectScenarios>
  </WorksheetOptions>
 </Worksheet>
 <Worksheet ss:Name="##project_code##2">
  <Names>
   <NamedRange ss:Name="Print_Area" ss:RefersTo="='##project_code##2'!R1C1:R25C5" />
  </Names>
  <Table ss:ExpandedColumnCount="6" ss:ExpandedRowCount="30" x:FullColumns="1"
   x:FullRows="1" ss:StyleID="s63" ss:DefaultRowHeight="15">
   <Column ss:StyleID="s63" ss:Width="33.75" />
   <Column ss:StyleID="s63" ss:AutoFitWidth="0" ss:Width="115.5" />
   <Column ss:StyleID="s63" ss:Width="27.75" />
   <Column ss:StyleID="s63" ss:Width="201" />
   <Column ss:StyleID="s63" ss:AutoFitWidth="0" ss:Width="72" />
   <Row ss:Height="13.5" ss:StyleID="s67">
    <Cell ss:StyleID="s79"><Data ss:Type="String">Project:</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s79"><Data ss:Type="String">##project_code##</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s83"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s83"><NamedCell ss:Name="Print_Area" /></Cell>
   </Row>
   <Row ss:Height="13.5" ss:StyleID="s67">
    <Cell ss:MergeAcross="4" ss:StyleID="s122"><NamedCell ss:Name="Print_Area" /></Cell>
   </Row>
   <Row>
    <Cell ss:StyleID="s88"><Data ss:Type="String">Date</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s89"><Data ss:Type="String">Unit Price</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s89"><Data ss:Type="String">Hours</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s89"><Data ss:Type="String">Description</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s90"><Data ss:Type="String">Line Total</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s129"><Data ss:Type="String">time_entry_id</Data></Cell>
   </Row>
   <Row ss:Height="40.5">
    <Cell ss:StyleID="s105"><Data ss:Type="DateTime">2010-03-10T00:00:00.000</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s102"><Data ss:Type="String">remote</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s103"><Data ss:Type="Number">0.5</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s100"><Data ss:Type="String">Researched list of files I modified since November 16, 2009. Suggested setting up test installation to test deployment.</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s101"
     ss:Formula="=IF(RC[-3]=&quot;remote&quot;,35,IF(RC[-3]=&quot;on-site&quot;,45,50))*RC[-2]"><Data
      ss:Type="Number">17.5</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s129"><Data ss:Type="Number">1</Data></Cell>
   </Row>
   <Row>
    <Cell ss:StyleID="s106"><Data ss:Type="DateTime">2010-03-11T00:00:00.000</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s107"><Data ss:Type="String">remote</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s104"><Data ss:Type="Number">1.25</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s108"><Data ss:Type="String">Assisting with deployment.</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s108"
     ss:Formula="=IF(RC[-3]=&quot;remote&quot;,35,IF(RC[-3]=&quot;on-site&quot;,45,50))*RC[-2]"><Data
      ss:Type="Number">43.75</Data><NamedCell ss:Name="Print_Area" /></Cell>
   </Row>
   <Row ss:Height="67.5">
    <Cell ss:StyleID="s105"><Data ss:Type="DateTime">2010-03-21T00:00:00.000</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s102"><Data ss:Type="String">remote</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s103"><Data ss:Type="Number">1.5</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s100"><Data ss:Type="String">Improving add/edit individual javascript. Altered organization query to replace quote marks with tick marks so the quotes would no longer break the javascript for related-selects. Noted where to reinstate division requirement.</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s101"
     ss:Formula="=IF(RC[-3]=&quot;remote&quot;,35,IF(RC[-3]=&quot;on-site&quot;,45,50))*RC[-2]"><Data
      ss:Type="Number">52.5</Data><NamedCell ss:Name="Print_Area" /></Cell>
   </Row>
   <Row>
    <Cell ss:StyleID="s106"><Data ss:Type="DateTime">2010-03-22T00:00:00.000</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s107"><Data ss:Type="String">remote</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s104"><Data ss:Type="Number">2</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s108"><Data ss:Type="String">Continuing corrections to JavaScript validation.</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s108"
     ss:Formula="=IF(RC[-3]=&quot;remote&quot;,35,IF(RC[-3]=&quot;on-site&quot;,45,50))*RC[-2]"><Data
      ss:Type="Number">70</Data><NamedCell ss:Name="Print_Area" /></Cell>
   </Row>
   <Row ss:Height="27">
    <Cell ss:StyleID="s105"><Data ss:Type="DateTime">2010-03-23T00:00:00.000</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s102"><Data ss:Type="String">remote</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s103"><Data ss:Type="Number">1.25</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s100"><Data ss:Type="String">Improving the front-end add individual javascript for display/validation logic.</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s101"
     ss:Formula="=IF(RC[-3]=&quot;remote&quot;,35,IF(RC[-3]=&quot;on-site&quot;,45,50))*RC[-2]"><Data
      ss:Type="Number">43.75</Data><NamedCell ss:Name="Print_Area" /></Cell>
   </Row>
   <Row ss:Height="27">
    <Cell ss:StyleID="s106"><Data ss:Type="String">##date_performed##</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s107"><Data ss:Type="String">##rate##</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s104"><Data ss:Type="String">##hours##</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s108"><Data ss:Type="String">##note##</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s108"><Data ss:Type="String">##revenue##</Data><NamedCell ss:Name="Print_Area" /></Cell>
   </Row>
   <Row>
    <Cell ss:StyleID="s86"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s97"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s98"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s92"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s93" ss:Formula="=IF(SUM(RC[-4])&gt;0,SUM(RC[-4]*RC[-1]),&quot;&quot;)"><Data
      ss:Type="String"></Data><NamedCell ss:Name="Print_Area" /></Cell>
   </Row>
   <Row>
    <Cell ss:StyleID="s85"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s96"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s99"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s94"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s108" ss:Formula="=IF(SUM(RC[-4])&gt;0,SUM(RC[-4]*RC[-1]),&quot;&quot;)"><Data
      ss:Type="String"></Data><NamedCell ss:Name="Print_Area" /></Cell>
   </Row>
   <Row>
    <Cell ss:StyleID="s86"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s97"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s98"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s92"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s93" ss:Formula="=IF(SUM(RC[-4])&gt;0,SUM(RC[-4]*RC[-1]),&quot;&quot;)"><Data
      ss:Type="String"></Data><NamedCell ss:Name="Print_Area" /></Cell>
   </Row>
   <Row>
    <Cell ss:StyleID="s85"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s96"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s99"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s94"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s108" ss:Formula="=IF(SUM(RC[-4])&gt;0,SUM(RC[-4]*RC[-1]),&quot;&quot;)"><Data
      ss:Type="String"></Data><NamedCell ss:Name="Print_Area" /></Cell>
   </Row>
   <Row>
    <Cell ss:StyleID="s86"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s97"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s98"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s92"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s93" ss:Formula="=IF(SUM(RC[-4])&gt;0,SUM(RC[-4]*RC[-1]),&quot;&quot;)"><Data
      ss:Type="String"></Data><NamedCell ss:Name="Print_Area" /></Cell>
   </Row>
   <Row>
    <Cell ss:StyleID="s85"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s96"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s99"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s94"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s108" ss:Formula="=IF(SUM(RC[-4])&gt;0,SUM(RC[-4]*RC[-1]),&quot;&quot;)"><Data
      ss:Type="String"></Data><NamedCell ss:Name="Print_Area" /></Cell>
   </Row>
   <Row>
    <Cell ss:StyleID="s86"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s97"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s98"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s92"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s93" ss:Formula="=IF(SUM(RC[-4])&gt;0,SUM(RC[-4]*RC[-1]),&quot;&quot;)"><Data
      ss:Type="String"></Data><NamedCell ss:Name="Print_Area" /></Cell>
   </Row>
   <Row>
    <Cell ss:StyleID="s85"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s96"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s99"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s94"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s108" ss:Formula="=IF(SUM(RC[-4])&gt;0,SUM(RC[-4]*RC[-1]),&quot;&quot;)"><Data
      ss:Type="String"></Data><NamedCell ss:Name="Print_Area" /></Cell>
   </Row>
   <Row>
    <Cell ss:StyleID="s86"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s97"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s98"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s92"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s93" ss:Formula="=IF(SUM(RC[-4])&gt;0,SUM(RC[-4]*RC[-1]),&quot;&quot;)"><Data
      ss:Type="String"></Data><NamedCell ss:Name="Print_Area" /></Cell>
   </Row>
   <Row>
    <Cell ss:StyleID="s85"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s96"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s99"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s94"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s108" ss:Formula="=IF(SUM(RC[-4])&gt;0,SUM(RC[-4]*RC[-1]),&quot;&quot;)"><Data
      ss:Type="String"></Data><NamedCell ss:Name="Print_Area" /></Cell>
   </Row>
   <Row>
    <Cell ss:StyleID="s78"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s69"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s69"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s87"><Data ss:Type="String">Total</Data><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s91"
     ss:Formula="=IF(SUM(R[-16]C:R[-1]C)&gt;0,SUM(R[-16]C:R[-1]C),&quot;&quot;)"><Data
      ss:Type="Number">227.5</Data><NamedCell ss:Name="Print_Area" /></Cell>
   </Row>
   <Row>
    <Cell ss:MergeAcross="4" ss:StyleID="s125"><NamedCell ss:Name="Print_Area" /></Cell>
   </Row>
   <Row>
    <Cell ss:MergeAcross="4" ss:MergeDown="1" ss:StyleID="s126"><NamedCell ss:Name="Print_Area" /></Cell>
   </Row>
   <Row ss:Index="24">
    <Cell ss:StyleID="s70"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s70"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s70"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s70"><NamedCell ss:Name="Print_Area" /></Cell>
    <Cell ss:StyleID="s70"><NamedCell ss:Name="Print_Area" /></Cell>
   </Row>
   <Row ss:Height="13.5" ss:StyleID="s71">
    <Cell ss:MergeAcross="4" ss:StyleID="s128"><NamedCell ss:Name="Print_Area" /></Cell>
   </Row>
   <Row>
    <Cell ss:StyleID="s72" />
    <Cell ss:StyleID="s73" />
    <Cell ss:StyleID="s73" />
    <Cell ss:StyleID="s68" />
    <Cell ss:StyleID="s68" />
   </Row>
   <Row>
    <Cell ss:Index="2" ss:MergeAcross="2" ss:StyleID="s74" />
   </Row>
   <Row>
    <Cell ss:Index="2" ss:StyleID="s75" />
    <Cell ss:StyleID="s76" />
    <Cell ss:StyleID="s76" />
   </Row>
   <Row ss:Index="30">
    <Cell ss:StyleID="s77" />
    <Cell ss:StyleID="s74" />
    <Cell ss:StyleID="s74" />
    <Cell ss:StyleID="s74" />
    <Cell ss:StyleID="s74" />
   </Row>
  </Table>
  <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
   <PageSetup>
    <Layout x:CenterHorizontal="1" />
    <PageMargins x:Bottom="0.5" x:Top="0.5" />
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
     <ActiveRow>14</ActiveRow>
     <ActiveCol>5</ActiveCol>
    </Pane>
   </Panes>
   <ProtectObjects>False</ProtectObjects>
   <ProtectScenarios>False</ProtectScenarios>
  </WorksheetOptions>
 </Worksheet>
</Workbook>
</cfsavecontent>
</cfoutput>