/**
 * 菜单详情对话框
 */
var GradeInfoDlg = {
    gradeInfoData: {},
    ztreeInstance: null,
    validateFields: {
        name: {
            validators: {
                notEmpty: {
                    message: '菜单名称不能为空'
                }
            }
        },
        code: {
            validators: {
                notEmpty: {
                    message: '菜单编号不能为空'
                }
            }
        },
        pcodeName: {
            validators: {
                notEmpty: {
                    message: '父菜单不能为空'
                }
            }
        },
        url: {
            validators: {
                notEmpty: {
                    message: '请求地址不能为空'
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
    this.set('id').set('name').set('code').set('pcode').set('url').set('num').set('levels').set('icon').set("isGrade");
}

/**
 * 验证数据是否为空
 */
GradeInfoDlg.validate = function () {
    $('#GradeInfoForm').data("bootstrapValidator").resetForm();
    $('#GradeInfoForm').bootstrapValidator('validate');
    return $("#GradeInfoForm").data('bootstrapValidator').isValid();
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
    ajax.set(this.GradeInfoData);
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
    var ajax = new $ax(Feng.ctxPath + "/Grade/edit", function (data) {
        Feng.success("修改成功!");
        window.parent.Grade.table.refresh();
        GradeInfoDlg.close();
    }, function (data) {
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.GradeInfoData);
    ajax.start();
}

/**
 * 点击父级编号input框时
 */
GradeInfoDlg.onClickDept = function (e, treeId, treeNode) {
    $("#pcodeName").attr("value", GradeInfoDlg.ztreeInstance.getSelectedVal());
    $("#pcode").attr("value", treeNode.id);
};


/**
 * 显示父级菜单选择的树
 */
GradeInfoDlg.showGradeSelectTree = function () {
    Feng.showInputTree("pcodeName", "pcodeTreeDiv", 15, 34);
};

$(function () {
    Feng.initValidator("GradeInfoForm", GradeInfoDlg.validateFields);

    var ztree = new $ZTree("pcodeTree", "/Grade/selectGradeTreeList");
    ztree.bindOnClick(GradeInfoDlg.onClickDept);
    ztree.init();
    GradeInfoDlg.ztreeInstance = ztree;

    //初始化是否是菜单
    if($("#isGradeValue").val() == undefined){
        $("#isGrade").val(0);
    }else{
        $("#isGrade").val($("#isGradeValue").val());
    }
});
