layui.use(['form','jquery','laytable'],function () {
    window.jQuery = window.$ = layui.jquery;
    var layer = layui.layer,
        form = layui.form();

    var Subject = {
        table:"subjectTable",
        page:"subjectPage",
        nums:20,
        seItem:null,
        layerIndex : -1
    };

    //初始化表格列
    Subject.initColumn =function () {
        var columns = [
            {name:'id',field: 'id'},
            {name:'学科名称',field: 'name'},
            {name:'状态',field: 'status'}]
        return columns;
    };



    var defaultColumn = Subject.initColumn();

    var laytable = layui.laytable({
        table:Subject.table,
        page:Subject.page,
        nums:Subject.nums,
        columns:defaultColumn,
        ajax:{
            url:'/subject/list',
            type:'GET'
        }
    });
    laytable.getTable();

    //检查是否选中
    Subject.check = function () {
        var selected = laytable.getSelectItem();
        if (selected== null) {
            layer.msg("请选中一项");
            return false;
        } else {
            Subject.seItem = selected;
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
                        laytable.refresh();
                    }
                });

                layer.close(index);
            });
        }
    })

});
