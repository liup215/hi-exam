/**
 * 初始化教材管理详情对话框
 */
var TextBookInfoDlg = {
    textBookInfoData : {}
};

/**
 * 清除数据
 */
TextBookInfoDlg.clearData = function() {
    this.textBookInfoData = {};
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
TextBookInfoDlg.set = function(key, val) {
    this.textBookInfoData[key] = (typeof value == "undefined") ? $("#" + key).val() : value;
    return this;
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
TextBookInfoDlg.get = function(key) {
    return $("#" + key).val();
}

/**
 * 关闭此对话框
 */
TextBookInfoDlg.close = function() {
    parent.layer.close(window.parent.TextBook.layerIndex);
}

/**
 * 收集数据
 */
TextBookInfoDlg.collectData = function() {
    this.set('id').set('logo').set('name').set('gradeLevel').set('subject').set("status");
}

/**
 * 提交添加
 */
TextBookInfoDlg.addSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/textBook/add", function(data){
        Feng.success("添加成功!");
        window.parent.TextBook.table.refresh();
        TextBookInfoDlg.close();
    },function(data){
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.textBookInfoData);
    ajax.start();
}

/**
 * 提交修改
 */
TextBookInfoDlg.editSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/textBook/update", function(data){
        Feng.success("修改成功!");
        window.parent.TextBook.table.refresh();
        TextBookInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.textBookInfoData);
    ajax.start();
}

$(function() {

});
