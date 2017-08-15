layui.use(['form','jquery','laytable'],function () {
    window.jQuery = window.$ = layui.jquery;
    var layer = layui.layer,
        form = layui.form();

    var TextBook = {
        table:"textBookTable",
        page:"textBookPage",
        nums:20,
        seItem:null,
        layerIndex : -1
    };

    //初始化表格列
    TextBook.initColumn =function () {
        var columns = [
            {name:'id',field: 'id'},
            {name:'logo',field: 'logo'},
            {name:'教材名称',field:'name'},
            {name:'学段',field:'gradeLevel'},
            {name:'学科',field:'subject'},
            {name:'状态',field: 'status'}];
        return columns;
    };



    var defaultColumn = TextBook.initColumn();

    var laytable = layui.laytable({
        table:TextBook.table,
        page:TextBook.page,
        nums:TextBook.nums,
        columns:defaultColumn,
        ajax:{
            url:'/textBook/list',
            type:'GET'
        }
    });
    laytable.getTable();

    //检查是否选中
    TextBook.check = function () {
        var selected = laytable.getSelectItem();
        if (selected== null) {
            layer.msg("请选中一项");
            return false;
        } else {
            TextBook.seItem = selected;
            return true;
        }
    };


    form.on('submit(textBookAdd)',function () {
        var index = layer.open({
            type: 2,
            title: '添加菜单',
            area: ['830px', '450px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content:'/textBook/textBook_add'
        });
        TextBook.layerIndex = index;
    })

    form.on('submit(textBookChange)',function () {
        if (TextBook.check()) {
            var index = layer.open({
                type: 2,
                title: '修改菜单',
                area: ['800px', '450px'], //宽高
                fix: false, //不固定
                maxmin: true,
                content: '/textBook/textBook_update/' + TextBook.seItem.id
            });
            TextBook.layerIndex = index;
        }
    })

    form.on('submit(textBookDelete)',function () {
        if (TextBook.check()) {
            layer.confirm("是否刪除学科?", function (index) {
                $.ajax({
                    url:'/textBook/delete',
                    data:{textBookId:TextBook.seItem.id},
                    success:function (data) {
                        layer.msg("删除成功！");
                        TextBook.seItem = null;
                        laytable.refresh();
                    }
                });

                layer.close(index);
            });
        }
    })

});
