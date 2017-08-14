/**
 * Created by Administrator on 2017/8/12.
 */
layui.define(['jquery','laypage'],function (exports) {
    window.$ = layui.jquery;
    var laypage = layui.laypage;

    var LayTable = function (options) {
        this.config = {
            table:undefined,
            page:undefined,
            nums:undefined,
            columns:undefined
        }
    };

    var seItem = null;
    var currentPage = 1;

    var TABLE = {};

    LayTable.prototype.set = function (options) {
        var _this = this;
        $.extend(true, _this.config, options);
        return _this;
    };

    LayTable.prototype.init = function () {
        var _this = this;
        var _config = _this.config;
        if(typeof(_config.table) !== 'string' && typeof(_config.table) !== 'object') {
            layer.alert('Table错误提示: elem参数未定义或设置出错');
        }
        var $tableContainer;
        if(typeof(_config.table) === 'string') {
            $tableContainer = $('#' + _config.table + '');
        }
        if(typeof(_config.table) === 'object') {
            $tableContainer = _config.table;
        }
        if($tableContainer.length === 0) {
            layer.alert('Table错误提示:找不到elem参数配置的容器，请检查.');
        }

        TABLE.tableContainer = $tableContainer;
        TABLE.columns = _config.columns;
        TABLE.data = TABLE.ajaxData(_config.ajax);
        TABLE.nums = _config.nums;
        TABLE.page = _config.page;
        TABLE.table = _config.table;

        TABLE.tableContainer.append("<thead><tr></tr></thead>");

        layui.each(TABLE.columns,function (index,item) {
            $("#"+_config.table +" thead tr").append("<td>"+item.name+"</td>");
        })
        TABLE.tableContainer.append("<tbody id = '"+_config.table+"Body'></tbody>");

        currentPage=1;
        seItem = null;
        return _this;
    };

    LayTable.prototype.getTable = function(){
        if(TABLE.tableContainer===undefined){
            this.init();
        }
        laypage({
            cont:TABLE.page,
            pages:Math.ceil(TABLE.data.length/TABLE.nums),
            skip:true,
            jump:function (obj) {
                currentPage = obj.curr;
                document.getElementById(TABLE.table + 'Body').innerHTML = TABLE.render(TABLE.columns,TABLE.data,obj.curr);
                $("tr").on('click',function () {
                    if($(this).hasClass('selected')){
                        $(this).removeClass('selected').css('background','');
                        seItem = null;
                    }else{
                        $(this).siblings('tr').each(function () {
                            if($(this).hasClass('selected')){
                                $(this).removeClass('selected').css('background','');
                            }
                        })
                        $(this).addClass('selected').css('background','#F1F2F7');

                        if(currentPage==-1){
                            seItem = TABLE.data[$(this).index()]
                        }else{
                            seItem = TABLE.data[(currentPage-1)*TABLE.nums+$(this).index()]
                        }
                    }
                })
            }
        });

    };



    LayTable.prototype.getSelectItem = function () {
        return seItem;
    };

    LayTable.prototype.refresh = function(){
        $("#"+TABLE.table).empty();
        $("#"+TABLE.page).empty();
        this.init();
        this.getTable();
    };

    TABLE.ajaxData = function(options){
        var content = null;
        $.ajax({
            url:options.url,
            type:options.type,
            success:function (data) {
                content = data;
            },
            async:false
        });
        return content;
    }

    TABLE.render = function(columns,data,curr) {
        var arr = [],
            items = [],
            thisData = data.concat().splice(curr*TABLE.nums-TABLE.nums,TABLE.nums);
        layui.each(thisData,function (index,item) {
            items=[];
            layui.each(columns,function (inx,itm) {
                var key = itm.field;
                for(var i in item){
                    if(i==key){
                        items.push("<td>"+item[i]+"</td>")
                    }
                }

            });
            arr.push("<tr>"+items.join('')+"</tr>");
        });
        return arr.join('')
    }
    var laytable = new LayTable();
    exports('laytable',function (options) {
        return laytable.set(options);
    })

})
