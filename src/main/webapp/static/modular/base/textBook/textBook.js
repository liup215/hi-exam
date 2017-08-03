/**
 * 教材管理管理初始化
 */
var TextBook = {
    id: "TextBookTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
TextBook.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
        {title: 'id', field: 'id', visible: true, align: 'center', valign: 'middle'},
        {title: '教材名称', field: 'name', align: 'center', valign: 'middle', sortable: true},
        {title: 'logo', field: 'logo', align: 'center', valign: 'middle', sortable: true},
        {title: '学段', field: 'gradeLevel', align: 'center', valign: 'middle', sortable: true},
        {title: '学科', field: 'subject', align: 'center', valign: 'middle', sortable: true},
        {title: '状态', field: 'status', align: 'center', valign: 'middle', sortable: true}
    ];
};

/**
 * 检查是否选中
 */
TextBook.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        TextBook.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加教材管理
 */
TextBook.openAddTextBook = function () {
    var index = layer.open({
        type: 2,
        title: '添加教材管理',
        area: ['800px', '420px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/textBook/textBook_add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看教材管理详情
 */
TextBook.openTextBookDetail = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: '教材管理详情',
            area: ['800px', '420px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/textBook/textBook_update/' + TextBook.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除教材管理
 */
TextBook.delete = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/textBook/delete", function (data) {
            Feng.success("删除成功!");
            TextBook.table.refresh();
        }, function (data) {
            Feng.error("删除失败!" + data.responseJSON.message + "!");
        });
        ajax.set("textBookId",this.seItem.id);
        ajax.start();
    }
};

/**
 * 查询教材管理列表
 */
TextBook.search = function () {
    var queryData = {};
    queryData['condition'] = $("#condition").val();
    TextBook.table.refresh({query: queryData});
};

$(function () {
    var defaultColunms = TextBook.initColumn();
    var table = new BSTable(TextBook.id, "/textBook/list", defaultColunms);
    table.setPaginationType("client");
    TextBook.table = table.init();
});
