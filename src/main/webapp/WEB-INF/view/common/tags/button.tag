@/*
    按钮标签中各个参数的说明:

    btnType : 按钮的类型决定了颜色(default-灰色,primary-绿色,success-蓝色,info-淡蓝色,warning-黄色,danger-红色,white-白色)
    space : 按钮左侧是否有间隔(true/false)
    clickFun : 点击按钮所执行的方法
    icon : 按钮上的图标的样式
    name : 按钮名称
@*/
<button type="button" class="layui-btn layui-btn-${btnType!}" lay-filter="${filter!}" onclick="${clickFun}" id=""${id!}>
    <i class="layui-icon">${icon!}</i>&nbsp;${name}
</button>