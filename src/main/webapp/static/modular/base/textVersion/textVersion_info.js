/**
 * 初始化教材版本管理详情对话框
 */
var TextVersionInfoDlg = {
    textVersionInfoData : {},
    validateFields: {
        name: {
            validators: {
                notEmpty: {
                    message: '版本名称不能为空'
                }
            }
        },
        status: {
            validators: {
                notEmpty: {
                    message: '版本状态不能为空'
                }
            }
        }
    }
};

/**
 * 清除数据
 */
TextVersionInfoDlg.clearData = function() {
    this.textVersionInfoData = {};

}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
TextVersionInfoDlg.set = function(key, val) {
    this.textVersionInfoData[key] = (typeof value == "undefined") ? $("#" + key).val() : value;
    return this;
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
TextVersionInfoDlg.get = function(key) {
    return $("#" + key).val();
}

/**
 * 关闭此对话框
 */
TextVersionInfoDlg.close = function() {
    parent.layer.close(window.parent.TextVersion.layerIndex);
}

/**
 * 收集数据
 */
TextVersionInfoDlg.collectData = function() {
    this.set('id').set('name').set('status');
}

/**
 * 提交添加
 */
TextVersionInfoDlg.addSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/textVersion/add", function(data){
        Feng.success("添加成功!");
        window.parent.TextVersion.table.refresh();
        TextVersionInfoDlg.close();
    },function(data){
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.textVersionInfoData);
    ajax.start();
}

/**
 * 提交修改
 */
TextVersionInfoDlg.editSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/textVersion/update", function(data){
        Feng.success("修改成功!");
        window.parent.TextVersion.table.refresh();
        TextVersionInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.textVersionInfoData);
    ajax.start();
}

$(function() {

});
