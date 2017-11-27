/**
 * Created by Administrator on 2017/8/24.
 */
layui.use(['form','jquery','table'],function () {
    window.jQuery = window.$ = layui.jquery;
    var layer = layui.layer,
        form = layui.form,
        table = layui.table;

    var Teacher = {
        elem:"teacherTable",
        seItem:null,
        layerIndex : -1
    };

    //初始化表格列
    Teacher.initColumn =function () {
        var columns = [[
            {checkbox:true},
            {title:'id',field: 'id',width:50},
            {title:'姓名',field: 'name',width:100},
            {title:'电话',field: 'phone',width:150},
            {title:'简介',field: 'info',width:200},
            {title:'状态',field: 'status',width:100}]]
        return columns;
    };

    var teacherTable = table.render({
        elem:"#"+Teacher.elem,
        cols:Teacher.initColumn(),
        page:true,
        id:Teacher.elem,
        url:"/teachermag/list"
    })

    //检查是否选中
    Teacher.check = function () {
        var checkStatus = table.checkStatus(Teacher.elem);
        var selected = checkStatus.data;
        if (selected.length== 0) {
            layer.msg("请选中一项");
            return false;
        } else if(selected.length>1){
            layer.msg("请不要选择多项")
        }else{
            Teacher.seItem = selected[0];
            return true;
        }
    };


    form.on('submit(teacherAdd)',function () {
        var index = layer.open({
            type: 2,
            title: '添加菜单',
            area: ['830px', '450px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content:'/teachermag/teacher_add'
        });
        Teacher.layerIndex = index;
    })

    form.on('submit(teacherChange)',function () {
        if (Teacher.check()) {
            var index = layer.open({
                type: 2,
                title: '修改菜单',
                area: ['800px', '450px'], //宽高
                fix: false, //不固定
                maxmin: true,
                content: '/teachermag/teacher_edit/' + Teacher.seItem.id
            });
            Teacher.layerIndex = index;
        }
    })

    form.on('submit(teacherDelete)',function () {
        if (Teacher.check()) {
            layer.confirm("是否刪除学科?", function (index) {
                $.ajax({
                    url:'/teachermag/delete',
                    data:{teacherId:Teacher.seItem.id},
                    success:function (data) {
                        layer.msg("删除成功！");
                        Teacher.seItem = null;
                        teacherTable.reload();
                    }
                });

                layer.close(index);
            });
        }
    })

});

