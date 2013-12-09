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

//Include Page implementation @22-CB21508B
include_once(RelativePath . "/inc/site_menu.php");
//End Include Page implementation

//Include Page implementation @19-72A92FB7
include_once(RelativePath . "/breadcrum.php");
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

//Initialize Objects @1-6DC092F1
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
$SiteMenu = new clsPanel("SiteMenu", $MainPage);
$gcwu_psnb = new clssite_menu("inc/", "gcwu_psnb", $MainPage);
$gcwu_psnb->Initialize();
$Breadcrum = new clsPanel("Breadcrum", $MainPage);
$Breadcrum->PlaceholderName = "cgwu_breadcrum";
$gcwu_breadcrum = new clsbreadcrum("", "gcwu_breadcrum", $MainPage);
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
$MainPage->SiteMenu = & $SiteMenu;
$MainPage->gcwu_psnb = & $gcwu_psnb;
$MainPage->Breadcrum = & $Breadcrum;
$MainPage->gcwu_breadcrum = & $gcwu_breadcrum;
$MainPage->NavMenu = & $NavMenu;
$TopMenu->AddComponent("gcwu_gcnb", $gcwu_gcnb);
$Footer->AddComponent("gcwu_footer", $gcwu_footer);
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

//Execute Components @1-9D2D491A
$MasterPage->Operations();
$gcwu_breadcrum->Operations();
$gcwu_psnb->Operations();
$gcwu_footer->Operations();
$gcwu_gcnb->Operations();
//End Execute Components

//Go to destination page @1-0D9FD341
if($Redirect)
{
    $CCSEventResult = CCGetEvent($CCSEvents, "BeforeUnload", $MainPage);
    header("Location: " . $Redirect);
    $gcwu_gcnb->Class_Terminate();
    unset($gcwu_gcnb);
    $gcwu_footer->Class_Terminate();
    unset($gcwu_footer);
    $gcwu_psnb->Class_Terminate();
    unset($gcwu_psnb);
    $gcwu_breadcrum->Class_Terminate();
    unset($gcwu_breadcrum);
    unset($Tpl);
    exit;
}
//End Go to destination page

//Show Page @1-8F4E32EB
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
$MasterPage->Tpl->SetVar("gcwu_gcnb", $Tpl->GetVar("Panel TopMenu"));
$MasterPage->Tpl->SetVar("CustomCSS", $Tpl->GetVar("Panel CustomCSS"));
$MasterPage->Tpl->SetVar("CustomScripts", $Tpl->GetVar("Panel CustomScripts"));
$MasterPage->Tpl->SetVar("Footer", $Tpl->GetVar("Panel Footer"));
$MasterPage->Tpl->SetVar("Content", $Tpl->GetVar("Panel Content"));
$MasterPage->Tpl->SetVar("cgwu_breadcrum", $Tpl->GetVar("Panel Breadcrum"));
$MasterPage->Show();
if (!isset($main_block)) $main_block = $MasterPage->HTML;
$main_block = CCConvertEncoding($main_block, $FileEncoding, $CCSLocales->GetFormatInfo("Encoding"));
$CCSEventResult = CCGetEvent($CCSEvents, "BeforeOutput", $MainPage);
if ($CCSEventResult) echo $main_block;
//End Show Page

//Unload Page @1-7DBA7B27
$CCSEventResult = CCGetEvent($CCSEvents, "BeforeUnload", $MainPage);
unset($MasterPage);
$gcwu_gcnb->Class_Terminate();
unset($gcwu_gcnb);
$gcwu_footer->Class_Terminate();
unset($gcwu_footer);
$gcwu_psnb->Class_Terminate();
unset($gcwu_psnb);
$gcwu_breadcrum->Class_Terminate();
unset($gcwu_breadcrum);
unset($Tpl);
//End Unload Page


?>
