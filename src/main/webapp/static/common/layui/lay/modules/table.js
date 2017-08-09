/**
 * Created by Administrator on 2017/8/9.
 */
layui.define('jquery',function (exports) {

    var $= layui.jquery,
        module_name = 'table';
        Table=function () {
            this.config = {
                elem:undefined,
                defaultColumn:undefined,
                url:undefined,
                type:undefined
            }
        };
    var ELEM = {};

    /**
     * 设置参数options
     * @param options
     * @returns {Table}
     */
    Table.prototype.set = function (options) {
        var _this = this;
        $.extend(true,_this.config,options);
        return _this;
    };

    Table.prototype.init = function () {
        var _this = this;
        var _config = _this.config;
        if(typeof(_config.elem) !== 'string' && typeof(_config.elem) !== 'object') {
            layer.alert('表格初始化错误错误提示: elem参数未定义或设置出错，具体设置格式请参考文档API.');
        }

        var $container;
        if(typeof(_config.elem) === 'string') {
            $container = $('#' + _config.elem + '');
            //console.log($container);
        }
        if(typeof(_config.elem) === 'object') {
            $container = _config.elem;
        }
        if($container.length === 0) {
            layer.alert('表格错误提示:找不到elem参数配置的容器，请检查.');
        }
        _config.elem = $container;

        //创建列
        ELEM.colgroup = "<colgroup></colgroup>";
        _config.elem.append(ELEM.colgroup);
        _config.defaultColumn.map(function (item) {
            $("colgroup").append("<col>");
        });

        //添加表格标题
        ELEM.thead = "<thead><tr></tr></thead>>";
        _config.elem.append(ELEM.thead);
        $("thead tr").append("<th><input name='' lay-skin='primary' lay-filter='allChoose' type='checkbox'></th>");
        _config.defaultColumn.map(function (item) {
            $("thead tr").append('<th>'+item.field +'</th>');
        })

        //获取表格数据
        $.ajax({
            url:_config.url,
            type:_config.type,
            success:function (data) {
                ELEM.data = data;
            },
            async:false
        })

        //添加表格体
        ELEM.tbody = "<tbody></tbody>>";
        _config.elem.append(ELEM.tbody);
        $("tbody tr").append("<th></th>");
        //填充数据
        ELEM.data.map(function(item){
            $("tbody").append("<tr><th><input name='' lay-skin='primary' type='checkbox'></th></tr>")
            _config.defaultColumn.map(function (field) {
                var _field = field.field;
                $("tbody tr").append('<th>'+ _field +'</th>th>');
            })
        })

    };

    var table = new Table()
    exports(module_name,function (options) {
        return table.set(options);
    })
});
