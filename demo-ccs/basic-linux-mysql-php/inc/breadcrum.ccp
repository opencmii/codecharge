<Page id="1" templateExtension="html" relativePath=".." fullRelativePath=".\inc" secured="False" urlType="Relative" isIncluded="True" SSLAccess="False" isService="False" cachingEnabled="False" cachingDuration="1 minutes" needGeneration="0" wizardTheme="None" wizardThemeVersion="3.0">
	<Components>
		<Path id="2" sourceType="Table" name="Path_menu" connection="basic_mysql_php" dataSource="menu" catIdField="menu_id" catNameField="menu_name" catParField="menu_id_parent" wizardTypeComponent="Path" wizardCaption="{res:menu_DirectoryForm}" wizardTheme="None" wizardThemeType="File" PathID="breadcrumPath_menu" composition="4">
			<Components>
				<Link id="5" visible="Yes" fieldSourceType="DBColumn" dataType="Text" html="False" hrefType="Page" urlType="Relative" preserveParameters="GET" name="PathBeginLink" fieldSource="menu_name" wizardThemeItem="SorterLink" wizardTheme="None" wizardThemeType="File" hrefSource="../main.ccp" removeParameters="menu_id" PathID="breadcrumPath_menuPathBeginLink" wizardUseTemplateBlock="False" linkProperties="{'textSource':'{res:CCS_Main}','textSourceDB':'','hrefSource':'../cont.ccp','hrefSourceDB':'','title':'','target':'','name':'','linkParameters':{'length':0,'objectType':'linkParameters'}}">
					<Components/>
					<Events/>
					<LinkParameters/>
					<Attributes/>
					<Features/>
				</Link>
				<Link id="6" visible="Yes" fieldSourceType="DBColumn" dataType="Text" html="False" hrefType="Page" urlType="Relative" preserveParameters="GET" name="PathCategory" fieldSource="menu_name" wizardThemeItem="SorterLink" wizardTheme="None" wizardThemeType="File" hrefSource="../main.ccp" wizardUseTemplateBlock="False" linkProperties="{'textSource':'','textSourceDB':'menu_name','hrefSource':'../cont.ccp','hrefSourceDB':'','title':'','target':'','name':'','linkParameters':{'0':{'sourceType':'DataField','parameterSource':'menu_id','parameterName':'menu_id'},'length':1,'objectType':'linkParameters'}}">
					<Components/>
					<Events/>
					<LinkParameters>
						<LinkParameter id="7" sourceType="DataField" format="yyyy-mm-dd" name="menu_id" source="menu_id"/>
					</LinkParameters>
					<Attributes/>
					<Features/>
				</Link>
				<Label id="8" fieldSourceType="DBColumn" dataType="Text" html="False" generateSpan="False" name="CurrentCategory" fieldSource="menu_name" wizardTheme="None" wizardThemeType="File" PathID="breadcrumPath_menuCurrentCategory">
					<Components/>
					<Events/>
					<Attributes/>
					<Features/>
				</Label>
			</Components>
			<Events/>
			<TableParameters>
				<TableParameter id="4" conditionType="Parameter" useIsNull="True" field="menu_id" parameterSource="menu_id" dataType="Integer" logicOperator="And" searchConditionType="Equal" parameterType="URL" orderNumber="1"/>
			</TableParameters>
			<JoinTables>
				<JoinTable id="24" tableName="menu"/>
			</JoinTables>
			<JoinLinks/>
			<Fields/>
			<PKFields/>
			<SPParameters/>
			<SQLParameters/>
			<SecurityGroups/>
			<Attributes/>
			<Features/>
		</Path>
	</Components>
	<CodeFiles>
		<CodeFile id="Code" language="PHPTemplates" name="breadcrum.php" forShow="True" url="breadcrum.php" comment="//" codePage="utf-8"/>
	</CodeFiles>
	<SecurityGroups/>
	<CachingParameters/>
	<Attributes/>
	<Features/>
	<Events/>
</Page>
