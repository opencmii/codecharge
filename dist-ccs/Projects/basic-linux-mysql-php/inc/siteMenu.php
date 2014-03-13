<?php
//Error reporting @1-8F636958
error_reporting(E_ALL | E_STRICT);
//End Error reporting

class clsDirectorysiteMenumenu { //menu class @2-6D4C1B44

//Variables @2-D4D21A31

    // Public variables
    public $Parent;
    public $ComponentType = "Directory";
    public $ComponentName;
    public $Visible;
    public $Errors;
    public $ErrorBlock;
    public $ds;
    public $DataSource;
    public $IsEmpty;
    public $SorterName = "";
    public $SorterDirection = "";
    public $NumberOfColumns = 1;
    public $NumberOfSubcategories = "";

    public $CCSEvents = "";
    public $CCSEventResult;

    public $RelativePath = "";
    public $Attributes;
//End Variables

//Class_Initialize Event @2-FF78322D
    function clsDirectorysiteMenumenu($RelativePath, & $Parent)
    {
        global $FileName;
        global $CCSLocales;
        global $DefaultDateFormat;
        $this->Parent = & $Parent;
        $this->ComponentName = "menu";
        $this->Visible = True;
        $this->RelativePath = $RelativePath;
        $this->Errors = new clsErrors();
        $this->ErrorBlock = "Directory menu";
        $this->Attributes = new clsAttributes($this->ComponentName . ":");
        $this->DataSource = new clssiteMenumenuDataSource($this);
        $this->ds = & $this->DataSource;

        $this->CategoryLink = new clsControl(ccsLink, "CategoryLink", "CategoryLink", ccsText, "", CCGetRequestParam("CategoryLink", ccsGet, NULL), $this);
        $this->CategoryLink->Page = $this->RelativePath . "siteMenu.php";
        $this->SubcategoryLink = new clsControl(ccsLink, "SubcategoryLink", "SubcategoryLink", ccsText, "", CCGetRequestParam("SubcategoryLink", ccsGet, NULL), $this);
        $this->SubcategoryLink->Page = $this->RelativePath . "../cont.php";
        $this->SubcategoriesTailLink = new clsControl(ccsLink, "SubcategoriesTailLink", "SubcategoriesTailLink", ccsText, "", CCGetRequestParam("SubcategoriesTailLink", ccsGet, NULL), $this);
        $this->SubcategoriesTailLink->Page = $this->RelativePath . "siteMenu.php";
    }
//End Class_Initialize Event

//Initialize Method @2-75D22D4D
    function Initialize()
    {
        if(!$this->Visible) return;
        $this->DataSource->SetOrder($this->SorterName, $this->SorterDirection);
    }
//End Initialize Method

//Show Method @2-215C728F
    function Show()
    {
        global $Tpl;
        global $CCSLocales;
        if(!$this->Visible) return;


        $this->DataSource->Parameters["urlmenu_idd"] = CCGetFromGet("menu_idd", NULL);

        $this->CCSEventResult = CCGetEvent($this->CCSEvents, "BeforeSelect", $this);

        $this->DataSource->Prepare();
        $this->DataSource->Open();

        $CategoriesNumber = 0;
        if($this->DataSource->next_record())
        {
            $this->IsEmpty = false;
            $category_id_value = $this->DataSource->f("cat_menu_id");
            do {
                if($category_id_value != $this->DataSource->f("cat_menu_id"))
                    $CategoriesNumber++;
                $category_id_value = $this->DataSource->f("cat_menu_id");
            } while ($this->DataSource->next_record());
            $CategoriesNumber++;
        } else {
            $this->IsEmpty = true;
        }

        $this->DataSource->Open();

        $this->CCSEventResult = CCGetEvent($this->CCSEvents, "BeforeShow", $this);
        if(!$this->Visible) return;

        $this->Attributes->Show();
        $DirectoryBlock = "Directory " . $this->ComponentName;
        $ParentPath = $Tpl->block_path;
        $Tpl->block_path = $ParentPath . "/" . $DirectoryBlock;

        $ColumnNumber = 0;
        $CategoryNumber = 0;
        $NumberOfSubcategory = 0;

        $is_next_record = $this->DataSource->next_record();
        if($is_next_record)
        {
            do {
                $category_id_value = $this->DataSource->f("cat_menu_id");
                $subcategory_id_value = $this->DataSource->f("sub_menu_id");
                $this->DataSource->SetValues();
                $this->CategoryLink->SetValue($this->DataSource->CategoryLink->GetValue());
                $this->CategoryLink->Parameters = CCGetQueryString("QueryString", array("ccsForm"));
                $this->CategoryLink->Parameters = CCAddParam($this->CategoryLink->Parameters, "menu_id", $this->DataSource->f("cat_menu_id"));
                $this->SubcategoryLink->SetValue($this->DataSource->SubcategoryLink->GetValue());
                $this->SubcategoryLink->Parameters = CCGetQueryString("QueryString", array("ccsForm"));
                $this->SubcategoryLink->Parameters = CCAddParam($this->SubcategoryLink->Parameters, "menu_id", $this->DataSource->f("sub_menu_id"));
                $this->SubcategoriesTailLink->SetValue($this->DataSource->SubcategoriesTailLink->GetValue());
                $this->SubcategoriesTailLink->Parameters = CCGetQueryString("QueryString", array("ccsForm"));
                $this->SubcategoriesTailLink->Parameters = CCAddParam($this->SubcategoriesTailLink->Parameters, "menu_id", $this->DataSource->f("cat_menu_id"));
                if(strlen($subcategory_id_value)) $NumberOfSubcategory++;
                if($NumberOfSubcategory && (!strlen($this->NumberOfSubcategories) || $this->NumberOfSubcategories >= $NumberOfSubcategory)) {
                    $this->Attributes->Show();
                    $this->CCSEventResult = CCGetEvent($this->CCSEvents, "BeforeShowSubcategory", $this);
                    $Tpl->block_path = $ParentPath . "/" . $DirectoryBlock . "/Category/Subcategory";
                    $this->SubcategoryLink->Show();
                    $Tpl->block_path = $ParentPath . "/" . $DirectoryBlock;
                    $Tpl->parse("Category/Subcategory", true);
                } else if(strlen($this->NumberOfSubcategories) && ($this->NumberOfSubcategories + 1) == $NumberOfSubcategory) {
                    $Tpl->block_path = $ParentPath . "/" . $DirectoryBlock . "/Category/SubcategoriesTail";
                    $this->SubcategoriesTailLink->Show();
                    $this->Attributes->Show();
                    $Tpl->block_path = $ParentPath . "/" . $DirectoryBlock;
                    $Tpl->parseto("Category/SubcategoriesTail", true, "Category/Subcategory");
                }
                $is_next_record = $this->DataSource->next_record();
                $parse_category = (($is_next_record && $category_id_value != $this->DataSource->f("cat_menu_id")) || !$is_next_record);

                // Parse Separator
                if($parse_category) {
                    $CategoryNumber++;
                    $NumberOfSubcategory = 0;
                    $this->CCSEventResult = CCGetEvent($this->CCSEvents, "BeforeShowCategory", $this);
                    $this->Attributes->Show();
                    $Tpl->block_path = $ParentPath . "/" . $DirectoryBlock . "/Category";
                    $this->CategoryLink->Show();
                    $Tpl->block_path = $ParentPath . "/" . $DirectoryBlock;
                    $Tpl->parse("Category", true);
                    $Tpl->setblockvar("Category/Subcategory", "");
                    if($CategoryNumber >= ($CategoriesNumber / ($this->NumberOfColumns - $ColumnNumber)) && $is_next_record) {
                        $CategoriesNumber -= $CategoryNumber;
                        $ColumnNumber++;
                        $CategoryNumber = 0;
                        $Tpl->block_path = $ParentPath . "/" . $DirectoryBlock . "/ColumnSeparator";
                        $this->Attributes->Show();
                        $Tpl->block_path = $ParentPath . "/" . $DirectoryBlock;
                        $Tpl->parseto("ColumnSeparator", true, "Category");
                    } else if($is_next_record) {
                        $Tpl->block_path = $ParentPath . "/" . $DirectoryBlock . "/CategorySeparator";
                        $this->Attributes->Show();
                        $Tpl->block_path = $ParentPath . "/" . $DirectoryBlock;
                        $Tpl->parseto("CategorySeparator", true, "Category");
                    }
                } else {
                    if(!strlen($this->NumberOfSubcategories) || $this->NumberOfSubcategories >= $NumberOfSubcategory) {
                        $this->Attributes->Show();
                        $Tpl->parseto("Category/SubcategorySeparator", true, "Category/Subcategory");
                    }
                }
            } while ($is_next_record);
        }
        else // Show NoCategories block if no categories are found
        {
            $this->Attributes->Show();
            $NoCategoriesParentPath = $Tpl->block_path;
            $Tpl->block_path = $NoCategoriesParentPath . "/NoCategories";
            $Tpl->block_path = $NoCategoriesParentPath;
            $Tpl->parse("NoCategories", false);
        }

        $errors = $this->GetErrors();
        if(strlen($errors))
        {
            $Tpl->replaceblock("", $errors);
            $Tpl->block_path = $ParentPath;
            return;
        }
        $Tpl->parse();
        $Tpl->block_path = $ParentPath;
    }
//End Show Method

//GetErrors Method @2-2549C8B4
    function GetErrors()
    {
        $errors = "";
        $errors = ComposeStrings($errors, $this->CategoryLink->Errors->ToString());
        $errors = ComposeStrings($errors, $this->SubcategoryLink->Errors->ToString());
        $errors = ComposeStrings($errors, $this->SubcategoriesTailLink->Errors->ToString());
        $errors = ComposeStrings($errors, $this->Errors->ToString());
        $errors = ComposeStrings($errors, $this->DataSource->Errors->ToString());
        return $errors;
    }
//End GetErrors Method

} //End menu Class @2-FCB6E20C

class clssiteMenumenuDataSource extends clsDBbasic_mysql_php {  //menuDataSource Class @2-2CC1FBCD

//DataSource Variables @2-FFCA1A20
    public $Parent = "";
    public $CCSEvents = "";
    public $CCSEventResult;
    public $ErrorBlock;
    public $CmdExecution;

    public $CountSQL;
    public $wp;


    // Datasource fields
    public $CategoryLink;
    public $SubcategoryLink;
    public $SubcategoriesTailLink;
//End DataSource Variables

//DataSourceClass_Initialize Event @2-B1861AA3
    function clssiteMenumenuDataSource(& $Parent)
    {
        $this->Parent = & $Parent;
        $this->ErrorBlock = "Directory menu";
        $this->Initialize();
        $this->CategoryLink = new clsField("CategoryLink", ccsText, "");
        
        $this->SubcategoryLink = new clsField("SubcategoryLink", ccsText, "");
        
        $this->SubcategoriesTailLink = new clsField("SubcategoriesTailLink", ccsText, "");
        

    }
//End DataSourceClass_Initialize Event

//SetOrder Method @2-9E1383D1
    function SetOrder($SorterName, $SorterDirection)
    {
        $this->Order = "";
        $this->Order = CCGetOrder($this->Order, $SorterName, $SorterDirection, 
            "");
    }
//End SetOrder Method

//Prepare Method @2-4BCFE73B
    function Prepare()
    {
        global $CCSLocales;
        global $DefaultDateFormat;
        $this->wp = new clsSQLParameters($this->ErrorBlock);
        $this->wp->AddParameter("1", "urlmenu_idd", ccsInteger, "", "", $this->Parameters["urlmenu_idd"], "", false);
        $this->wp->Criterion[1] = $this->wp->Operation(opEqual, "cat.menu_id_parent", $this->wp->GetDBValue("1"), $this->ToSQL($this->wp->GetDBValue("1"), ccsInteger),false);
        $this->Where = 
             $this->wp->Criterion[1];
    }
//End Prepare Method

//Open Method @2-D3524856
    function Open()
    {
        $this->CCSEventResult = CCGetEvent($this->CCSEvents, "BeforeBuildSelect", $this->Parent);
        $this->CountSQL = "SELECT COUNT(*)\n\n" .
        "FROM menu cat LEFT JOIN menu sub ON\n\n" .
        "cat.menu_id = sub.menu_id_parent";
        $this->SQL = "SELECT cat.menu_id AS cat_menu_id, cat.menu_name AS cat_menu_name, sub.menu_id AS sub_menu_id, sub.menu_name AS sub_menu_name \n\n" .
        "FROM menu cat LEFT JOIN menu sub ON\n\n" .
        "cat.menu_id = sub.menu_id_parent {SQL_Where} {SQL_OrderBy}";
        $this->CCSEventResult = CCGetEvent($this->CCSEvents, "BeforeExecuteSelect", $this->Parent);
        if ($this->CountSQL) 
            $this->RecordsCount = CCGetDBValue(CCBuildSQL($this->CountSQL, $this->Where, ""), $this);
        else
            $this->RecordsCount = "CCS not counted";
        $this->query(CCBuildSQL($this->SQL, $this->Where, $this->Order));
        $this->CCSEventResult = CCGetEvent($this->CCSEvents, "AfterExecuteSelect", $this->Parent);
        $this->MoveToPage($this->AbsolutePage);
    }
//End Open Method

//SetValues Method @2-46350F2E
    function SetValues()
    {
        $this->CategoryLink->SetDBValue($this->f("cat_menu_name"));
        $this->SubcategoryLink->SetDBValue($this->f("sub_menu_name"));
        $this->SubcategoriesTailLink->SetDBValue($this->f("cat_menu_name"));
    }
//End SetValues Method

} //End menuDataSource Class @2-FCB6E20C





class clssiteMenu { //siteMenu class @1-38A3498E

//Variables @1-EEEBE252
    public $ComponentType = "IncludablePage";
    public $Connections = array();
    public $FileName = "";
    public $Redirect = "";
    public $Tpl = "";
    public $TemplateFileName = "";
    public $BlockToParse = "";
    public $ComponentName = "";
    public $Attributes = "";

    // Events;
    public $CCSEvents = "";
    public $CCSEventResult = "";
    public $RelativePath;
    public $Visible;
    public $Parent;
    public $TemplateSource;
//End Variables

//Class_Initialize Event @1-16AF8E9E
    function clssiteMenu($RelativePath, $ComponentName, & $Parent)
    {
        global $CCSLocales;
        global $DefaultDateFormat;
        $this->ComponentName = $ComponentName;
        $this->RelativePath = $RelativePath;
        $this->Visible = true;
        $this->Parent = & $Parent;
        $this->FileName = "siteMenu.php";
        $this->Redirect = "";
        $this->TemplateFileName = "siteMenu.html";
        $this->BlockToParse = "main";
        $this->TemplateEncoding = "UTF-8";
        $this->ContentType = "text/html";
    }
//End Class_Initialize Event

//Class_Terminate Event @1-44EDC05F
    function Class_Terminate()
    {
        $this->CCSEventResult = CCGetEvent($this->CCSEvents, "BeforeUnload", $this);
        unset($this->menu);
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

//Initialize Method @1-E87E9A78
    function Initialize($Path = "")
    {
        global $FileName;
        global $CCSLocales;
        global $DefaultDateFormat;
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
        $this->DBbasic_mysql_php = new clsDBbasic_mysql_php();
        $this->Connections["basic_mysql_php"] = & $this->DBbasic_mysql_php;

        // Create Components
        $this->menu = new clsDirectorysiteMenumenu($this->RelativePath, $this);
        $this->menu->Initialize();
        $this->BindEvents();
        $this->CCSEventResult = CCGetEvent($this->CCSEvents, "OnInitializeView", $this);
    }
//End Initialize Method

//Show Method @1-39AF2D80
    function Show()
    {
        global $Tpl;
        global $CCSLocales;
        $block_path = $Tpl->block_path;
        if ($this->TemplateSource) {
            $Tpl->LoadTemplateFromStr($this->TemplateSource, $this->ComponentName, $this->TemplateEncoding);
        } else {
            $Tpl->LoadTemplate("/inc/" . $this->TemplateFileName, $this->ComponentName, $this->TemplateEncoding, "remove");
        }
        $Tpl->block_path = $Tpl->block_path . "/" . $this->ComponentName;
        $this->CCSEventResult = CCGetEvent($this->CCSEvents, "BeforeShow", $this);
        if(!$this->Visible) {
            $Tpl->block_path = $block_path;
            $Tpl->SetVar($this->ComponentName, "");
            return "";
        }
        $this->Attributes->Show();
        $this->menu->Show();
        $Tpl->Parse();
        $Tpl->block_path = $block_path;
        $TplData = $Tpl->GetVar($this->ComponentName);
        $Tpl->SetVar($this->ComponentName, $TplData);
        $this->CCSEventResult = CCGetEvent($this->CCSEvents, "BeforeOutput", $this);
    }
//End Show Method

} //End siteMenu Class @1-FCB6E20C
?>
