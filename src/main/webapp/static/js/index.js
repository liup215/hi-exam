/**
 * Created by Administrator on 2017/8/23.
 */
layui.use(['carousel','element'], function(){
    var carousel = layui.carousel;
    var element = layui.element;
    var $ = layui.jquery;
    //建造实例
    carousel.render({
        elem: '#banner'
        ,width: '100%' //设置容器宽度
        ,arrow: 'always' //始终显示箭头
        // ,anim: 'updown' //切换动画方式
        // ,full:true
        ,arrow:"hover"
    });

    carousel.on('change(banner)', function(obj){ //test1来源于对应HTML容器的 lay-filter="test1" 属性值
        $("#banner-bg").attr('class',obj.item.attr('class'));
    });
});
