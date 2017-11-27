
layui.use(['jquery','form'],function(){
	window.jQuery = window.$ = layui.jquery;
	var form = layui.form;
    $(".layui-canvs").width($(window).width());
    $(".layui-canvs").height($(window).height());


    form.on("submit(login)",function (e) {
        var postData = e.field;
        $.ajax({
            url:"/login",
            type:"POST",
            data:postData,
            success:function (data) {
                if(data.code==200){
                    if(postData.isAdmin==1){
                        window.location.href = "/admin";
                    }else{
                        window.location.href = "/";
                    }

                }
            }
        })
        return false;
    })

});
