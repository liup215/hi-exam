layui.use(['form','jquery','laytable'],function () {
    window.jQuery = window.$ = layui.jquery;
    var layer = layui.layer,
        form = layui.form();

    var Grade = {
        table:"gradeTable",
        page:"gradePage",
        nums:20,
        seItem:null,
        layerIndex : -1
    };

    //初始化表格列
    Grade.initColumn =function () {
        var columns = [
        {name:'id',field: 'id'},
        {name:'年级名称',field: 'name'},
        {name:'学段',field: 'level'},
        {name:'状态',field: 'status'}]
        return columns;
    };



    var defaultColumn = Grade.initColumn();

    var laytable = layui.laytable({
        table:Grade.table,
        page:Grade.page,
        nums:Grade.nums,
        columns:defaultColumn,
        ajax:{
            url:'/grade/list',
            type:'GET'
        }
    });
    laytable.getTable();

    //检查是否选中
    Grade.check = function () {
        var selected = laytable.getSelectItem();
        if (selected== null) {
            layer.msg("请选中一项");
            return false;
        } else {
            Grade.seItem = selected;
            return true;
        }
    };


    form.on('submit(gradeAdd)',function () {
        var index = layer.open({
            type: 2,
            title: '添加菜单',
            area: ['830px', '450px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content:'/grade/grade_add'
        });
        Grade.layerIndex = index;
    })

    form.on('submit(gradeChange)',function () {
        if (Grade.check()) {
            var index = layer.open({
                type: 2,
                title: '修改菜单',
                area: ['800px', '450px'], //宽高
                fix: false, //不固定
                maxmin: true,
                content: '/grade/grade_edit/' + Grade.seItem.id
            });
            Grade.layerIndex = index;
        }
    })

    form.on('submit(gradeDelete)',function () {
        if (Grade.check()) {
            layer.confirm("是否刪除年级?", function (index) {
                $.ajax({
                    url:'/grade/remove',
                    data:{gradeId:Grade.seItem.id},
                    success:function (data) {
                        layer.msg("删除成功！");
                        Grade.seItem = null;
                        laytable.refresh();
                    }
                });

                layer.close(index);
            });
        }
    })

});
