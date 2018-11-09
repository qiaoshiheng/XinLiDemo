<%@ page contentType="text/html; charset=utf-8"%>
<%@ page isELIgnored="false" %>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<title>登录</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css"  media="all">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/style.css">
    </head>
    <body>
    	<div class="login-main">
    <header class="layui-elip">登录</header>
    <form class="layui-form">
        <div class="layui-input-inline">
            <input type="text" id="loginNum" name="loginNum" required lay-verify="required" placeholder="用户名" autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-input-inline">
            <input type="password" id="passWord" name="passWord" required lay-verify="required" placeholder="密码" autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-input-inline" style="display: flex;">
            <input style="width:50%;" type="text" id="userInputCheckCode" name="userInputCheckCode" required lay-verify="required" placeholder="请输入验证码" autocomplete="off"
                   class="layui-input">
            <img id="checkCodeImg" style="width:40%;margin-left:17px;"
            alt="点击切换验证码" class="layui-input" onclick="generateCheckCodeFresh()">
            <%-- <c:set var="checkCodeStrFromSession" value="${sessionScope.checkcode_session}"></c:set> --%>
            <!-- <input type="text" id="checkCodeStr" name="checkCodeStr"/> -->
        	<input type="hidden" id="userOpenId" name="userOpenId"/>
        </div>
        <div class="layui-input-inline login-btn">
            <button type="submit" lay-submit lay-filter="login" class="layui-btn">登录</button>
        </div>
        <hr/>
        <%-- <p><a id="to_registerJsp" href="${pageContext.request.contextPath}/com/wx/login/controller/toRegisterJsp" class="fl">立即注册</a><a href="javascript:;" class="fr">忘记密码？</a></p> --%>
    	<p><a id="to_registerJsp" href="${pageContext.request.contextPath}/com/wx/login/controller/toRegisterJsp" class="fl">立即注册</a><a href="javascript:;" class="fr">忘记密码？</a></p>
    </form>
</div>
		<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script type="text/javascript">
	var $ = layui.jquery;
	
    layui.use(['form','layer','jquery'], function () {
        // 操作对象
        var form = layui.form;
        var $ = layui.jquery;
        form.on('submit(login)',function (data) {
            // console.log(data.field);
            $.ajax({
                url:'${pageContext.request.contextPath}/com/wx/login/controller/loginVerify',
                data:{
                	"loginNum":$('#loginNum').val(),
                	"passWord":$('#passWord').val(),
                	"userInputCheckCode":$('#userInputCheckCode').val(),
                	"userOpenId":$('#userOpenId').val()
                },
                dataType:'json',
                type:'post',
                success:function (data) {
                	debugger
                    if (data.msg == '1'){
                        //location.href = "../index.php";
                    	layer.msg('登录成功!');
                    	setTimeout("location.href='${pageContext.request.contextPath}/com/wx/login/controller/successToMainIndexJsp'",1000);
                    }else if(data.msg=='2'){
                    	layer.msg('登录名或密码错误!');
                    }else if(data.msg=='0'){
                    	layer.msg('验证码错误!');
                    }else if(data.msg=='5'){
                    	layer.msg('您是普通用户,请使用微信端登录账号!');
                    }else if(data.msg=='6'){
                    	layer.msg('您还未通过审核!请联系系统管理员!');
                    }else if(data.msg=='7'){
                    	layer.msg('请使用您自己的微信登录该账号!');
                    }else{
                        layer.msg('用户不存在!');
                    }
                }
            })
            return false;
        })
 
    });
</script>
<script src="${pageContext.request.contextPath}/layui/jquery-3.2.1.js"></script>
<script>
	$(document).ready(function generateCheckCode(){
	    		debugger
	    		$('#checkCodeImg').attr('src', '${pageContext.request.contextPath}/com/wx/login/util/generateCheckCode? ' + new Date().getTime());//初始化验证码
	    		/* $('#checkCodeStr').val("${sessionScope}"); */
	    		var url=location.href;
	    		if(url.indexOf('code=')==-1){
	    			$('#to_registerJsp').hide();
	    		}
	    		getOpenId();
	    		toRegisterJsp();
	    	});
	function generateCheckCodeFresh(){
		$('#checkCodeImg').attr('src', '${pageContext.request.contextPath}/com/wx/login/util/generateCheckCode? ' + new Date().getTime());//初始化验证码
	}
	function toRegisterJsp(){
		var url=location.href;
		$.ajax({
			url:"${pageContext.request.contextPath}/com/wx/login/controller/addUrlToSession",
			data:{
				"url":url
			},
			dataType:'json',
            type:'post'
		})
	}
	function getOpenId(){
		var url2=location.href;
		$.ajax({
			url:"${pageContext.request.contextPath}/com/wx/verify/getopenid/dopost",
			data:{
				"url":url2
			},
			dataType:'json',
            type:'post',
            success: function(data){
            	debugger
            	if(data.openid !='error4'){
            		/* layui.use(['layer'],function(){
            			layer.msg("请使用微信端登录账号!");
            		}) */
            		$("#userOpenId").val(data.openid);
            	}
            }
		});
	}
</script>
    </body>
</html>