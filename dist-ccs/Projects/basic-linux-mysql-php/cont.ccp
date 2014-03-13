<Page id="1" templateExtension="html" relativePath="." fullRelativePath="." secured="False" urlType="Relative" isIncluded="False" SSLAccess="False" isService="False" cachingEnabled="False" cachingDuration="1 minutes" needGeneration="0" useDesign="False" masterPage="{CCS_PathToMasterPage}/MasterPage.ccp">
	<Components>
		<Panel id="13" visible="True" generateDiv="False" name="Head" contentPlaceholder="Head">
			<Components/>
			<Events/>
			<Attributes/>
			<Features/>
		</Panel>
		<Panel id="18" visible="True" generateDiv="False" name="Breadcrum" contentPlaceholder="Breadcrum">
			<Components>
				<IncludePage id="19" name="gcwu_breadcrum" wizardTheme="None" wizardThemeType="File" wizardThemeVersion="3.0" PathID="Breadcrumgcwu_breadcrum" page="inc/breadcrum.ccp">
					<Components/>
					<Events/>
					<Features/>
				</IncludePage>
			</Components>
			<Events/>
			<Attributes/>
			<Features/>
		</Panel>
		<Panel id="14" visible="True" generateDiv="False" name="TopMenu" contentPlaceholder="TopMenu">
			<Components>
				<IncludePage id="11" name="gcwu_gcnb" wizardTheme="None" wizardThemeType="File" wizardThemeVersion="3.0" PathID="TopMenugcwu_gcnb" page="inc/topMenu.ccp">
					<Components/>
					<Events/>
					<Features/>
				</IncludePage>
			</Components>
			<Events/>
			<Attributes/>
			<Features/>
		</Panel>
		<Panel id="33" visible="True" generateDiv="False" name="CustomScripts" contentPlaceholder="CustomScripts">
			<Components/>
			<Events/>
			<Attributes/>
			<Features/>
		</Panel>
		<Panel id="17" visible="True" generateDiv="False" name="Footer" contentPlaceholder="Footer">
			<Components>
				<IncludePage id="8" name="gcwu_footer" wizardTheme="None" wizardThemeType="File" wizardThemeVersion="3.0" PathID="Footergcwu_footer" page="inc/footer_gcwu.ccp">
					<Components/>
					<Events/>
					<Features/>
				</IncludePage>
			</Components>
			<Events/>
			<Attributes/>
			<Features/>
		</Panel>
		<Panel id="32" visible="True" generateDiv="False" name="CustomCSS" contentPlaceholder="CustomCSS">
			<Components/>
			<Events/>
			<Attributes/>
			<Features/>
		</Panel>
		<Panel id="34" visible="True" generateDiv="False" name="Content" wizardTheme="None" wizardThemeType="File" wizardThemeVersion="3.0" PathID="Content" contentPlaceholder="Content">
			<Components>
				<IncludePage id="35" name="main" wizardTheme="None" wizardThemeType="File" wizardThemeVersion="3.0" PathID="Contentmain" page="content_empty.ccp">
					<Components/>
					<Events/>
					<Features/>
				</IncludePage>
			</Components>
			<Events/>
			<Attributes/>
			<Features/>
		</Panel>
	</Components>
	<CodeFiles>
		<CodeFile id="Code" language="PHPTemplates" name="cont.php" forShow="True" url="cont.php" comment="//" codePage="utf-8"/>
	</CodeFiles>
	<SecurityGroups/>
	<CachingParameters/>
	<Attributes>
		<Attribute id="25" name="Filename" sourceType="Expression"/>
		<Attribute id="31" name="FileName"/>
	</Attributes>
	<Features/>
	<Events/>
</Page>
