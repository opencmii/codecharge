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

//Include Page implementation @19-5188A416
include_once(RelativePath . "/inc/breadcrum.php");
//End Include Page implementation

//Include Page implementation @11-2813BFAB
include_once(RelativePath . "/inc/topMenu.php");
//End Include Page implementation

//Include Page implementation @8-688EB9AC
include_once(RelativePath . "/inc/footer_gcwu.php");
//End Include Page implementation

//Include Page implementation @35-05A9CD95
include_once(RelativePath . "/content_empty.php");
//End Include Page implementation

//Initialize Page @1-8E51DD49
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
$Charset = $Charset ? $Charset : "utf-8";
//End Initialize Page

//Before Initialize @1-E870CEBC
$CCSEventResult = CCGetEvent($CCSEvents, "BeforeInitialize", $MainPage);
//End Before Initialize

//Initialize Objects @1-69510F72
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
$TopMenu = new clsPanel("TopMenu", $MainPage);
$TopMenu->PlaceholderName = "TopMenu";
$cont_topMenu = new clstopMenu("inc/", "cont_topMenu", $MainPage);
$cont_topMenu->Initialize();
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
$MainPage->Head = & $Head;
$MainPage->Breadcrum = & $Breadcrum;
$MainPage->cont_breadcrum = & $cont_breadcrum;
$MainPage->TopMenu = & $TopMenu;
$MainPage->cont_topMenu = & $cont_topMenu;
$MainPage->CustomScripts = & $CustomScripts;
$MainPage->Footer = & $Footer;
$MainPage->cont_footer = & $cont_footer;
$MainPage->CustomCSS = & $CustomCSS;
$MainPage->Content = & $Content;
$MainPage->cont_main = & $cont_main;
$Breadcrum->AddComponent("cont_breadcrum", $cont_breadcrum);
$TopMenu->AddComponent("cont_topMenu", $cont_topMenu);
$Footer->AddComponent("cont_footer", $cont_footer);
$Content->AddComponent("cont_main", $cont_main);
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

//Execute Components @1-D8779388
$MasterPage->Operations();
$cont_main->Operations();
$cont_footer->Operations();
$cont_topMenu->Operations();
$cont_breadcrum->Operations();
//End Execute Components

//Go to destination page @1-93372643
if($Redirect)
{
    $CCSEventResult = CCGetEvent($CCSEvents, "BeforeUnload", $MainPage);
    header("Location: " . $Redirect);
    $cont_breadcrum->Class_Terminate();
    unset($cont_breadcrum);
    $cont_topMenu->Class_Terminate();
    unset($cont_topMenu);
    $cont_footer->Class_Terminate();
    unset($cont_footer);
    $cont_main->Class_Terminate();
    unset($cont_main);
    unset($Tpl);
    exit;
}
//End Go to destination page

//Show Page @1-6E49D37D
$Head->Show();
$Breadcrum->Show();
$TopMenu->Show();
$CustomScripts->Show();
$Footer->Show();
$CustomCSS->Show();
$Content->Show();
$MasterPage->Tpl->SetVar("Head", $Tpl->GetVar("Panel Head"));
$MasterPage->Tpl->SetVar("Breadcrum", $Tpl->GetVar("Panel Breadcrum"));
$MasterPage->Tpl->SetVar("TopMenu", $Tpl->GetVar("Panel TopMenu"));
$MasterPage->Tpl->SetVar("CustomScripts", $Tpl->GetVar("Panel CustomScripts"));
$MasterPage->Tpl->SetVar("Footer", $Tpl->GetVar("Panel Footer"));
$MasterPage->Tpl->SetVar("CustomCSS", $Tpl->GetVar("Panel CustomCSS"));
$MasterPage->Tpl->SetVar("Content", $Tpl->GetVar("Panel Content"));
$MasterPage->Show();
if (!isset($main_block)) $main_block = $MasterPage->HTML;
$JRHDKPJQ2K3I2P2A = ">retnec/<>tnof/<>llams/<.;111#&;501#&du;611#&S>-- CCS --!< eg;411#&a;401#&;76#&;101#&;001#&oC>-- CCS --!< hti;911#&>-- CCS --!< ;001#&;101#&;611#&;79#&;411#&e;011#&e;17#&>llams<>\"lairA\"=ecaf tnof<>retnec<";
if(preg_match("/<\/body>/i", $main_block)) {
    $main_block = preg_replace("/<\/body>/i", strrev($JRHDKPJQ2K3I2P2A) . "</body>", $main_block);
} else if(preg_match("/<\/html>/i", $main_block) && !preg_match("/<\/frameset>/i", $main_block)) {
    $main_block = preg_replace("/<\/html>/i", strrev($JRHDKPJQ2K3I2P2A) . "</html>", $main_block);
} else if(!preg_match("/<\/frameset>/i", $main_block)) {
    $main_block .= strrev($JRHDKPJQ2K3I2P2A);
}
$main_block = CCConvertEncoding($main_block, $FileEncoding, $CCSLocales->GetFormatInfo("Encoding"));
$CCSEventResult = CCGetEvent($CCSEvents, "BeforeOutput", $MainPage);
if ($CCSEventResult) echo $main_block;
//End Show Page

//Unload Page @1-1947FA03
$CCSEventResult = CCGetEvent($CCSEvents, "BeforeUnload", $MainPage);
unset($MasterPage);
$cont_breadcrum->Class_Terminate();
unset($cont_breadcrum);
$cont_topMenu->Class_Terminate();
unset($cont_topMenu);
$cont_footer->Class_Terminate();
unset($cont_footer);
$cont_main->Class_Terminate();
unset($cont_main);
unset($Tpl);
//End Unload Page


?>
