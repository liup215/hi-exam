/**
 * Created by Administrator on 2017/8/12.
 */
layui.define(['jquery','dataTables'],function (exports) {
    window.$ = layui.jquery;

    var LayTable = function (options) {
        this.config = {
            elem:undefined
        }
    };

    var TABLE = {};

    LayTable.prototype.set = function (options) {
        var _this = this;
        $.extend(true, _this.config, options);
        return _this;
    };

    LayTable.prototype.init = function () {
        var _this = this;
        var _config = _this.config;
        if(typeof(_config.elem) !== 'string' && typeof(_config.elem) !== 'object') {
            layer.alert('Table错误提示: elem参数未定义或设置出错');
        }
        var $container;
        if(typeof(_config.elem) === 'string') {
            $container = $('#' + _config.elem + '');
        }
        if(typeof(_config.elem) === 'object') {
            $container = _config.elem;
        }
        if($container.length === 0) {
            layer.alert('Table错误提示:找不到elem参数配置的容器，请检查.');
        }
        TABLE.container = $container;
        TABLE.columns = _config.columns;
        TABLE.data = ajaxData(_config.ajax);

    };

    LayTable.prototype.getTable = function(){
        if(TABLE.container === undefined){
            this.init();
            alert("table初始化成功")
        }
        TABLE.container.DataTable({
            info:false,
            paging:false,
            searching:false,
            data:TABLE.data,
            columns:TABLE.columns
        });
    };


    function ajaxData(options){
        var content = null;
        $.ajax({
            url:options.url,
            type:options.type,
            success:function (data) {
                content = data;
            },
            async:false
        })
        return content;
    }
    var laytable = new LayTable();
    exports('laytable',function (options) {
        return laytable.set(options);
    })

})
