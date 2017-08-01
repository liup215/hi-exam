/**
 * 菜单详情对话框
 */
var GradeInfoDlg = {
    gradeInfoData: {},
    validateFields: {
        name: {
            validators: {
                notEmpty: {
                    message: '年级名称不能为空'
                }
            }
        },
        level: {
            validators: {
                notEmpty: {
                    message: '年级学段不能为空'
                }
            }
        },
        status: {
            validators: {
                notEmpty: {
                    message: '年级状态不能为空'
                }
            }
        }
    }
};

/**
 * 清除数据
 */
GradeInfoDlg.clearData = function () {
    this.gradeInfoData = {};
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
GradeInfoDlg.set = function (key, val) {
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
 * 关闭此对话框
 */
GradeInfoDlg.close = function () {
    parent.layer.close(window.parent.Grade.layerIndex);
}

/**
 * 收集数据
 */
GradeInfoDlg.collectData = function () {
    this.set('id').set('name').set('level').set('status');
}

/**
 * 验证数据是否为空
 */
GradeInfoDlg.validate = function () {
    $('#gradeInfoForm').data("bootstrapValidator").resetForm();
    $('#gradeInfoForm').bootstrapValidator('validate');
    return $("#gradeInfoForm").data('bootstrapValidator').isValid();
}

/**
 * 提交添加用户
 */
GradeInfoDlg.addSubmit = function () {

    this.clearData();
    this.collectData();

    if (!this.validate()) {
        return;
    }

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/grade/add", function (data) {
        Feng.success("添加成功!");
        window.parent.Grade.table.refresh();
        GradeInfoDlg.close();
    }, function (data) {
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.gradeInfoData);
    ajax.start();
}

/**
 * 提交修改
 */
GradeInfoDlg.editSubmit = function () {

    this.clearData();
    this.collectData();

    if (!this.validate()) {
        return;
    }

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/grade/edit", function (data) {
        Feng.success("修改成功!");
        window.parent.Grade.table.refresh();
        GradeInfoDlg.close();
    }, function (data) {
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.gradeInfoData);
    ajax.start();
}

$(function () {
    Feng.initValidator("gradeInfoForm", GradeInfoDlg.validateFields);
});
