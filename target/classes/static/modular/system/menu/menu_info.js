layui.config({
    base: '/static/js/'
}).use(['form','jquery','element','tree','layer','hiexam'],function () {
    /**
     * 初始化组件
     */
    window.jQuery = window.$ = layui.jquery;
    var HiExam = layui.hiexam;
    var form = layui.form();
    var layer = layui.layer;

    /**
     * 数据信息
     * @type {{menuInfoData: {}}}
     */
    var MenuInfoDlg = {
        menuInfoData: {}
    };

    /**
     * 关闭弹窗
     */
    MenuInfoDlg.close = function(){
        var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
        parent.layer.close(index);
    };

    /**
     * 清除数据
     */
    MenuInfoDlg.clearData = function () {
        this.menuInfoData = {};
    };

    MenuInfoDlg.set = function (key, value) {
        this.menuInfoData[key] = (typeof value == "undefined") ? $("#" + key).val() : value;
        return this;
    }

    /**
     * 设置对话框中的数据
     *
     * @param key 数据的名称
     * @param val 数据的具体值
     */
    MenuInfoDlg.get = function (key) {
        return $("#" + key).val();
    }

    /**
     * 收集数据
     */
    MenuInfoDlg.collectData = function () {
        this.set('id').set('name').set('code').set('pcode').set('url').set('num').set('levels').set('icon').set("ismenu");
    }

    /**
     * 提交添加
     */
    form.on("submit(menuAdd)",function () {

        MenuInfoDlg.clearData();
        MenuInfoDlg.collectData();

        layer.confirm("确定添加",{
            btn:['确认','取消'],
            yes:function(){
                $.ajax({
                    url:'/menu/add',
                    data:MenuInfoDlg.menuInfoData,
                    type:'POST',
                    success:function(data){
                        layer.msg(data.message);
                        parent.location.reload();
                    },
                    error:function () {
                        layer.msg("操作失败")
                    }
                });

                MenuInfoDlg.close()
            }
        })

    });

    /**
     * 提交修改
     */
    form.on("submit(menuChange)",function () {

        MenuInfoDlg.clearData();
        MenuInfoDlg.collectData();

        layer.confirm("确定修改",{
            btn:['确认','取消'],
            yes:function(index){
                $.ajax({
                    url:'/menu/edit',
                    data:MenuInfoDlg.menuInfoData,
                    type:'POST',
                    success:function(data){
                        layer.msg(data.message);
                        parent.location.reload()
                    }
                });

                MenuInfoDlg.close()
            }
        })
    });

    /**
     * 关闭弹窗
     */
    form.on("submit(menuClose)",function () {
        MenuInfoDlg.close();
    })


    /**
     * 点击父菜单框，显示父菜单
     */
    $("#pcode").on('focus',function () {

        layer.open({
            type:1,
            content:"<ul id='menuTree' style='overflow-y:scroll;'></ul>",
            offset:'t'
        });
        var nodes = {};
        nodes.elem = "#menuTree";
        nodes.click = function(node){
            $("#pcode").val(node.code || '0');
            layer.close(layer.index);
        };

        nodes.nodes = HiExam.initTree({
            url:'/menu/list',
            type:'get'
        });
        layui.tree(nodes);
    })
});

