/**
 * 初始化题库管理详情对话框
 */
var QuestionDbInfoDlg = {
    questionDbInfoData : {}
};

/**
 * 清除数据
 */
QuestionDbInfoDlg.clearData = function() {
    this.questionDbInfoData = {};
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
QuestionDbInfoDlg.set = function(key, val) {
    this.questionDbInfoData[key] = (typeof value == "undefined") ? $("#" + key).val() : value;
    return this;
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
QuestionDbInfoDlg.get = function(key) {
    return $("#" + key).val();
}

/**
 * 关闭此对话框
 */
QuestionDbInfoDlg.close = function() {
    parent.layer.close(window.parent.QuestionDb.layerIndex);
}

/**
 * 收集数据
 */
QuestionDbInfoDlg.collectData = function() {
    this.set('id').set('logo').set('name').set('status').set('gradeLevel').set('subject');
}

/**
 * 提交添加
 */
QuestionDbInfoDlg.addSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/questionDb/add", function(data){
        Feng.success("添加成功!");
        window.parent.QuestionDb.table.refresh();
        QuestionDbInfoDlg.close();
    },function(data){
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.questionDbInfoData);
    ajax.start();
}

/**
 * 提交修改
 */
QuestionDbInfoDlg.editSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/questionDb/update", function(data){
        Feng.success("修改成功!");
        window.parent.QuestionDb.table.refresh();
        QuestionDbInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.questionDbInfoData);
    ajax.start();
}

$(function() {

});
