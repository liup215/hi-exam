/**
 * 角色管理的单例
 */
var Grade = {
    id: "gradeTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
Grade.initColumn = function () {
    var columns = [
        {field: 'selectItem', radio: true},
        {title: 'id', field: 'id', visible: true, align: 'center', valign: 'middle'},
        {title: '年级名称', field: 'name', align: 'center', valign: 'middle', sortable: true},
        {title: '学段', field: 'level', align: 'center', valign: 'middle', sortable: true},
        {title: '状态', field: 'status', align: 'center', valign: 'middle', sortable: true}]
    return columns;
};


/**
 * 检查是否选中
 */
Grade.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if (selected.length == 0) {
        Feng.info("请先选中表格中的某一记录！");
        return false;
    } else {
        Grade.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加菜单
 */
Grade.openAddGrade = function () {
    var index = layer.open({
        type: 2,
        title: '添加菜单',
        area: ['830px', '450px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/grade/grade_add'
    });
    this.layerIndex = index;
};

/**
 * 点击修改
 */
Grade.openChangeGrade = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: '修改菜单',
            area: ['800px', '450px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/grade/grade_edit/' + this.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除
 */
Grade.delGrade = function () {
    if (this.check()) {

        var operation = function(){
            var ajax = new $ax(Feng.ctxPath + "/grade/remove", function (data) {
                Feng.success("删除成功!");
                Grade.table.refresh();
            }, function (data) {
                Feng.error("删除失败!" + data.responseJSON.message + "!");
            });
            ajax.set("gradeId", Grade.seItem.id);
            ajax.start();
        };

        Feng.confirm("是否刪除年级?", operation);
    }
};

/**
 * 搜索
 */
Grade.search = function () {
    var queryData = {};

    queryData['gradeName'] = $("#gradeName").val();
    queryData['level'] = $("#level").val();

    Grade.table.refresh({query: queryData});
}

$(function () {
    var defaultColunms = Grade.initColumn();
    var table = new BSTable(Grade.id, "/grade/list", defaultColunms);
    table.setPaginationType("client");
    Grade.table = table.init();
});
/**
 * Created by Administrator on 2017/7/24.
 */
