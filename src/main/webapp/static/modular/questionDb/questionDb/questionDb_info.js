layui.use(['jquery','form','layer'],function () {
    window.jQuery = window.$ = layui.jquery;
    var form = layui.form();
    var layer = layui.layer;

    var QuestionDbInfoDlg = {
        questionDbInfoData:{}
    }

    /**
     * 关闭弹窗
     */
    QuestionDbInfoDlg.close = function () {
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    }

    /**
     * 清除数据
     */
    QuestionDbInfoDlg.clearData = function () {
        this.questionDbInfoData = {};
    };

    QuestionDbInfoDlg.set = function (key, value) {
        this.questionDbInfoData[key] = (typeof value == "undefined") ? $("#" + key).val() : value;
        return this;
    }

    /**
     * 设置对话框中的数据
     *
     * @param key 数据的名称
     * @param val 数据的具体值
     */
    QuestionDbInfoDlg.get = function (key) {
        return $("#" + key).val();
    }

    /**
     * 收集数据
     */
    QuestionDbInfoDlg.collectData = function () {
        this.set('id').set('logo').set('name').set('status').set('gradeLevel').set('subject');
    }

    form.on('submit(addSubmit)',function () {
        QuestionDbInfoDlg.clearData();
        QuestionDbInfoDlg.collectData();

        $.ajax({
            url:'/questionDb/add',
            data:QuestionDbInfoDlg.questionDbInfoData,
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
        QuestionDbInfoDlg.clearData();
        QuestionDbInfoDlg.collectData();

        $.ajax({
            url:'/questionDb/update',
            data:QuestionDbInfoDlg.questionDbInfoData,
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
