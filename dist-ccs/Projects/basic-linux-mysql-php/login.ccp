<Page id="1" templateExtension="html" relativePath="." fullRelativePath="." secured="False" urlType="Relative" isIncluded="False" SSLAccess="False" isService="False" cachingEnabled="False" cachingDuration="1 minutes" wizardTheme="Basic" wizardThemeVersion="3.0" useDesign="False">
	<Components>
		<Record id="2" sourceType="Table" urlType="Relative" secured="False" allowInsert="False" allowUpdate="False" allowDelete="False" validateData="True" preserveParameters="None" returnValueType="Number" returnValueTypeForDelete="Number" returnValueTypeForInsert="Number" returnValueTypeForUpdate="Number" name="Login1" wizardCaption="{res:CCS_LoginForm}" wizardOrientation="Vertical" wizardFormMethod="post" wizardRememberMe="False" wizardFocusOnLogin="True" buttonsType="button" wizardTypeComponent="Authentication" recordDirection="Vertical" templatePageRecord="C:/Program Files/CodeChargeStudio5/Templates/Authentication/Vertical.ccp|ccsTemplate" wizardThemeApplyTo="Page" recordAddTemplatePanel="False" changedCaptionLogin="False" PathID="Login1" wizardTheme="None" wizardThemeVersion="3.0">
<Components>
<Button id="3" urlType="Relative" enableValidation="True" isDefault="False" name="Button_DoLogin" wizardCaption="{res:CCS_LoginBtn}" parentName="Login1" PathID="Login1Button_DoLogin" wizardTheme="None" wizardThemeVersion="3.0">
<Components/>
<Events>
<Event name="OnClick" type="Server">
<Actions>
<Action actionName="Login" actionCategory="Security" id="6" redirectToPreviousPage="True" loginParameter="login" passwordParameter="password" autoLoginParameter="autoLogin"/>
</Actions>
</Event>
</Events>
<Attributes/>
<Features/>
</Button>
<TextBox id="4" visible="Yes" fieldSourceType="DBColumn" dataType="Text" name="login" fieldSource="emp_login" required="True" wizardCaption="{res:CCS_Login}" wizardSize="20" wizardMaxLength="100" wizardIsPassword="False" parentName="Login1" PathID="Login1login" wizardTheme="None" wizardThemeVersion="3.0">
<Components/>
<Events/>
<Attributes/>
<Features/>
</TextBox>
<TextBox id="5" visible="Yes" fieldSourceType="DBColumn" dataType="Text" name="password" fieldSource="emp_password" required="True" wizardCaption="{res:CCS_Password}" wizardSize="20" wizardMaxLength="100" wizardIsPassword="True" parentName="Login1" PathID="Login1password" wizardTheme="None" wizardThemeVersion="3.0">
<Components/>
<Events/>
<Attributes/>
<Features/>
</TextBox>
</Components>
<Events/>
<TableParameters/>
<SPParameters/>
<SQLParameters/>
<JoinTables/>
<JoinLinks/>
<Fields/>
<PKFields/>
<ISPParameters/>
<ISQLParameters/>
<IFormElements/>
<USPParameters/>
<USQLParameters/>
<UConditions/>
<UFormElements/>
<DSPParameters/>
<DSQLParameters/>
<DConditions/>
<SecurityGroups/>
<Attributes/>
<Features/>
</Record>
</Components>
	<CodeFiles>
		<CodeFile id="Events" language="PHPTemplates" name="login_events.php" forShow="False" comment="//" codePage="utf-8"/>
<CodeFile id="Code" language="PHPTemplates" name="login.php" forShow="True" url="login.php" comment="//" codePage="utf-8"/>
</CodeFiles>
	<SecurityGroups/>
<CachingParameters/>
<Attributes/>
<Features/>
<Events>
<Event name="OnLoad" type="Client">
<Actions>
<Action actionName="Set Focus" actionCategory="General" id="7" form="Login1" name="login"/>
</Actions>
</Event>
</Events>
</Page>
