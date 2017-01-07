<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>处理结果</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("username");
		String pw0 = request.getParameter("pw0");
		String password = request.getParameter("pw1");
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/mydb";
		Connection conn = DriverManager.getConnection(url, "root", "sa");
		Statement sm = conn.createStatement();
		String sql="select * from users where username='"+username+
				     "' and password='"+pw0+"'";
		ResultSet rs=sm.executeQuery(sql);
		if(rs.next()){
			sql="update users set password='" + password
				 + "' where username='" + username + "'";
		    int i = sm.executeUpdate(sql);
		    if (i == 1)
			    out.println("<h3>密码修改成功！</h3>");
		    else
			    out.println("<h3>修改失败！</h3>");
		}
		else out.println("<h3>无此用户！</h3>");
	%>
</body>
</html>