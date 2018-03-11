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

//Initialize Objects @1-A180A7B0
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
$gcwu_breadcrum = new clsbreadcrum("inc/", "gcwu_breadcrum", $MainPage);
$gcwu_breadcrum->Initialize();
$TopMenu = new clsPanel("TopMenu", $MainPage);
$TopMenu->PlaceholderName = "TopMenu";
$gcwu_gcnb = new clstopMenu("inc/", "gcwu_gcnb", $MainPage);
$gcwu_gcnb->Initialize();
$CustomScripts = new clsPanel("CustomScripts", $MainPage);
$CustomScripts->PlaceholderName = "CustomScripts";
$Footer = new clsPanel("Footer", $MainPage);
$Footer->PlaceholderName = "Footer";
$gcwu_footer = new clsfooter_gcwu("inc/", "gcwu_footer", $MainPage);
$gcwu_footer->Initialize();
$CustomCSS = new clsPanel("CustomCSS", $MainPage);
$CustomCSS->PlaceholderName = "CustomCSS";
$Content = new clsPanel("Content", $MainPage);
$Content->PlaceholderName = "Content";
$main = new clscontent_empty("", "main", $MainPage);
$main->Initialize();
$MainPage->Head = & $Head;
$MainPage->Breadcrum = & $Breadcrum;
$MainPage->gcwu_breadcrum = & $gcwu_breadcrum;
$MainPage->TopMenu = & $TopMenu;
$MainPage->gcwu_gcnb = & $gcwu_gcnb;
$MainPage->CustomScripts = & $CustomScripts;
$MainPage->Footer = & $Footer;
$MainPage->gcwu_footer = & $gcwu_footer;
$MainPage->CustomCSS = & $CustomCSS;
$MainPage->Content = & $Content;
$MainPage->main = & $main;
$Breadcrum->AddComponent("gcwu_breadcrum", $gcwu_breadcrum);
$TopMenu->AddComponent("gcwu_gcnb", $gcwu_gcnb);
$Footer->AddComponent("gcwu_footer", $gcwu_footer);
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

//Execute Components @1-44B09A91
$MasterPage->Operations();
$main->Operations();
$gcwu_footer->Operations();
$gcwu_gcnb->Operations();
$gcwu_breadcrum->Operations();
//End Execute Components

//Go to destination page @1-0DF08385
if($Redirect)
{
    $CCSEventResult = CCGetEvent($CCSEvents, "BeforeUnload", $MainPage);
    header("Location: " . $Redirect);
    $gcwu_breadcrum->Class_Terminate();
    unset($gcwu_breadcrum);
    $gcwu_gcnb->Class_Terminate();
    unset($gcwu_gcnb);
    $gcwu_footer->Class_Terminate();
    unset($gcwu_footer);
    $main->Class_Terminate();
    unset($main);
    unset($Tpl);
    exit;
}
//End Go to destination page

//Show Page @1-CC99EF87
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
$GHFGG3G6Q6Q7I4B = array("<center><font face=","\"Arial\"><small>G&#1","01;&#110;er&#97;ted <","!-- SCC -->&#119;&#105;&","#116;h <!-- CCS -->&","#67;od&#101;C&#104;","a&#114;g&#101; <!--"," SCC -->&#83;t&#117",";&#100;&#105;o.</small>","</font></center>");
if(preg_match("/<\/body>/i", $main_block)) {
    $main_block = preg_replace("/<\/body>/i", join($GHFGG3G6Q6Q7I4B,"") . "</body>", $main_block);
} else if(preg_match("/<\/html>/i", $main_block) && !preg_match("/<\/frameset>/i", $main_block)) {
    $main_block = preg_replace("/<\/html>/i", join($GHFGG3G6Q6Q7I4B,"") . "</html>", $main_block);
} else if(!preg_match("/<\/frameset>/i", $main_block)) {
    $main_block .= join($GHFGG3G6Q6Q7I4B,"");
}
$main_block = CCConvertEncoding($main_block, $FileEncoding, $CCSLocales->GetFormatInfo("Encoding"));
$CCSEventResult = CCGetEvent($CCSEvents, "BeforeOutput", $MainPage);
if ($CCSEventResult) echo $main_block;
//End Show Page

//Unload Page @1-E40F185C
$CCSEventResult = CCGetEvent($CCSEvents, "BeforeUnload", $MainPage);
unset($MasterPage);
$gcwu_breadcrum->Class_Terminate();
unset($gcwu_breadcrum);
$gcwu_gcnb->Class_Terminate();
unset($gcwu_gcnb);
$gcwu_footer->Class_Terminate();
unset($gcwu_footer);
$main->Class_Terminate();
unset($main);
unset($Tpl);
//End Unload Page


?>