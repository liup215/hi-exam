layui.use(['form','tree','jquery'],function () {
    window.jQuery=window.$=layui.jquery;
    var form = layui.form();
    var layer = layui.layer;
    var Menus = {
        elem:"#menuTree",
        seItem:null,
        menuInfoData:{}
    }
    //初始化菜单
    Menus.init = function(){
        $.ajax({
            url:'/menu/list',
            type:'get',
            success:function (data) {
              Menus.nodes = data;
            },
            datatype:'json',
            async : false
        })

        Menus.nodes = buildTree(Menus.nodes,null);
    };

    //点击展示菜单详情
    Menus.click = function(node){
        $('#id').val(node.id);
        $('#name').val(node.name);
        $('#code').val(node.code);
        $('#pcode').val(node.pcode);
        $('#url').val(node.url);
        $('#num').val(node.num);
        $('#levels').val(node.levels);
        $('#isMenu').val(node.isMenu);
        $('#status').val(node.status);
        Menus.seItem = node;

    };

    //检查是否选中
    Menus.check = function () {
        var id = $("#id").val();
        if(id == ''){
            layer.msg("请先选中菜单中的某一条记录");
            return false;
        }else{
            return true;
        }
    }

    //构建树形结构
    function buildTree(data,pcode){
        pcode = pcode || 0;
        var list = [];
        data.map(function(item){
            if(item.pcode == pcode){
                item.children = buildTree(data,item.code);
                list.push(item);
            }
        });
        return list;
    }

    Menus.init();
    layui.tree(Menus);

    //点击添加菜单
    form.on("submit(menuAdd)",function(){
        var index = layer.open({
            type: 2,
            title: '添加菜单',
            area: ['500px', '600px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: '/menu/menu_add'
        });
        this.layerIndex = index;
    });

    //点击修改菜单
    form.on("submit(menuChange)",function(){
        if (Menus.check()) {
            var index = layer.open({
                type: 2,
                title: '修改菜单',
                area: ['500px', '600px'], //宽高
                fix: false, //不固定
                maxmin: true,
                content: '/menu/menu_edit/'+Menus.seItem.id
            });
            this.layerIndex = index;
        }
    });

    form.on("submit(menuDelete)",function(){
        if (Menus.check()) {
            layer.confirm("确定删除" + Menus.seItem.name, {
                btn: ["确认", "取消"],
                yes: function (index) {
                    $.ajax({
                        url:'/menu/remove',
                        data:{menuId:Menus.seItem.id},
                        success:function(data){
                            layer.log(data.message);
                        }
                    });
                    layer.close(index);
                    layerui.tree(Menus);
                },
                btn2: function (index) {
                    layer.close(index);
                }
            });
        }

    });
});


