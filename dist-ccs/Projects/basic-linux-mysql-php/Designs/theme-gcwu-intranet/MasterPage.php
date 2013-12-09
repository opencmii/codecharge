<?php
//Error reporting @1-8F636958
error_reporting(E_ALL | E_STRICT);
//End Error reporting

class clsMasterPage { //MasterPage class @1-BFE8F48A

//Variables @1-6DB8BB64
    public $ComponentType = "IncludablePage";
    public $Connections = array();
    public $FileName = "";
    public $Redirect = "";
    public $Tpl = "";
    public $TemplateFileName = "";
    public $BlockToParse = "";
    public $ComponentName = "";
    public $Attributes = "";
    public $PathToCurrentMasterPage = "";
    public $TemplatePathValue = "";
    public $HTML;

    // Events;
    public $CCSEvents = "";
    public $CCSEventResult = "";
    public $RelativePath;
    public $Visible;
    public $Parent;
    public $TemplateSource;
//End Variables

//Class_Initialize Event @1-410B11F7
    function clsMasterPage($RelativePath, $ComponentName, & $Parent)
    {
        global $CCSLocales;
        global $DefaultDateFormat;
        $this->ComponentName = $ComponentName;
        $this->RelativePath = $RelativePath;
        $this->Visible = true;
        $this->Parent = & $Parent;
        $this->FileName = "MasterPage.php";
        $this->Redirect = "";
        $this->TemplateFileName = "MasterPage.html";
        $this->BlockToParse = "main";
        $this->TemplateEncoding = "UTF-8";
        $this->ContentType = "text/html";
    }
//End Class_Initialize Event

//Class_Terminate Event @1-32FD4740
    function Class_Terminate()
    {
        $this->CCSEventResult = CCGetEvent($this->CCSEvents, "BeforeUnload", $this);
    }
//End Class_Terminate Event

//BindEvents Method @1-0DAD0D56
    function BindEvents()
    {
        $this->CCSEventResult = CCGetEvent($this->CCSEvents, "AfterInitialize", $this);
    }
//End BindEvents Method

//Operations Method @1-7E2A14CF
    function Operations()
    {
        global $Redirect;
        if(!$this->Visible)
            return "";
    }
//End Operations Method

//Initialize Method @1-C801C007
    function Initialize($Path = "")
    {
        global $FileName;
        global $CCSLocales;
        global $DefaultDateFormat;
        global $PathToCurrentMasterPage;
        $this->TemplatePathValue = $Path;
        $PathToCurrentMasterPage = $this->RelativePath;
        global $Scripts;
        $IncScripts = "|";
        $SList = explode("|", $IncScripts);
        foreach ($SList as $Script) {
            if ($Script != "" && strpos($Scripts, "|" . $Script . "|") === false)  $Scripts = $Scripts . $Script . "|";
        }
        $this->CCSEventResult = CCGetEvent($this->CCSEvents, "BeforeInitialize", $this);
        if(!$this->Visible)
            return "";
        $this->Attributes = & $this->Parent->Attributes;

        // Create Components
        $this->Link1 = new clsControl(ccsLink, "Link1", "Link1", ccsText, "", CCGetRequestParam("Link1", ccsGet, NULL), $this);
        $this->Link1->Parameters = CCGetQueryString("QueryString", array("ccsForm"));
        $this->Link1->Parameters = CCAddParam($this->Link1->Parameters, "locale", CCGetFromGet("{res:gcwu_gcnb_lang2_reverse}", NULL));
        $this->Link1->Page = "{page:Filename}";
        $this->gcwu_srchbx = new clsPanel("gcwu_srchbx", $this);
        $this->gcwu_subsite = new clsPanel("gcwu_subsite", $this);
        $this->Content = new clsPanel("Content", $this);
        $this->Content->isContentPlaceholder = true;
        $this->Head = new clsPanel("Head", $this);
        $this->Head->isContentPlaceholder = true;
        $this->gcwu_gcnb = new clsPanel("gcwu_gcnb", $this);
        $this->gcwu_gcnb->isContentPlaceholder = true;
        $this->CustomCSS = new clsPanel("CustomCSS", $this);
        $this->CustomCSS->isContentPlaceholder = true;
        $this->CustomScripts = new clsPanel("CustomScripts", $this);
        $this->CustomScripts->isContentPlaceholder = true;
        $this->Footer = new clsPanel("Footer", $this);
        $this->Footer->isContentPlaceholder = true;
        $this->cgwu_breadcrum = new clsPanel("cgwu_breadcrum", $this);
        $this->cgwu_breadcrum->isContentPlaceholder = true;
        $this->SiteMenu = new clsPanel("SiteMenu", $this);
        $this->SiteMenu->isContentPlaceholder = true;
        $this->gcwu_srchbx->Visible = false;
        $this->BindEvents();
        $this->CCSEventResult = CCGetEvent($this->CCSEvents, "OnInitializeView", $this);
        $this->Tpl = new clsTemplate();
        if ($this->TemplateSource) {
            $this->Tpl->LoadTemplateFromStr($this->TemplateSource, "main", $this->TemplateEncoding);
        } else {
            $this->Tpl->LoadTemplate($this->RelativePath . $this->TemplateFileName, "main", $this->TemplateEncoding);
        }
    }
//End Initialize Method

//Show Method @1-8A7828AF
    function Show()
    {
        global $CCSLocales;
        $this->Tpl->block_path = "/main";
        $this->Attributes->SetValue("project_name", "Project X");
        $this->CCSEventResult = CCGetEvent($this->CCSEvents, "BeforeShow", $this);
        if(!$this->Visible) {
            $this->Tpl->block_path = $block_path;
            $this->Tpl->SetVar($this->ComponentName, "");
            return "";
        }
        $this->Tpl->SetVar("CCS_PathToCurrentPage", RelativePath . $this->RelativePath);
        $this->Tpl->SetVar("page:pathToCurrentPage", RelativePath . $this->RelativePath);
        $this->Attributes->Show();
        $this->Link1->Show();
        $this->gcwu_srchbx->Show();
        $this->gcwu_subsite->Show();
        $this->Tpl->block_path = "";
        $this->Tpl->Parse("main", false);
        $this->HTML = $this->Tpl->GetVar("main");
        $this->CCSEventResult = CCGetEvent($this->CCSEvents, "BeforeOutput", $this);
    }
//End Show Method

} //End MasterPage Class @1-FCB6E20C


?>
