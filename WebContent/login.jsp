<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录处理</title>
</head>
<body>
	<%
		//接收数据
		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		//1.使用Class类加载驱动程序
		Class.forName("com.mysql.jdbc.Driver");
		//2.连接数据库
		String url = "jdbc:mysql://localhost:3306/mydb";
		Connection conn = DriverManager.getConnection(url, "root", "sa");
		//3.Statement接口需要通过Connection接口进行实例化操作
		Statement sm = conn.createStatement();
		//4.执行查询
		String sqlStr = "select * from users where username='";
		sqlStr = sqlStr + username + "' and password='" + password + "'";
		ResultSet rs = sm.executeQuery(sqlStr);
		//5.业务处理
		if (rs.next()) {
			out.println("<h3>登录成功！</h3>");
			session.setAttribute("username", username);
		} else
			out.println("用户名或密码不正确");
		//6.关闭
		sm.close();
		conn.close();
	%>
</body>
</html>
