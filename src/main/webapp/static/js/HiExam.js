/**
 * Created by acer on 2017/8/8.
 */
layui.define(['jquery'],function (exports) {
    window.jQuery = window.$ = layui.jquery;
    var module_name = "hiexam";
    var HiExam = {};
    HiExam.hello = function (str) {
        alert("hello " + str);
    };

    function buildTree(data,pcode){
        pcode = pcode || 0;
        var list = [];

        data.map(function(item){
            if(item.pcode == pcode){
                item.children = buildTree(data,item.code);
                list.push(item);
            }
        });
        return list;
    }

    HiExam.initTree = function(option){
        var nodes = null
        $.ajax({
            url:option.url,
            type:option.type,
            success:function (data) {
                nodes = data;
            },
            async:false
        });
        return buildTree(nodes,null);
    }

    exports(module_name,HiExam)
})
