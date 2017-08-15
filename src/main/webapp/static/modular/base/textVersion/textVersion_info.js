layui.use(['jquery','form','layer'],function () {
    window.jQuery = window.$ = layui.jquery;
    var form = layui.form();
    var layer = layui.layer;

    var TextVersionInfoDlg = {
        textVersionInfoData:{}
    }

    /**
     * 关闭弹窗
     */
    TextVersionInfoDlg.close = function () {
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    }

    /**
     * 清除数据
     */
    TextVersionInfoDlg.clearData = function () {
        this.textVersionInfoData = {};
    };

    TextVersionInfoDlg.set = function (key, value) {
        this.textVersionInfoData[key] = (typeof value == "undefined") ? $("#" + key).val() : value;
        return this;
    }

    /**
     * 设置对话框中的数据
     *
     * @param key 数据的名称
     * @param val 数据的具体值
     */
    TextVersionInfoDlg.get = function (key) {
        return $("#" + key).val();
    }

    /**
     * 收集数据
     */
    TextVersionInfoDlg.collectData = function () {
        this.set('id').set('name').set('status');
    }

    form.on('submit(addSubmit)',function () {
        TextVersionInfoDlg.clearData();
        TextVersionInfoDlg.collectData();

        $.ajax({
            url:'/textVersion/add',
            data:TextVersionInfoDlg.textVersionInfoData,
            type:'POST',
            success:function(data){
                layer.msg("添加成功");
                parent.location.reload();
            },
            error:function () {
                layer.msg("数据提交错误");
            }
        })
    });

    form.on('submit(editSubmit)',function () {
        TextVersionInfoDlg.clearData();
        TextVersionInfoDlg.collectData();

        $.ajax({
            url:'/textVersion/update',
            data:TextVersionInfoDlg.textVersionInfoData,
            type:'POST',
            success:function(data){
                layer.msg("添加成功");
                parent.location.reload();
            },
            error:function () {
                layer.msg("数据提交错误");
            }
        })
    })
});