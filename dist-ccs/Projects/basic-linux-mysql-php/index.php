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

//Master Page implementation @1-51ED7C23
include_once(RelativePath . "/Designs/theme-wet-boew/sp_pe_mult.php");
//End Master Page implementation

//Initialize Page @1-BE5F9DC5
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
$sp_pe_mult = null;
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

//Initialize Objects @1-AFABE767
$Attributes = new clsAttributes("page:");
$Attributes->SetValue("pathToRoot", $PathToRoot);
$MainPage->Attributes = & $Attributes;

// Controls
$sp_pe_mult = new clssp_pe_mult("/Designs/" . $CCProjectDesign . "/", "sp_pe_mult", $MainPage);
$sp_pe_mult->Attributes = $Attributes;
$sp_pe_mult->Initialize();
$Head = new clsPanel("Head", $MainPage);
$Head->PlaceholderName = "Head";
$Content = new clsPanel("Content", $MainPage);
$MainPage->Head = & $Head;
$MainPage->Content = & $Content;
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

//Execute Components @1-E8845D9B
$sp_pe_mult->Operations();
//End Execute Components

//Go to destination page @1-FBA93089
if($Redirect)
{
    $CCSEventResult = CCGetEvent($CCSEvents, "BeforeUnload", $MainPage);
    header("Location: " . $Redirect);
    unset($Tpl);
    exit;
}
//End Go to destination page

//Show Page @1-A7888AEB
$Head->Show();
$Content->Show();
$sp_pe_mult->Tpl->SetVar("Head", $Tpl->GetVar("Panel Head"));
$sp_pe_mult->Show();
if (!isset($main_block)) $main_block = $sp_pe_mult->HTML;
$main_block = CCConvertEncoding($main_block, $FileEncoding, $CCSLocales->GetFormatInfo("Encoding"));
$CCSEventResult = CCGetEvent($CCSEvents, "BeforeOutput", $MainPage);
if ($CCSEventResult) echo $main_block;
//End Show Page

//Unload Page @1-DC36B0DA
$CCSEventResult = CCGetEvent($CCSEvents, "BeforeUnload", $MainPage);
unset($sp_pe_mult);
unset($Tpl);
//End Unload Page


?>
