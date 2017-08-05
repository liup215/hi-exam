@/*
    名称查询条件标签的参数说明:

    name : 查询条件的名称
    id : 查询内容的input框id
@*/

<label class="layui-form-label">${name}</label>
<div class="layui-input-block">
    <input id="${id}" type="text" lay-verify="required" placeholder="${placdholder!}" autocomplete="off" class="layui-input">
</div>