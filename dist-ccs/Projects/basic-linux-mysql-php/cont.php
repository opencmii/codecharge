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

//Master Page implementation @1-04BB7BEF
include_once(RelativePath . "/Designs/theme-gcwu-intranet/MasterPage.php");
//End Master Page implementation

//Include Page implementation @11-2813BFAB
include_once(RelativePath . "/inc/topMenu.php");
//End Include Page implementation

//Include Page implementation @8-E5D4CE8B
include_once(RelativePath . "/inc/footer.php");
//End Include Page implementation

//Include Page implementation @24-65164D5D
include_once(RelativePath . "/main.php");
//End Include Page implementation

//Include Page implementation @22-A45EDC57
include_once(RelativePath . "/inc/siteMenu.php");
//End Include Page implementation

//Include Page implementation @19-5188A416
include_once(RelativePath . "/inc/breadcrum.php");
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

//Initialize Objects @1-3076BFE5
$Attributes = new clsAttributes("page:");
$Attributes->SetValue("pathToRoot", $PathToRoot);
$MainPage->Attributes = & $Attributes;

// Controls
$MasterPage = new clsMasterPage("/Designs/" . $CCProjectDesign . "/", "MasterPage", $MainPage);
$MasterPage->Attributes = $Attributes;
$MasterPage->Initialize();
$Head = new clsPanel("Head", $MainPage);
$Head->PlaceholderName = "Head";
$TopMenu = new clsPanel("TopMenu", $MainPage);
$TopMenu->PlaceholderName = "TopMenu";
$gcwu_gcnb = new clstopMenu("inc/", "gcwu_gcnb", $MainPage);
$gcwu_gcnb->Initialize();
$CustomCSS = new clsPanel("CustomCSS", $MainPage);
$CustomCSS->PlaceholderName = "CustomCSS";
$CustomScripts = new clsPanel("CustomScripts", $MainPage);
$CustomScripts->PlaceholderName = "CustomScripts";
$Footer = new clsPanel("Footer", $MainPage);
$Footer->PlaceholderName = "Footer";
$gcwu_footer = new clsfooter("inc/", "gcwu_footer", $MainPage);
$gcwu_footer->Initialize();
$Content = new clsPanel("Content", $MainPage);
$Content->PlaceholderName = "Content";
$main_basic = new clsmain("", "main_basic", $MainPage);
$main_basic->Initialize();
$SiteMenu = new clsPanel("SiteMenu", $MainPage);
$SiteMenu->PlaceholderName = "SiteMenu";
$gcwu_psnb = new clssiteMenu("inc/", "gcwu_psnb", $MainPage);
$gcwu_psnb->Initialize();
$Breadcrum = new clsPanel("Breadcrum", $MainPage);
$Breadcrum->PlaceholderName = "cgwu_breadcrum";
$gcwu_breadcrum = new clsbreadcrum("inc/", "gcwu_breadcrum", $MainPage);
$gcwu_breadcrum->Initialize();
$NavMenu = new clsPanel("NavMenu", $MainPage);
$MainPage->Head = & $Head;
$MainPage->TopMenu = & $TopMenu;
$MainPage->gcwu_gcnb = & $gcwu_gcnb;
$MainPage->CustomCSS = & $CustomCSS;
$MainPage->CustomScripts = & $CustomScripts;
$MainPage->Footer = & $Footer;
$MainPage->gcwu_footer = & $gcwu_footer;
$MainPage->Content = & $Content;
$MainPage->main_basic = & $main_basic;
$MainPage->SiteMenu = & $SiteMenu;
$MainPage->gcwu_psnb = & $gcwu_psnb;
$MainPage->Breadcrum = & $Breadcrum;
$MainPage->gcwu_breadcrum = & $gcwu_breadcrum;
$MainPage->NavMenu = & $NavMenu;
$TopMenu->AddComponent("gcwu_gcnb", $gcwu_gcnb);
$Footer->AddComponent("gcwu_footer", $gcwu_footer);
$Content->AddComponent("main_basic", $main_basic);
$SiteMenu->AddComponent("gcwu_psnb", $gcwu_psnb);
$Breadcrum->AddComponent("gcwu_breadcrum", $gcwu_breadcrum);
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

//Execute Components @1-DF377014
$MasterPage->Operations();
$gcwu_breadcrum->Operations();
$gcwu_psnb->Operations();
$main_basic->Operations();
$gcwu_footer->Operations();
$gcwu_gcnb->Operations();
//End Execute Components

//Go to destination page @1-C0856F3F
if($Redirect)
{
    $CCSEventResult = CCGetEvent($CCSEvents, "BeforeUnload", $MainPage);
    header("Location: " . $Redirect);
    $gcwu_gcnb->Class_Terminate();
    unset($gcwu_gcnb);
    $gcwu_footer->Class_Terminate();
    unset($gcwu_footer);
    $main_basic->Class_Terminate();
    unset($main_basic);
    $gcwu_psnb->Class_Terminate();
    unset($gcwu_psnb);
    $gcwu_breadcrum->Class_Terminate();
    unset($gcwu_breadcrum);
    unset($Tpl);
    exit;
}
//End Go to destination page

//Show Page @1-19821289
$Head->Show();
$TopMenu->Show();
$CustomCSS->Show();
$CustomScripts->Show();
$Footer->Show();
$Content->Show();
$SiteMenu->Show();
$Breadcrum->Show();
$NavMenu->Show();
$MasterPage->Tpl->SetVar("Head", $Tpl->GetVar("Panel Head"));
$MasterPage->Tpl->SetVar("TopMenu", $Tpl->GetVar("Panel TopMenu"));
$MasterPage->Tpl->SetVar("CustomCSS", $Tpl->GetVar("Panel CustomCSS"));
$MasterPage->Tpl->SetVar("CustomScripts", $Tpl->GetVar("Panel CustomScripts"));
$MasterPage->Tpl->SetVar("Footer", $Tpl->GetVar("Panel Footer"));
$MasterPage->Tpl->SetVar("Content", $Tpl->GetVar("Panel Content"));
$MasterPage->Tpl->SetVar("SiteMenu", $Tpl->GetVar("Panel SiteMenu"));
$MasterPage->Tpl->SetVar("cgwu_breadcrum", $Tpl->GetVar("Panel Breadcrum"));
$MasterPage->Show();
if (!isset($main_block)) $main_block = $MasterPage->HTML;
$main_block = CCConvertEncoding($main_block, $FileEncoding, $CCSLocales->GetFormatInfo("Encoding"));
$CCSEventResult = CCGetEvent($CCSEvents, "BeforeOutput", $MainPage);
if ($CCSEventResult) echo $main_block;
//End Show Page

//Unload Page @1-A308E7BD
$CCSEventResult = CCGetEvent($CCSEvents, "BeforeUnload", $MainPage);
unset($MasterPage);
$gcwu_gcnb->Class_Terminate();
unset($gcwu_gcnb);
$gcwu_footer->Class_Terminate();
unset($gcwu_footer);
$main_basic->Class_Terminate();
unset($main_basic);
$gcwu_psnb->Class_Terminate();
unset($gcwu_psnb);
$gcwu_breadcrum->Class_Terminate();
unset($gcwu_breadcrum);
unset($Tpl);
//End Unload Page


?>
