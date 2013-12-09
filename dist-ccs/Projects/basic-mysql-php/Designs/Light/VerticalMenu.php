<?php
//Error reporting @1-8F636958
error_reporting(E_ALL | E_STRICT);
//End Error reporting

class clsVerticalMenu { //VerticalMenu class @1-4B8F1AB5

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

//Class_Initialize Event @1-C23A7043
    function clsVerticalMenu($RelativePath, $ComponentName, & $Parent)
    {
        global $CCSLocales;
        global $DefaultDateFormat;
        $this->ComponentName = $ComponentName;
        $this->RelativePath = $RelativePath;
        $this->Visible = true;
        $this->Parent = & $Parent;
        $this->FileName = "VerticalMenu.php";
        $this->Redirect = "";
        $this->TemplateFileName = "VerticalMenu.html";
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

//Initialize Method @1-E09353E3
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
        $this->Title = new clsPanel("Title", $this);
        $this->Title->isContentPlaceholder = true;
        $this->MenuItems = new clsPanel("MenuItems", $this);
        $this->MenuItems->isContentPlaceholder = true;
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

//Show Method @1-D77CB2D6
    function Show()
    {
        global $CCSLocales;
        $this->Tpl->block_path = "/main";
        $this->CCSEventResult = CCGetEvent($this->CCSEvents, "BeforeShow", $this);
        if(!$this->Visible) {
            $this->Tpl->block_path = $block_path;
            $this->Tpl->SetVar($this->ComponentName, "");
            return "";
        }
        $this->Tpl->SetVar("CCS_PathToCurrentPage", RelativePath . $this->RelativePath);
        $this->Tpl->SetVar("page:pathToCurrentPage", RelativePath . $this->RelativePath);
        $this->Attributes->Show();
        $this->Tpl->block_path = "";
        $this->Tpl->Parse("main", false);
        $this->HTML = $this->Tpl->GetVar("main");
        $this->CCSEventResult = CCGetEvent($this->CCSEvents, "BeforeOutput", $this);
    }
//End Show Method

} //End VerticalMenu Class @1-FCB6E20C


?>
