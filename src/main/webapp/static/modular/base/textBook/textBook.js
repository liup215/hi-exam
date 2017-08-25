layui.use(['form','jquery','table'],function () {
    window.jQuery = window.$ = layui.jquery;
    var layer = layui.layer,
        form = layui.form,
        table = layui.table;

    var TextBook = {
        elem:"textBookTable",
        seItem:null,
        layerIndex : -1
    };

    //初始化表格列
    TextBook.initColumn =function () {
        var columns = [[
            {checkbox:true},
            {title:'id',field: 'id',width:50},
            {title:'logo',field: 'logo',width:100},
            {title:'教材名称',field:'name',width:100},
            {title:'学段',field:'gradeLevel',width:100},
            {title:'学科',field:'subject',width:100},
            {title:'状态',field: 'status',width:100}]];
        return columns;
    };


    var textBookTable = table.render({
        elem:"#"+TextBook.elem,
        cols:TextBook.initColumn(),
        page:true,
        url:"/textBook/list",
        id:TextBook.elem
    });

    //检查是否选中
    TextBook.check = function () {
        var checkStatus = table.checkStatus(TextBook.elem);
        var selected = checkStatus.data;
        if (selected.length== 0) {
            layer.msg("请选中一项");
            return false;
        } else if(selected.length>1){
            layer.msg("请不要选择多项")
        }else{
            TextBook.seItem = selected[0];
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
                        textBookTable.reload();
                    }
                });

                layer.close(index);
            });
        }
    })

    form.on('submit(textBookChapter)',function () {
        if(TextBook.check()){
            window.location.href = '/chapter/'+ TextBook.seItem.id;
        }
    })

});
