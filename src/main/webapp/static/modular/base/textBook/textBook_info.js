layui.use(['jquery','form','layer'],function () {
    window.jQuery = window.$ = layui.jquery;
    var form = layui.form();
    var layer = layui.layer;

    var TextBookInfoDlg = {
        textBookInfoData:{}
    }

    /**
     * 关闭弹窗
     */
    TextBookInfoDlg.close = function () {
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    }

    /**
     * 清除数据
     */
    TextBookInfoDlg.clearData = function () {
        this.textBookInfoData = {};
    };

    TextBookInfoDlg.set = function (key, value) {
        this.textBookInfoData[key] = (typeof value == "undefined") ? $("#" + key).val() : value;
        return this;
    }

    /**
     * 设置对话框中的数据
     *
     * @param key 数据的名称
     * @param val 数据的具体值
     */
    TextBookInfoDlg.get = function (key) {
        return $("#" + key).val();
    }

    /**
     * 收集数据
     */
    TextBookInfoDlg.collectData = function () {
        this.set('id').set('name').set('logo').set('gradeLevel').set('subject').set('status');
    }

    form.on('submit(addSubmit)',function () {
        TextBookInfoDlg.clearData();
        TextBookInfoDlg.collectData();

        $.ajax({
            url:'/textBook/add',
            data:TextBookInfoDlg.textBookInfoData,
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
        TextBookInfoDlg.clearData();
        TextBookInfoDlg.collectData();

        $.ajax({
            url:'/textBook/update',
            data:TextBookInfoDlg.textBookInfoData,
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