layui.use(['jquery','form','layer'],function () {
    window.jQuery = window.$ = layui.jquery;
    var form = layui.form();
    var layer = layui.layer;

    var SubjectInfoDlg = {
        subjectInfoData:{}
    }

    /**
     * 关闭弹窗
     */
    SubjectInfoDlg.close = function () {
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    }

    /**
     * 清除数据
     */
    SubjectInfoDlg.clearData = function () {
        this.subjectInfoData = {};
    };

    SubjectInfoDlg.set = function (key, value) {
        this.subjectInfoData[key] = (typeof value == "undefined") ? $("#" + key).val() : value;
        return this;
    }

    /**
     * 设置对话框中的数据
     *
     * @param key 数据的名称
     * @param val 数据的具体值
     */
    SubjectInfoDlg.get = function (key) {
        return $("#" + key).val();
    }

    /**
     * 收集数据
     */
    SubjectInfoDlg.collectData = function () {
        this.set('id').set('name').set('status');
    }

    form.on('submit(addSubmit)',function () {
        SubjectInfoDlg.clearData();
        SubjectInfoDlg.collectData();

        $.ajax({
            url:'/subject/add',
            data:SubjectInfoDlg.subjectInfoData,
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
        SubjectInfoDlg.clearData();
        SubjectInfoDlg.collectData();

        $.ajax({
            url:'/subject/update',
            data:SubjectInfoDlg.subjectInfoData,
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