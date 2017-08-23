layui.use(['form','jquery','table'],function () {
    window.jQuery = window.$ = layui.jquery;
    var layer = layui.layer,
        form = layui.form,
        table = layui.table;

    var Subject = {
        elem:"subjectTable",
        seItem:null,
        layerIndex : -1
    };

    //初始化表格列
    Subject.initColumn =function () {
        var columns = [[
            {checkbox:true},
            {title:'id',field: 'id',width:50},
            {title:'学科名称',field: 'name',width:100},
            {title:'状态',field: 'status',width:100}]]
        return columns;
    };

    var subjectTable = table.render({
        elem:"#"+Subject.elem,
        cols:Subject.initColumn(),
        page:true,
        id:Subject.elem,
        url:"/subject/list"
    })

    //检查是否选中
    Subject.check = function () {
        var checkStatus = table.checkStatus(Subject.elem);
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


    form.on('submit(subjectAdd)',function () {
        var index = layer.open({
            type: 2,
            title: '添加菜单',
            area: ['830px', '450px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content:'/subject/subject_add'
        });
        Subject.layerIndex = index;
    })

    form.on('submit(subjectChange)',function () {
        if (Subject.check()) {
            var index = layer.open({
                type: 2,
                title: '修改菜单',
                area: ['800px', '450px'], //宽高
                fix: false, //不固定
                maxmin: true,
                content: '/subject/subject_edit/' + Subject.seItem.id
            });
            Subject.layerIndex = index;
        }
    })

    form.on('submit(subjectDelete)',function () {
        if (Subject.check()) {
            layer.confirm("是否刪除学科?", function (index) {
                $.ajax({
                    url:'/subject/delete',
                    data:{subjectId:Subject.seItem.id},
                    success:function (data) {
                        layer.msg("删除成功！");
                        Subject.seItem = null;
                        subjectTable.refresh();
                    }
                });

                layer.close(index);
            });
        }
    })

});
