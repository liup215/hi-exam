/**
 * Created by acer on 2017/11/26.
 */
layui.use(['form','jquery','table'],function () {
    window.jQuery = window.$ = layui.jquery;
    var layer = layui.layer,
        form = layui.form,
        table = layui.table;

    var TopNav = {
        elem:"topNavTable",
        seItem:null,
        layerIndex : -1
    };

    //初始化表格列
    TopNav.initColumn =function () {
        var columns = [[
            {checkbox:true},
            {title:'id',field: 'id',width:50},
            {title:'导航名称',field:'name',width:100},
            {title:'用户角色',field:'userType',width:100},
            {title:'url',field: 'url',width:100}]];
        return columns;
    };


    var topNavTable = table.render({
        elem:"#"+TopNav.elem,
        cols:TopNav.initColumn(),
        page:true,
        url:"/topNav/list",
        id:TopNav.elem
    });

    //检查是否选中
    TopNav.check = function () {
        var checkStatus = table.checkStatus(TopNav.elem);
        var selected = checkStatus.data;
        if (selected.length== 0) {
            layer.msg("请选中一项");
            return false;
        } else if(selected.length>1){
            layer.msg("请不要选择多项")
        }else{
            TopNav.seItem = selected[0];
            return true;
        }
    };


    form.on('submit(topNavAdd)',function () {
        var index = layer.open({
            type: 2,
            title: '添加菜单',
            area: ['830px', '450px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content:'/topNav/topNav_add'
        });
        TopNav.layerIndex = index;
    })

    form.on('submit(topNavChange)',function () {
        if (TopNav.check()) {
            var index = layer.open({
                type: 2,
                title: '修改菜单',
                area: ['800px', '450px'], //宽高
                fix: false, //不固定
                maxmin: true,
                content: '/topNav/topNav_update/' + TopNav.seItem.id
            });
            TopNav.layerIndex = index;
        }
    })

    form.on('submit(topNavDelete)',function () {
        if (TopNav.check()) {
            layer.confirm("是否刪除学科?", function (index) {
                $.ajax({
                    url:'/topNav/delete',
                    data:{topNavId:TopNav.seItem.id},
                    success:function (data) {
                        layer.msg("删除成功！");
                        TopNav.seItem = null;
                        topNavTable.reload();
                    }
                });

                layer.close(index);
            });
        }
    })

    form.on('submit(topNavChapter)',function () {
        if(TopNav.check()){
            window.location.href = '/chapter/'+ TopNav.seItem.id;
        }
    })

});

