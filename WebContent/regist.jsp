<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册处理</title>
</head>
<body>
	<%
		//接收数据
		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String createdate=java.time.LocalDateTime.now().toString();
		//JDBC
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/mydb";
		Connection conn = DriverManager.getConnection(url, "root", "sa");
		Statement sm = conn.createStatement();
		//查询用户名是否被注册
		String sql = "select * from users where username='" + username+ "'";
		ResultSet rs = sm.executeQuery(sql);
		if (rs.next())
			out.println("<h3>用户已经存在！</h3>");
		else {//添加新用户
			sql = "insert into users(username,password,email,createdate) values('"
			     +username+"','"+password+"','"+email+"','"+createdate+ "')";
			int i = sm.executeUpdate(sql);
			if (i == 1)
				out.println("<h3>注册成功！</h3>");
			else
				out.println("<h3>注册失败！</h3>");
		}
	%>
</body>
</html>
