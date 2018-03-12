<Page id="1" templateExtension="html" relativePath=".." fullRelativePath=".\inc" secured="False" urlType="Relative" isIncluded="False" SSLAccess="False" isService="False" cachingEnabled="False" cachingDuration="1 minutes" wizardTheme="None" wizardThemeVersion="3.0" useDesign="False" needGeneration="0">
	<Components>
		<Directory id="2" secured="False" sourceType="Table" name="menu" connection="basic_mysql_php" originalDataSource="menu" dataSource="menu cat, menu sub" categoryID="cat_menu_id" subcategoryID="sub_menu_id" wizardCaption="menu" wizardCreatePath="False" wizardNoCategories="{res:CCS_NoCategories}" wizardCaptionPath="{res:menu_DirectoryForm}" wizardUseInterVariables="True" changedCaptionDirectory="False" wizardThemeApplyTo="Page" directoryAddTemplatePanel="False">
			<Components>
				<Link id="11" visible="Yes" fieldSourceType="DBColumn" dataType="Text" html="False" hrefType="Page" urlType="Relative" preserveParameters="GET" name="CategoryLink" fieldSource="cat_menu_name" hrefSource="siteMenu.ccp" PathID="menuCategoryLink">
					<Components/>
					<Events/>
					<LinkParameters>
						<LinkParameter id="12" sourceType="DataField" format="yyyy-mm-dd" name="menu_id" source="cat_menu_id"/>
					</LinkParameters>
					<Attributes/>
					<Features/>
				</Link>
				<Link id="13" visible="Yes" fieldSourceType="DBColumn" dataType="Text" html="False" hrefType="Page" urlType="Relative" preserveParameters="GET" name="SubcategoryLink" fieldSource="sub_menu_name" hrefSource="../main.ccp" PathID="menuSubcategoryLink" wizardUseTemplateBlock="False" linkProperties="{'textSource':'','textSourceDB':'sub_menu_name','hrefSource':'../cont.ccp','hrefSourceDB':'','title':'','target':'','name':'','linkParameters':{'0':{'sourceType':'DataField','parameterSource':'sub_menu_id','parameterName':'menu_id'},'length':1,'objectType':'linkParameters'}}"><Components/>
					<Events/>
					<LinkParameters>
						<LinkParameter id="14" sourceType="DataField" format="yyyy-mm-dd" name="menu_id" source="sub_menu_id"/>
					</LinkParameters>
					<Attributes/>
					<Features/>
				</Link>
				<Link id="15" visible="Yes" fieldSourceType="DBColumn" dataType="Text" html="False" hrefType="Page" urlType="Relative" preserveParameters="GET" name="SubcategoriesTailLink" fieldSource="cat_menu_name" hrefSource="siteMenu.ccp" wizardDefaultValue="{res:CCS_More}" PathID="menuSubcategoriesTailLink">
					<Components/>
					<Events/>
					<LinkParameters>
						<LinkParameter id="16" sourceType="DataField" format="yyyy-mm-dd" name="menu_id" source="cat_menu_id"/>
					</LinkParameters>
					<Attributes/>
					<Features/>
				</Link>
			</Components>
			<Events/>
			<TableParameters>
				<TableParameter id="20" conditionType="Parameter" useIsNull="False" dataType="Integer" field="cat.menu_id_parent" logicOperator="And" orderNumber="1" parameterSource="menu_idd" parameterType="URL" searchConditionType="Equal"/>
			</TableParameters>
			<JoinTables>
				<JoinTable id="25" tableName="menu" alias="cat"/>
				<JoinTable id="26" tableName="menu" alias="sub"/>
			</JoinTables>
			<JoinLinks>
				<JoinTable2 id="19" fieldLeft="cat.menu_id" fieldRight="sub.menu_id_parent" joinType="left" tableLeft="cat" tableRight="sub"/>
			</JoinLinks>
			<Fields>
				<Field id="21" alias="cat_menu_id" fieldName="cat.menu_id" tableName="cat"/>
				<Field id="22" alias="cat_menu_name" fieldName="cat.menu_name" tableName="cat"/>
				<Field id="23" alias="sub_menu_id" fieldName="sub.menu_id" tableName="sub"/>
				<Field id="24" alias="sub_menu_name" fieldName="sub.menu_name" tableName="sub"/>
			</Fields>
			<PKFields/>
			<SPParameters/>
			<SQLParameters/>
			<SecurityGroups/>
			<Attributes/>
			<Features/>
		</Directory>
	</Components>
	<CodeFiles>
		<CodeFile id="Code" language="PHPTemplates" name="siteMenu.php" forShow="True" url="siteMenu.php" comment="//" codePage="utf-8"/>
	</CodeFiles>
	<SecurityGroups/>
	<CachingParameters/>
	<Attributes/>
	<Features/>
	<Events/>
</Page>
