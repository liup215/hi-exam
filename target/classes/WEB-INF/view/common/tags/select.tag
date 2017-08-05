@/*
    select标签中各个参数的说明:
    name : select的名称
    id : select的id
    underline : 是否带分割线
@*/
    <label class="layui-form-label">${name}</label>
    <div class="layui-input-block">
        <select class="form-control" id="${id}">
            ${tagBody!}
        </select>
        @if(isNotEmpty(hidden)){
            <input class="form-control" type="hidden" id="${hidden}" value="${hiddenValue!}">
        @}
    </div>
@if(isNotEmpty(underline) && underline == 'true'){
    <div class="hr-line-dashed"></div>
@}


