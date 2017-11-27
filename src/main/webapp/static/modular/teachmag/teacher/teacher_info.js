layui.use(['jquery','form','layer'],function () {
    window.jQuery = window.$ = layui.jquery;
    var form = layui.form;
    var layer = layui.layer;

    var TeacherInfoDlg = {
        teacherInfoData:{}
    }

    /**
     * 关闭弹窗
     */
    TeacherInfoDlg.close = function () {
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    }

    /**
     * 清除数据
     */
    TeacherInfoDlg.clearData = function () {
        this.teacherInfoData = {};
    };

    TeacherInfoDlg.set = function (key, value) {
        this.teacherInfoData[key] = (typeof value == "undefined") ? $("#" + key).val() : value;
        return this;
    }

    /**
     * 设置对话框中的数据
     *
     * @param key 数据的名称
     * @param val 数据的具体值
     */
    TeacherInfoDlg.get = function (key) {
        return $("#" + key).val();
    }

    /**
     * 收集数据
     */
    TeacherInfoDlg.collectData = function () {
        this.set('id').set('name').set('phone').set('photo').set('info').set('status');
    }

    form.on('submit(addSubmit)',function () {
        TeacherInfoDlg.clearData();
        TeacherInfoDlg.collectData();

        $.ajax({
            url:'/teachermag/add',
            data:TeacherInfoDlg.teacherInfoData,
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
        TeacherInfoDlg.clearData();
        TeacherInfoDlg.collectData();

        $.ajax({
            url:'/teachermag/update',
            data:TeacherInfoDlg.teacherInfoData,
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