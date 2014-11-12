var initPage;
initPage = function ()
{

    //===== Hide/show sidebar =====//
    $('.fullview').click(function () {
        $("body").toggleClass("clean");
        $('#sidebar').toggleClass("hide-sidebar mobile-sidebar");
        $('#content').toggleClass("full-content");
    });


    //===== Hide/show action tabs =====//
    $('.showmenu').click(function () {
        $('.actions-wrapper').slideToggle(100);
    });


    //===== Easy tabs =====//

    /*$('.sidebar-tabs').easytabs({
        animationSpeed: 150,
        collapsible: false,
        tabActiveClass: "active"
    });*/

    //===== Collapsible plugin for main nav =====//
    $('.expand').collapsible({
        defaultOpen: 'current,third',
        cookieName: 'navAct',
        cssOpen: 'subOpened',
        cssClose: 'subClosed',
        speed: 200
    });

    //===== Datatables =====//

    oTable = $('#filer-table').dataTable({
        "bJQueryUI": false,
        "bAutoWidth": false,
        "sPaginationType": "full_numbers",
        "sDom": '<"datatable-header"fl>t<"datatable-footer"ip>',
        "oLanguage": {
            "sSearch": "<span>请输入筛选条件:</span> _INPUT_",
            "sLengthMenu": "<span>每页显示行数:</span> _MENU_",
            "oPaginate": { "sFirst": "首页", "sLast": "尾页", "sNext": ">", "sPrevious": "<" },
            "sInfo": "_START_ 到 _END_ 条，共 _TOTAL_ 条"
        }
    });

}
$(document).ready(initPage);
$(document).on('page:load', initPage);
