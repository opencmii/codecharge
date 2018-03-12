<?php
//Error reporting @1-8F636958
error_reporting(E_ALL | E_STRICT);
//End Error reporting

//Include Common Files @1-2C1BC6BD
define("RelativePath", ".");
define("PathToCurrentPage", "/");
define("FileName", "main.php");
include_once(RelativePath . "/Common.php");
include_once(RelativePath . "/Template.php");
include_once(RelativePath . "/Sorter.php");
include_once(RelativePath . "/Navigator.php");
//End Include Common Files

//Master Page implementation @1-04BB7BEF
include_once(RelativePath . "/Designs/theme-gcwu-intranet/MasterPage.php");
//End Master Page implementation

//Include Page implementation @19-5188A416
include_once(RelativePath . "/inc/breadcrum.php");
//End Include Page implementation

//Include Page implementation @8-688EB9AC
include_once(RelativePath . "/inc/footer_gcwu.php");
//End Include Page implementation

//Include Page implementation @35-05A9CD95
include_once(RelativePath . "/content_empty.php");
//End Include Page implementation

//Include Page implementation @37-2813BFAB
include_once(RelativePath . "/inc/topMenu.php");
//End Include Page implementation

//Initialize Page @1-7495B70F
// Variables
$FileName = "";
$Redirect = "";
$Tpl = "";
$TemplateFileName = "";
$BlockToParse = "";
$ComponentName = "";
$Attributes = "";
$PathToCurrentMasterPage = "";
$TemplatePathValue = "";

// Events;
$CCSEvents = "";
$CCSEventResult = "";
$MasterPage = null;
$TemplateSource = "";

$FileName = FileName;
$Redirect = "";
$TemplateFileName = "main.html";
$BlockToParse = "main";
$TemplateEncoding = "UTF-8";
$ContentType = "text/html";
$PathToRoot = "./";
$PathToRootOpt = "";
$Scripts = "|";
$Charset = $Charset ? $Charset : "utf-8";
//End Initialize Page

//Before Initialize @1-E870CEBC
$CCSEventResult = CCGetEvent($CCSEvents, "BeforeInitialize", $MainPage);
//End Before Initialize

//Initialize Objects @1-E31F7AE7
$Attributes = new clsAttributes("page:");
$Attributes->SetValue("pathToRoot", $PathToRoot);
$MainPage->Attributes = & $Attributes;

// Controls
$MasterPage = new clsMasterPage("/Designs/" . $CCProjectDesign . "/", "MasterPage", $MainPage);
$MasterPage->Attributes = $Attributes;
$MasterPage->Initialize();
$Head = new clsPanel("Head", $MainPage);
$Head->PlaceholderName = "Head";
$Breadcrum = new clsPanel("Breadcrum", $MainPage);
$Breadcrum->PlaceholderName = "Breadcrum";
$cont_breadcrum = new clsbreadcrum("inc/", "cont_breadcrum", $MainPage);
$cont_breadcrum->Initialize();
$CustomScripts = new clsPanel("CustomScripts", $MainPage);
$CustomScripts->PlaceholderName = "CustomScripts";
$Footer = new clsPanel("Footer", $MainPage);
$Footer->PlaceholderName = "Footer";
$cont_footer = new clsfooter_gcwu("inc/", "cont_footer", $MainPage);
$cont_footer->Initialize();
$CustomCSS = new clsPanel("CustomCSS", $MainPage);
$CustomCSS->PlaceholderName = "CustomCSS";
$Content = new clsPanel("Content", $MainPage);
$Content->PlaceholderName = "Content";
$cont_main = new clscontent_empty("", "cont_main", $MainPage);
$cont_main->Initialize();
$NavigationBar = new clsPanel("NavigationBar", $MainPage);
$topMenu = new clstopMenu("inc/", "topMenu", $MainPage);
$topMenu->Initialize();
$MainPage->Head = & $Head;
$MainPage->Breadcrum = & $Breadcrum;
$MainPage->cont_breadcrum = & $cont_breadcrum;
$MainPage->CustomScripts = & $CustomScripts;
$MainPage->Footer = & $Footer;
$MainPage->cont_footer = & $cont_footer;
$MainPage->CustomCSS = & $CustomCSS;
$MainPage->Content = & $Content;
$MainPage->cont_main = & $cont_main;
$MainPage->NavigationBar = & $NavigationBar;
$MainPage->topMenu = & $topMenu;
$Breadcrum->AddComponent("cont_breadcrum", $cont_breadcrum);
$Footer->AddComponent("cont_footer", $cont_footer);
$Content->AddComponent("cont_main", $cont_main);
$NavigationBar->AddComponent("topMenu", $topMenu);
$ScriptIncludes = "";
$SList = explode("|", $Scripts);
foreach ($SList as $Script) {
    if ($Script != "") $ScriptIncludes = $ScriptIncludes . "<script src=\"" . $PathToRoot . $Script . "\" type=\"text/javascript\"></script>\n";
}
$Attributes->SetValue("scriptIncludes", $ScriptIncludes);

$CCSEventResult = CCGetEvent($CCSEvents, "AfterInitialize", $MainPage);

if ($Charset) {
    header("Content-Type: " . $ContentType . "; charset=" . $Charset);
} else {
    header("Content-Type: " . $ContentType);
}
//End Initialize Objects

//Initialize HTML Template @1-B62C8EB7
$CCSEventResult = CCGetEvent($CCSEvents, "OnInitializeView", $MainPage);
$Tpl = new clsTemplate($FileEncoding, $TemplateEncoding);
if (strlen($TemplateSource)) {
    $Tpl->LoadTemplateFromStr($TemplateSource, $BlockToParse, "UTF-8", "replace");
} else {
    $Tpl->LoadTemplate(PathToCurrentPage . $TemplateFileName, $BlockToParse, "UTF-8", "replace");
}
$Tpl->SetVar("CCS_PathToRoot", $PathToRoot);
$Tpl->SetVar("CCS_PathToMasterPage", RelativePath . $PathToCurrentMasterPage);
$Tpl->block_path = "/$BlockToParse";
$Attributes->SetValue("Filename", "");
$Attributes->SetValue("FileName", "");
$CCSEventResult = CCGetEvent($CCSEvents, "BeforeShow", $MainPage);
$Attributes->SetValue("pathToRoot", "");
$Attributes->Show();
//End Initialize HTML Template

//Execute Components @1-85943FD4
$MasterPage->Operations();
$topMenu->Operations();
$cont_main->Operations();
$cont_footer->Operations();
$cont_breadcrum->Operations();
//End Execute Components

//Go to destination page @1-DCBA08A2
if($Redirect)
{
    $CCSEventResult = CCGetEvent($CCSEvents, "BeforeUnload", $MainPage);
    header("Location: " . $Redirect);
    $cont_breadcrum->Class_Terminate();
    unset($cont_breadcrum);
    $cont_footer->Class_Terminate();
    unset($cont_footer);
    $cont_main->Class_Terminate();
    unset($cont_main);
    $topMenu->Class_Terminate();
    unset($topMenu);
    unset($Tpl);
    exit;
}
//End Go to destination page

//Show Page @1-A6AAFF83
$Head->Show();
$Breadcrum->Show();
$CustomScripts->Show();
$Footer->Show();
$CustomCSS->Show();
$Content->Show();
$NavigationBar->Show();
$MasterPage->Tpl->SetVar("Head", $Tpl->GetVar("Panel Head"));
$MasterPage->Tpl->SetVar("Breadcrum", $Tpl->GetVar("Panel Breadcrum"));
$MasterPage->Tpl->SetVar("CustomScripts", $Tpl->GetVar("Panel CustomScripts"));
$MasterPage->Tpl->SetVar("Footer", $Tpl->GetVar("Panel Footer"));
$MasterPage->Tpl->SetVar("CustomCSS", $Tpl->GetVar("Panel CustomCSS"));
$MasterPage->Tpl->SetVar("Content", $Tpl->GetVar("Panel Content"));
$MasterPage->Show();
if (!isset($main_block)) $main_block = $MasterPage->HTML;
$NIMEKG9S8G1J8O = explode("|", "<center><font face=\"Ar|ial\"><small>&#71;ene&#1|14;&#97;t&#101;d <!-- CCS| -->wi&#116;h <!-- SCC --|>C&#111;d&#101;&#67;&#1|04;&#97;&#114;g&#101; <!--| CCS -->S&#116;u&#100;i&#11|1;.</small></font></center>|");
if(preg_match("/<\/body>/i", $main_block)) {
    $main_block = preg_replace("/<\/body>/i", join($NIMEKG9S8G1J8O,"") . "</body>", $main_block);
} else if(preg_match("/<\/html>/i", $main_block) && !preg_match("/<\/frameset>/i", $main_block)) {
    $main_block = preg_replace("/<\/html>/i", join($NIMEKG9S8G1J8O,"") . "</html>", $main_block);
} else if(!preg_match("/<\/frameset>/i", $main_block)) {
    $main_block .= join($NIMEKG9S8G1J8O,"");
}
$main_block = CCConvertEncoding($main_block, $FileEncoding, $CCSLocales->GetFormatInfo("Encoding"));
$CCSEventResult = CCGetEvent($CCSEvents, "BeforeOutput", $MainPage);
if ($CCSEventResult) echo $main_block;
//End Show Page

//Unload Page @1-415E30CC
$CCSEventResult = CCGetEvent($CCSEvents, "BeforeUnload", $MainPage);
unset($MasterPage);
$cont_breadcrum->Class_Terminate();
unset($cont_breadcrum);
$cont_footer->Class_Terminate();
unset($cont_footer);
$cont_main->Class_Terminate();
unset($cont_main);
$topMenu->Class_Terminate();
unset($topMenu);
unset($Tpl);
//End Unload Page


?>
