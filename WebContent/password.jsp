<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
	//用户登录判断
	String username = (String) session.getAttribute("username");
	if (username == null || username == "")
		response.sendRedirect("login.html");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改密码</title>
<script type="text/javascript">
	function check() {
		if (form1.pw0.value.length < 4) {
			alert("原密码长度不能小于4");
			return false;
		}
		if (form1.pw1.value.length < 4) {
			alert("新密码长度不能小于4");
			return false;
		}

		if (form1.pw2.value != form1.pw1.value) {
			alert("新密码不一致！");
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<h3>用户名：<%=username%></h3>
	<form name="form1" action="update.jsp" method="POST"onSubmit="return check();">
		<table>
			<tr>
				<td>原密码：</td>
				<td><input type="password" name="pw0" /></td>
			</tr>
			<tr>
				<td>新密码：</td>
				<td><input type="password" name="pw1" /></td>
			</tr>
			<tr>
				<td>确认密码：</td>
				<td><input type="password" name="pw2" /></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="hidden" name="username" value="<%=username%>" /> 
					<input type="submit" value="修改" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
