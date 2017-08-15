layui.use(['form','jquery','laytable'],function () {
    window.jQuery = window.$ = layui.jquery;
    var layer = layui.layer,
        form = layui.form();

    var QuestionDb = {
        table:"questionDbTable",
        page:"questionDbPage",
        nums:20,
        seItem:null,
        layerIndex : -1
    };

    //初始化表格列
    QuestionDb.initColumn =function () {
        var columns = [
            {name: 'id', field: 'id'},
            {name: 'logo', field: 'logo'},
            {name: '题库名称', field: 'name'},
            {name: '学段', field: 'gradeLevel'},
            {name: '学科', field: 'subject'},
            {name: '创建人', field: 'poster'},
            {name: '创建时间', field: 'cDate'},
            {name: '上次更新人', field: 'lastModifyor'},
            {name: '上次跟新时间', field: 'lastModifyDate'},
            {name: '状态', field: 'status'}];
        return columns;
    };



    var defaultColumn = QuestionDb.initColumn();

    var laytable = layui.laytable({
        table:QuestionDb.table,
        page:QuestionDb.page,
        nums:QuestionDb.nums,
        columns:defaultColumn,
        ajax:{
            url:'/questionDb/list',
            type:'GET'
        }
    });
    laytable.getTable();

    //检查是否选中
    QuestionDb.check = function () {
        var selected = laytable.getSelectItem();
        if (selected== null) {
            layer.msg("请选中一项");
            return false;
        } else {
            QuestionDb.seItem = selected;
            return true;
        }
    };


    form.on('submit(questionDbAdd)',function () {
        var index = layer.open({
            type: 2,
            title: '添加菜单',
            area: ['830px', '450px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content:'/questionDb/questionDb_add'
        });
        QuestionDb.layerIndex = index;
    })

    form.on('submit(questionDbChange)',function () {
        if (QuestionDb.check()) {
            var index = layer.open({
                type: 2,
                title: '修改菜单',
                area: ['800px', '450px'], //宽高
                fix: false, //不固定
                maxmin: true,
                content: '/questionDb/questionDb_update/' + QuestionDb.seItem.id
            });
            QuestionDb.layerIndex = index;
        }
    })

    form.on('submit(questionDbDelete)',function () {
        if (QuestionDb.check()) {
            layer.confirm("是否刪除学科?", function (index) {
                $.ajax({
                    url:'/questionDb/delete',
                    data:{questionDbId:QuestionDb.seItem.id},
                    success:function (data) {
                        layer.msg("删除成功！");
                        QuestionDb.seItem = null;
                        laytable.refresh();
                    }
                });

                layer.close(index);
            });
        }
    })

});