layui.use(['jquery','form','layer'],function () {
    window.jQuery = window.$ = layui.jquery;
    var form = layui.form();
    var layer = layui.layer;

    var GradeInfoDlg = {
        gradeInfoData:{}
    }

    /**
     * 关闭弹窗
     */
    GradeInfoDlg.close = function () {
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    }

    /**
     * 清除数据
     */
    GradeInfoDlg.clearData = function () {
        this.gradeInfoData = {};
    };

    GradeInfoDlg.set = function (key, value) {
        this.gradeInfoData[key] = (typeof value == "undefined") ? $("#" + key).val() : value;
        return this;
    }

    /**
     * 设置对话框中的数据
     *
     * @param key 数据的名称
     * @param val 数据的具体值
     */
    GradeInfoDlg.get = function (key) {
        return $("#" + key).val();
    }

    /**
     * 收集数据
     */
    GradeInfoDlg.collectData = function () {
        this.set('id').set('name').set('level').set('status');
    }

    form.on('submit(addSubmit)',function () {
        GradeInfoDlg.clearData();
        GradeInfoDlg.collectData();

        $.ajax({
            url:'/grade/add',
            data:GradeInfoDlg.gradeInfoData,
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
        GradeInfoDlg.clearData();
        GradeInfoDlg.collectData();

        $.ajax({
            url:'/grade/edit',
            data:GradeInfoDlg.gradeInfoData,
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