<?php
//BindEvents Method @1-9BC60492
function BindEvents()
{
    global $view_tab;
    $view_tab->CCSEvents["BeforeShow"] = "view_tab_BeforeShow";
}
//End BindEvents Method

//view_tab_BeforeShow @13-16845C89
function view_tab_BeforeShow(& $sender)
{
    $view_tab_BeforeShow = true;
    $Component = & $sender;
    $Container = & CCGetParentContainer($sender);
    global $view_tab; //Compatibility
//End view_tab_BeforeShow

//Close view_tab_BeforeShow @13-89309845
    return $view_tab_BeforeShow;
}
//End Close view_tab_BeforeShow


?>
