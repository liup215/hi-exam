/**
 * 题库管理管理初始化
 */
var QuestionDb = {
    id: "QuestionDbTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
QuestionDb.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
        {title: 'id', field: 'id', visible: true, align: 'center', valign: 'middle'},
        {title: 'logo', field: 'logo', align: 'center', valign: 'middle', sortable: true},
        {title: '题库名称', field: 'name', align: 'center', valign: 'middle', sortable: true},
        {title: '学段', field: 'gradeLevel', visible: true, align: 'center', valign: 'middle'},
        {title: '学科', field: 'subject', align: 'center', valign: 'middle', sortable: true},
        {title: '创建人', field: 'poster', align: 'center', valign: 'middle', sortable: true},
        {title: '创建时间', field: 'cDate', align: 'center', valign: 'middle', sortable: true},
        {title: '上次更新人', field: 'lastModifyor', visible: true, align: 'center', valign: 'middle'},
        {title: '上次跟新时间', field: 'lastModifyDate', align: 'center', valign: 'middle', sortable: true},
        {title: '状态', field: 'status', align: 'center', valign: 'middle', sortable: true}
    ];
};

/**
 * 检查是否选中
 */
QuestionDb.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        QuestionDb.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加题库管理
 */
QuestionDb.openAddQuestionDb = function () {
    var index = layer.open({
        type: 2,
        title: '添加题库管理',
        area: ['800px', '420px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/questionDb/questionDb_add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看题库管理详情
 */
QuestionDb.openQuestionDbDetail = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: '题库管理详情',
            area: ['800px', '420px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/questionDb/questionDb_update/' + QuestionDb.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除题库管理
 */
QuestionDb.delete = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/questionDb/delete", function (data) {
            Feng.success("删除成功!");
            QuestionDb.table.refresh();
        }, function (data) {
            Feng.error("删除失败!" + data.responseJSON.message + "!");
        });
        ajax.set("questionDbId",this.seItem.id);
        ajax.start();
    }
};

/**
 * 查询题库管理列表
 */
QuestionDb.search = function () {
    var queryData = {};
    queryData['condition'] = $("#condition").val();
    QuestionDb.table.refresh({query: queryData});
};

$(function () {
    var defaultColunms = QuestionDb.initColumn();
    var table = new BSTable(QuestionDb.id, "/questionDb/list", defaultColunms);
    table.setPaginationType("client");
    QuestionDb.table = table.init();
});
