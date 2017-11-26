/**
 * Created by acer on 2017/11/27.
 */
layui.use(['jquery','form','layer'],function () {
    window.jQuery = window.$ = layui.jquery;
    var form = layui.form;
    var layer = layui.layer;

    var TopNavInfoDlg = {
        topNavInfoData:{}
    }

    /**
     * 关闭弹窗
     */
    TopNavInfoDlg.close = function () {
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    }

    /**
     * 清除数据
     */
    TopNavInfoDlg.clearData = function () {
        this.topNavInfoData = {};
    };

    TopNavInfoDlg.set = function (key, value) {
        this.topNavInfoData[key] = (typeof value == "undefined") ? $("#" + key).val() : value;
        return this;
    }

    /**
     * 设置对话框中的数据
     *
     * @param key 数据的名称
     * @param val 数据的具体值
     */
    TopNavInfoDlg.get = function (key) {
        return $("#" + key).val();
    }

    /**
     * 收集数据
     */
    TopNavInfoDlg.collectData = function () {
        this.set('id').set('name').set('userType').set('url');
    }

    form.on('submit(addSubmit)',function () {
        TopNavInfoDlg.clearData();
        TopNavInfoDlg.collectData();

        $.ajax({
            url:'/topNav/add',
            data:TopNavInfoDlg.topNavInfoData,
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
        TopNavInfoDlg.clearData();
        TopNavInfoDlg.collectData();

        $.ajax({
            url:'/topNav/update',
            data:TopNavInfoDlg.topNavInfoData,
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
