/**
 * 教材版本管理管理初始化
 */
var TextVersion = {
    id: "TextVersionTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
TextVersion.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
        {title: 'id', field: 'id', visible: true, align: 'center', valign: 'middle'},
        {title: '版本名称', field: 'name', align: 'center', valign: 'middle', sortable: true},
        {title: '状态', field: 'status', align: 'center', valign: 'middle', sortable: true}
    ];
};

/**
 * 检查是否选中
 */
TextVersion.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        TextVersion.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加教材版本管理
 */
TextVersion.openAddTextVersion = function () {
    var index = layer.open({
        type: 2,
        title: '添加教材版本管理',
        area: ['800px', '420px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/textVersion/textVersion_add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看教材版本管理详情
 */
TextVersion.openTextVersionDetail = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: '教材版本管理详情',
            area: ['800px', '420px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/textVersion/textVersion_update/' + TextVersion.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除教材版本管理
 */
TextVersion.delete = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/textVersion/delete", function (data) {
            Feng.success("删除成功!");
            TextVersion.table.refresh();
        }, function (data) {
            Feng.error("删除失败!" + data.responseJSON.message + "!");
        });
        ajax.set("textVersionId",this.seItem.id);
        ajax.start();
    }
};

/**
 * 查询教材版本管理列表
 */
TextVersion.search = function () {
    var queryData = {};
    queryData['condition'] = $("#condition").val();
    TextVersion.table.refresh({query: queryData});
};

$(function () {
    var defaultColunms = TextVersion.initColumn();
    var table = new BSTable(TextVersion.id, "/textVersion/list", defaultColunms);
    table.setPaginationType("client");
    TextVersion.table = table.init();
});
