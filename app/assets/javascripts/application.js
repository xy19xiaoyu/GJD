// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

function iniItems()
{
    $(".item_Type").each(function(){
        $(this).change(function(){
            changecategory(this);

        });
    });
    $(".items").each(function(){
        $(this).change(function(){
            changeItem(this);
        });
    });
}

var ItmeUrl = "http://"+ window.location.host +  "/items.json/";
var items;
function changecategory(obj)
{
    var rowid =$(obj).attr("rowid");
    //选择产品--品目变化
    if(items== null)
    {
        $.get(ItmeUrl,function(data,status){
            items=eval(data);
            changecategory(obj);
        });
    }else
    {
        $("#itemNo"+rowid).empty();
        $("#itemNo"+rowid).append("<option value='请选择'  data='|'>请选择</option>");
        var select = $(obj).find("option:selected").text();
        if(select !="请选择")
        {
            for(var i=0;i< items.length;i++)
            {
                if(items[i].Type == select)
                {
                    $("#itemNo"+rowid).append("<option value='"+items[i].id +"'  data='" + items[i].CategoryName + "|" + items[i].subCategoryName + "'>"+ items[i].Name +"</option>");
                }
            }
        }
        debugger;
        $("#category"+rowid).val("");
        $("#subcategory"+rowid).val("");
        $("#itemline"+rowid+"_Item_id").val("");
    }
}

function changeItem(obj)
{
    var rowid =$(obj).attr("rowid");
    var select = $(obj).find("option:selected").attr("data").split('|');
    if( $(obj).find("option:selected").attr("data") !="请选择")
    {
        $("#category"+rowid).val(select[0]);
        $("#subcategory"+rowid).val(select[1]);
        $("#itemline"+rowid+"_Item_id").val($(obj).find("option:selected").val());
    }
    else
    {
        $("#category"+rowid).val("");
        $("#subcategory"+rowid).val("");
        $("#itemline"+rowid+"_Item_id").val("");
    }
}