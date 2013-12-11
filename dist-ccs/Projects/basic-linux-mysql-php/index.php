<?php
//Error reporting @1-8F636958
error_reporting(E_ALL | E_STRICT);
//End Error reporting

//Include Common Files @1-82042FB9
define("RelativePath", ".");
define("PathToCurrentPage", "/");
define("FileName", "index.php");
include_once(RelativePath . "/Common.php");
include_once(RelativePath . "/Template.php");
include_once(RelativePath . "/Sorter.php");
include_once(RelativePath . "/Navigator.php");
//End Include Common Files

//Master Page implementation @1-04BB7BEF
include_once(RelativePath . "/Designs/theme-gcwu-intranet/MasterPage.php");
//End Master Page implementation

//Include Page implementation @11-7FA6A3DF
include_once(RelativePath . "/inc/top_menu.php");
//End Include Page implementation

//Include Page implementation @8-E5D4CE8B
include_once(RelativePath . "/inc/footer.php");
//End Include Page implementation

//Include Page implementation @24-65164D5D
include_once(RelativePath . "/main.php");
//End Include Page implementation

//Include Page implementation @22-CB21508B
include_once(RelativePath . "/inc/site_menu.php");
//End Include Page implementation

//Include Page implementation @19-5188A416
include_once(RelativePath . "/inc/breadcrum.php");
//End Include Page implementation

//Include Page implementation @26-3B9BB193
include_once(RelativePath . "/inc/light_menu.php");
//End Include Page implementation

//Initialize Page @1-D143BE23
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
$TemplateFileName = "index.html";
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

//Initialize Objects @1-865D438D
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
$TopMenu->PlaceholderName = "gcwu_gcnb";
$gcwu_gcnb = new clstop_menu("inc/", "gcwu_gcnb", $MainPage);
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
$gcwu_psnb = new clssite_menu("inc/", "gcwu_psnb", $MainPage);
$gcwu_psnb->Initialize();
$Breadcrum = new clsPanel("Breadcrum", $MainPage);
$Breadcrum->PlaceholderName = "cgwu_breadcrum";
$gcwu_breadcrum = new clsbreadcrum("inc/", "gcwu_breadcrum", $MainPage);
$gcwu_breadcrum->Initialize();
$NavMenu = new clsPanel("NavMenu", $MainPage);
$Menu = new clsPanel("Menu", $MainPage);
$Menu->PlaceholderName = "Menu";
$light_menu = new clslight_menu("inc/", "light_menu", $MainPage);
$light_menu->Initialize();
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
$MainPage->Menu = & $Menu;
$MainPage->light_menu = & $light_menu;
$TopMenu->AddComponent("gcwu_gcnb", $gcwu_gcnb);
$Footer->AddComponent("gcwu_footer", $gcwu_footer);
$Content->AddComponent("main_basic", $main_basic);
$SiteMenu->AddComponent("gcwu_psnb", $gcwu_psnb);
$Breadcrum->AddComponent("gcwu_breadcrum", $gcwu_breadcrum);
$Menu->AddComponent("light_menu", $light_menu);
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

//Initialize HTML Template @1-577E43E0
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
$CCSEventResult = CCGetEvent($CCSEvents, "BeforeShow", $MainPage);
$Attributes->SetValue("pathToRoot", "");
$Attributes->Show();
//End Initialize HTML Template

//Execute Components @1-BFF3470F
$MasterPage->Operations();
$light_menu->Operations();
$gcwu_breadcrum->Operations();
$gcwu_psnb->Operations();
$main_basic->Operations();
$gcwu_footer->Operations();
$gcwu_gcnb->Operations();
//End Execute Components

//Go to destination page @1-782ACFB7
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
    $light_menu->Class_Terminate();
    unset($light_menu);
    unset($Tpl);
    exit;
}
//End Go to destination page

//Show Page @1-1C7FA3FC
$Head->Show();
$TopMenu->Show();
$CustomCSS->Show();
$CustomScripts->Show();
$Footer->Show();
$Content->Show();
$SiteMenu->Show();
$Breadcrum->Show();
$NavMenu->Show();
$Menu->Show();
$MasterPage->Tpl->SetVar("Head", $Tpl->GetVar("Panel Head"));
$MasterPage->Tpl->SetVar("gcwu_gcnb", $Tpl->GetVar("Panel TopMenu"));
$MasterPage->Tpl->SetVar("CustomCSS", $Tpl->GetVar("Panel CustomCSS"));
$MasterPage->Tpl->SetVar("CustomScripts", $Tpl->GetVar("Panel CustomScripts"));
$MasterPage->Tpl->SetVar("Footer", $Tpl->GetVar("Panel Footer"));
$MasterPage->Tpl->SetVar("Content", $Tpl->GetVar("Panel Content"));
$MasterPage->Tpl->SetVar("SiteMenu", $Tpl->GetVar("Panel SiteMenu"));
$MasterPage->Tpl->SetVar("cgwu_breadcrum", $Tpl->GetVar("Panel Breadcrum"));
$MasterPage->Tpl->SetVar("Menu", $Tpl->GetVar("Panel Menu"));
$MasterPage->Show();
if (!isset($main_block)) $main_block = $MasterPage->HTML;
$main_block = CCConvertEncoding($main_block, $FileEncoding, $CCSLocales->GetFormatInfo("Encoding"));
$CCSEventResult = CCGetEvent($CCSEvents, "BeforeOutput", $MainPage);
if ($CCSEventResult) echo $main_block;
//End Show Page

//Unload Page @1-F17D5F40
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
$light_menu->Class_Terminate();
unset($light_menu);
unset($Tpl);
//End Unload Page


?>