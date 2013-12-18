<?php
//Error reporting @1-8F636958
error_reporting(E_ALL | E_STRICT);
//End Error reporting

//Include Common Files @1-99021A05
define("RelativePath", ".");
define("PathToCurrentPage", "/");
define("FileName", "cont.php");
include_once(RelativePath . "/Common.php");
include_once(RelativePath . "/Template.php");
include_once(RelativePath . "/Sorter.php");
include_once(RelativePath . "/Navigator.php");
//End Include Common Files

//Master Page implementation @1-CC89CAAB
include_once(RelativePath . "/Designs/theme-wet-boew/MasterPage.php");
//End Master Page implementation

//Include Page implementation @8-E5D4CE8B
include_once(RelativePath . "/inc/footer.php");
//End Include Page implementation

//Include Page implementation @19-5188A416
include_once(RelativePath . "/inc/breadcrum.php");
//End Include Page implementation

//Include Page implementation @22-A45EDC57
include_once(RelativePath . "/inc/siteMenu.php");
//End Include Page implementation

//Include Page implementation @11-2813BFAB
include_once(RelativePath . "/inc/topMenu.php");
//End Include Page implementation

//Include Page implementation @30-65164D5D
include_once(RelativePath . "/main.php");
//End Include Page implementation

//Initialize Page @1-9F99DBCB
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
$TemplateFileName = "cont.html";
$BlockToParse = "main";
$TemplateEncoding = "UTF-8";
$ContentType = "text/html";
$PathToRoot = "./";
$PathToRootOpt = "";
$Scripts = "|";
//End Initialize Page

//Before Initialize @1-E870CEBC
$CCSEventResult = CCGetEvent($CCSEvents, "BeforeInitialize", $MainPage);
//End Before Initialize

//Initialize Objects @1-5DF91654
$Attributes = new clsAttributes("page:");
$Attributes->SetValue("pathToRoot", $PathToRoot);
$MainPage->Attributes = & $Attributes;

// Controls
$MasterPage = new clsMasterPage("/Designs/theme-wet-boew/", "MasterPage", $MainPage);
$MasterPage->Attributes = $Attributes;
$MasterPage->Initialize();
$Head = new clsPanel("Head", $MainPage);
$Head->PlaceholderName = "Head";
$Footer = new clsPanel("Footer", $MainPage);
$Footer->PlaceholderName = "Footer";
$gcwu_footer = new clsfooter("inc/", "gcwu_footer", $MainPage);
$gcwu_footer->Initialize();
$CustomScripts = new clsPanel("CustomScripts", $MainPage);
$CustomCSS = new clsPanel("CustomCSS", $MainPage);
$Breadcrum = new clsPanel("Breadcrum", $MainPage);
$Breadcrum->PlaceholderName = "cgwu_breadcrum";
$gcwu_breadcrum = new clsbreadcrum("inc/", "gcwu_breadcrum", $MainPage);
$gcwu_breadcrum->Initialize();
$SiteMenu = new clsPanel("SiteMenu", $MainPage);
$SiteMenu->PlaceholderName = "SiteMenu";
$gcwu_psnb = new clssiteMenu("inc/", "gcwu_psnb", $MainPage);
$gcwu_psnb->Initialize();
$TopMenu = new clsPanel("TopMenu", $MainPage);
$TopMenu->PlaceholderName = "TopMenu";
$gcwu_gcnb = new clstopMenu("inc/", "gcwu_gcnb", $MainPage);
$gcwu_gcnb->Initialize();
$Content = new clsPanel("Content", $MainPage);
$main = new clsmain("", "main", $MainPage);
$main->Initialize();
$MainPage->Head = & $Head;
$MainPage->Footer = & $Footer;
$MainPage->gcwu_footer = & $gcwu_footer;
$MainPage->CustomScripts = & $CustomScripts;
$MainPage->CustomCSS = & $CustomCSS;
$MainPage->Breadcrum = & $Breadcrum;
$MainPage->gcwu_breadcrum = & $gcwu_breadcrum;
$MainPage->SiteMenu = & $SiteMenu;
$MainPage->gcwu_psnb = & $gcwu_psnb;
$MainPage->TopMenu = & $TopMenu;
$MainPage->gcwu_gcnb = & $gcwu_gcnb;
$MainPage->Content = & $Content;
$MainPage->main = & $main;
$Footer->AddComponent("gcwu_footer", $gcwu_footer);
$Breadcrum->AddComponent("gcwu_breadcrum", $gcwu_breadcrum);
$SiteMenu->AddComponent("gcwu_psnb", $gcwu_psnb);
$TopMenu->AddComponent("gcwu_gcnb", $gcwu_gcnb);
$Content->AddComponent("main", $main);
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

//Execute Components @1-D50AF6A0
$MasterPage->Operations();
$main->Operations();
$gcwu_gcnb->Operations();
$gcwu_psnb->Operations();
$gcwu_breadcrum->Operations();
$gcwu_footer->Operations();
//End Execute Components

//Go to destination page @1-C0156DEF
if($Redirect)
{
    $CCSEventResult = CCGetEvent($CCSEvents, "BeforeUnload", $MainPage);
    header("Location: " . $Redirect);
    $gcwu_footer->Class_Terminate();
    unset($gcwu_footer);
    $gcwu_breadcrum->Class_Terminate();
    unset($gcwu_breadcrum);
    $gcwu_psnb->Class_Terminate();
    unset($gcwu_psnb);
    $gcwu_gcnb->Class_Terminate();
    unset($gcwu_gcnb);
    $main->Class_Terminate();
    unset($main);
    unset($Tpl);
    exit;
}
//End Go to destination page

//Show Page @1-A663C207
$Head->Show();
$Footer->Show();
$CustomScripts->Show();
$CustomCSS->Show();
$Breadcrum->Show();
$SiteMenu->Show();
$TopMenu->Show();
$Content->Show();
$MasterPage->Tpl->SetVar("Head", $Tpl->GetVar("Panel Head"));
$MasterPage->Tpl->SetVar("Footer", $Tpl->GetVar("Panel Footer"));
$MasterPage->Tpl->SetVar("cgwu_breadcrum", $Tpl->GetVar("Panel Breadcrum"));
$MasterPage->Tpl->SetVar("SiteMenu", $Tpl->GetVar("Panel SiteMenu"));
$MasterPage->Tpl->SetVar("TopMenu", $Tpl->GetVar("Panel TopMenu"));
$MasterPage->Show();
if (!isset($main_block)) $main_block = $MasterPage->HTML;
$main_block = CCConvertEncoding($main_block, $FileEncoding, $CCSLocales->GetFormatInfo("Encoding"));
$CCSEventResult = CCGetEvent($CCSEvents, "BeforeOutput", $MainPage);
if ($CCSEventResult) echo $main_block;
//End Show Page

//Unload Page @1-2802F93B
$CCSEventResult = CCGetEvent($CCSEvents, "BeforeUnload", $MainPage);
unset($MasterPage);
$gcwu_footer->Class_Terminate();
unset($gcwu_footer);
$gcwu_breadcrum->Class_Terminate();
unset($gcwu_breadcrum);
$gcwu_psnb->Class_Terminate();
unset($gcwu_psnb);
$gcwu_gcnb->Class_Terminate();
unset($gcwu_gcnb);
$main->Class_Terminate();
unset($main);
unset($Tpl);
//End Unload Page


?>
