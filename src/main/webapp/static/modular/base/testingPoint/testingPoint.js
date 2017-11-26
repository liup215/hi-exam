/**
 * Created by acer on 2017/11/26.
 */
alert("js加载成功！！！")

layui.use(['form','jquery','table'],function () {
    window.jQuery = window.$ = layui.jquery;
    var layer = layui.layer,
        form = layui.form,
        table = layui.table;

    var TestingPoint = {
        elem:"TestingPointTable",
        seItem:null,
        layerIndex : -1
    };


    //初始化表格列
    TestingPoint.initColumn =function () {
        var columns = [[
            {checkbox:true},
            {title:'id',field: 'id',width:100},
            {title:'考点名称',field: 'name',width:150},
            {title:'学段',field:'gradeLevel',width:100},
            {title:'学科',field:'subject',width:100}
            ]]
        return columns;
    };

    var testingPointTable = table.render({
        elem:"#"+TestingPoint.elem,
        cols:TestingPoint.initColumn(),
        url:"/testingPoint/list",
        page:true,
        id:TestingPoint.elem
    });

    //检查是否选中
    TestingPoint.check = function () {
        var checkStatus = table.checkStatus(TestingPoint.elem);
        var selected = checkStatus.data;
        if (selected.length== 0) {
            layer.msg("请选中一项");
            return false;
        } else if(selected.length>1){
            layer.msg("请不要选择多项")
        }else{
            TestingPoint.seItem = selected[0];
            return true;
        }
    };


    form.on('submit(testingPointAdd)',function () {
        var index = layer.open({
            type: 2,
            title: '添加菜单',
            area: ['830px', '450px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content:'/testingPoint/testingPoint_add'
        });
        TestingPoint.layerIndex = index;
    })

    form.on('submit(testingPointChange)',function () {
        if (TestingPoint.check()) {
            var index = layer.open({
                type: 2,
                title: '修改菜单',
                area: ['800px', '450px'], //宽高
                fix: false, //不固定
                maxmin: true,
                content: '/testingPoint/testingPoint_edit/' + TestingPoint.seItem.id
            });
            TestingPoint.layerIndex = index;
        }
    })

    form.on('submit(testingPointDelete)',function () {
        if (TestingPoint.check()) {
            layer.confirm("是否刪除年级?", function (index) {
                $.ajax({
                    url:'/testingPoint/remove',
                    data:{testingPointId:TestingPoint.seItem.id},
                    success:function (data) {
                        layer.msg("删除成功！");
                        TestingPoint.seItem = null;
                        testingPointTable.reload();
                    }
                });

                layer.close(index);
            });
        }
    })
})