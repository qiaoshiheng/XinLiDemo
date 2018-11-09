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
		<script type="text/javascript">
			alert("${pageContext.request.contextPath}")
		</script>
    </body>
</html>