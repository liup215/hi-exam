layui.use(['form','jquery','table'],function () {
    window.jQuery = window.$ = layui.jquery;
    var layer = layui.layer,
        form = layui.form,
        table = layui.table;

    var TextVersion = {
        elem:"textVersionTable",
        seItem:null,
        layerIndex : -1
    };

    //初始化表格列
    TextVersion.initColumn =function () {
        var columns = [[
            {checkbox:true},
            {title:'id',field: 'id',width:50},
            {title:'教材版本名称',field: 'name',width:100},
            {title:'状态',field: 'status',width:100}]]
        return columns;
    };

    var textVersionTable = table.render({
        elem:"#"+TextVersion.elem,
        cols:TextVersion.initColumn(),
        url:"/textVersion/list",
        page:true,
        id:TextVersion.elem
    });

    //检查是否选中
    TextVersion.check = function () {
        var checkStatus = table.checkStatus(TextVersion.elem);
        var selected = checkStatus.data;
        if (selected.length== 0) {
            layer.msg("请选中一项");
            return false;
        } else if(selected.length>1){
            layer.msg("请不要选择多项")
        }else{
            Subject.seItem = selected[0];
            return true;
        }
    };


    form.on('submit(textVersionAdd)',function () {
        var index = layer.open({
            type: 2,
            title: '添加菜单',
            area: ['830px', '450px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content:'/textVersion/textVersion_add'
        });
        TextVersion.layerIndex = index;
    })

    form.on('submit(textVersionChange)',function () {
        if (TextVersion.check()) {
            var index = layer.open({
                type: 2,
                title: '修改菜单',
                area: ['800px', '450px'], //宽高
                fix: false, //不固定
                maxmin: true,
                content: '/textVersion/textVersion_update/' + TextVersion.seItem.id
            });
            TextVersion.layerIndex = index;
        }
    })

    form.on('submit(textVersionDelete)',function () {
        if (TextVersion.check()) {
            layer.confirm("是否刪除学科?", function (index) {
                $.ajax({
                    url:'/textVersion/delete',
                    data:{textVersionId:TextVersion.seItem.id},
                    success:function (data) {
                        layer.msg("删除成功！");
                        TextVersion.seItem = null;
                        textVersionTable.refresh()
                    }
                });

                layer.close(index);
            });
        }
    })

});
