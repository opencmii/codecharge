<Page id="1" templateExtension="html" relativePath="..\.." fullRelativePath=".\Designs\theme-gcwu-intranet" secured="False" urlType="Relative" isIncluded="False" SSLAccess="False" isService="False" cachingEnabled="False" cachingDuration="1 minutes" needGeneration="0">
	<Components>
		<ContentPlaceholder id="3" name="Content" wizardTheme="None" wizardThemeType="File" wizardThemeVersion="3.0" PathID="Content">
			<Components/>
			<Events/>
			<Features/>
		</ContentPlaceholder>
		<ContentPlaceholder id="4" name="Head">
			<Components/>
			<Events/>
			<Features/>
		</ContentPlaceholder>
		<ContentPlaceholder id="5" name="gcwu_gcnb" wizardTheme="None" wizardThemeType="File" wizardThemeVersion="3.0" PathID="gcwu_gcnb">
			<Components/>
			<Events/>
			<Features/>
		</ContentPlaceholder>
		<ContentPlaceholder id="8" name="CustomCSS" wizardTheme="None" wizardThemeType="File" wizardThemeVersion="3.0" PathID="CustomCSS">
			<Components/>
			<Events/>
			<Features/>
		</ContentPlaceholder>
		<Link id="10" visible="Yes" fieldSourceType="DBColumn" dataType="Text" html="False" hrefType="Page" urlType="Relative" preserveParameters="GET" name="Link1" wizardTheme="None" wizardThemeType="File" wizardThemeVersion="3.0" PathID="Link1" hrefSource="{page:Filename}" wizardUseTemplateBlock="False" linkProperties="{&quot;textSource&quot;:&quot;{res:gcwu_gcnb_lang_reverse}&quot;,&quot;textSourceDB&quot;:&quot;&quot;,&quot;hrefSource&quot;:&quot;{page:Filename}&quot;,&quot;hrefSourceDB&quot;:&quot;{page:Filename}&quot;,&quot;title&quot;:&quot;&quot;,&quot;target&quot;:&quot;&quot;,&quot;name&quot;:&quot;&quot;,&quot;linkParameters&quot;:{&quot;0&quot;:{&quot;sourceType&quot;:&quot;URL&quot;,&quot;parameterSource&quot;:&quot;{res:gcwu_gcnb_lang2_reverse}&quot;,&quot;parameterName&quot;:&quot;locale&quot;},&quot;length&quot;:1,&quot;objectType&quot;:&quot;linkParameters&quot;}}">
			<Components/>
			<Events/>
			<LinkParameters>
				<LinkParameter id="11" sourceType="URL" format="yyyy-mm-dd" name="locale" source="{res:gcwu_gcnb_lang2_reverse}"/>
			</LinkParameters>
			<Attributes/>
			<Features/>
		</Link>
		<Panel id="12" visible="False" generateDiv="False" name="gcwu_srchbx" wizardTheme="None" wizardThemeType="File" wizardThemeVersion="3.0" PathID="gcwu_srchbx">
			<Components/>
			<Events/>
			<Attributes/>
			<Features/>
		</Panel>
		<Panel id="13" visible="True" generateDiv="False" name="gcwu_subsite" wizardTheme="None" wizardThemeType="File" wizardThemeVersion="3.0" wizardInnerHTML="       &lt;div id=&quot;gcwu-subsite&quot; class=&quot;gcwu-subsite-1&quot;&gt;
          &lt;p&gt;&lt;a href=&quot;#&quot;&gt;{page:pathToCurrentPage}&lt;/a&gt;&lt;/p&gt;
        &lt;/div&gt;
 " PathID="gcwu_subsite">
			<Components/>
			<Events/>
			<Attributes/>
			<Features/>
		</Panel>
		<ContentPlaceholder id="14" name="CustomScripts" wizardTheme="None" wizardThemeType="File" wizardThemeVersion="3.0" PathID="CustomScripts">
			<Components/>
			<Events/>
			<Features/>
		</ContentPlaceholder>
		<ContentPlaceholder id="15" name="Footer" wizardTheme="None" wizardThemeType="File" wizardThemeVersion="3.0" PathID="Footer">
			<Components/>
			<Events/>
			<Features/>
		</ContentPlaceholder>
		<ContentPlaceholder id="16" name="cgwu_breadcrum" wizardTheme="None" wizardThemeType="File" wizardThemeVersion="3.0" PathID="cgwu_breadcrum">
			<Components/>
			<Events/>
			<Features/>
		</ContentPlaceholder>
		<ContentPlaceholder id="17" name="SiteMenu" wizardTheme="None" wizardThemeType="File" wizardThemeVersion="3.0" PathID="SiteMenu">
			<Components/>
			<Events/>
			<Features/>
		</ContentPlaceholder>
	</Components>
	<CodeFiles>
		<CodeFile id="Code" language="PHPTemplates" name="MasterPage.php" forShow="True" url="MasterPage.php" comment="//" codePage="utf-8"/>
	</CodeFiles>
	<SecurityGroups/>
	<CachingParameters/>
	<Attributes>
		<Attribute id="9" name="project_name" sourceType="Expression" source="&quot;Project X&quot;"/>
		<Attribute id="18" name="Filename"/>
	</Attributes>
	<Features/>
	<Events/>
</Page>
