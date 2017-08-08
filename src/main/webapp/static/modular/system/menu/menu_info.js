layui.use(['form','jquery','element','tree','layer'],function () {
    window.jQuery = window.$ = layui.jquery;
    var form = layui.form();
    var layer = layui.layer;

    var MenuInfoDlg = {
        menuInfoData: {}
    };

    /**
     * 清除数据
     */
    MenuInfoDlg.clearData = function () {
        this.menuInfoData = {};
    };

    MenuInfoDlg.set = function (key, val) {
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

    //关闭对话框
    form.on("submit(menuClose",function () {
        parent.layer.close(window.parent.Menu.layerIndex);
    })

    form.on("submit(menuAdd)",function () {

        MenuInfoDlg.clearData();
        MenuInfoDlg.collectData();

        layer.confirm("确定添加",{
            btn:['确认','取消'],
            yes:function(index){
                $.ajax({
                    url:'/menu/add',
                    data:MenuInfoDlg.menuInfoData,
                    type:'POST',
                    success:function(data){
                        layer.log(data.message);
                    }
                });
                layer.close(index);
            }
        })

    })

    form.on("submit(menuChange)",function () {

        MenuInfoDlg.clearData();
        MenuInfoDlg.collectData();

        layer.confirm("确定添加",{
            btn:['确认','取消'],
            yes:function(index){
                $.ajax({
                    url:'/menu/add',
                    data:MenuInfoDlg.menuInfoData,
                    type:'POST',
                    success:function(data){
                        layer.log(data.message);
                    }
                });
                layer.close(index);
            }
        })
    })

    form.on("select(selectPCode)",function () {
        layer.log("弹出树")
    })

});

