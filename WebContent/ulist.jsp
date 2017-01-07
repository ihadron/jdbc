<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Users List</title>
</head>
<body>
	<%
		//1.使用Class类加载驱动程序
		Class.forName("com.mysql.jdbc.Driver");
		//2.连接数据库
		String url = "jdbc:mysql://localhost:3306/mydb";
		Connection conn = DriverManager.getConnection(url, "root", "sa");
		//3.Statement接口需要通过Connection接口进行实例化操作
		Statement sm = conn.createStatement();
		//4.执行查询,返回结果集
		String sql = "select * from users";
		ResultSet rs = sm.executeQuery(sql);
	%>
	<table border="1">
		<caption>Users列表</caption>
		<tr>
			<th>序号</th>
			<th>UserName</th>
			<th>Email</th>
			<th>权限</th>
			<th>注册时间</th>
		</tr>
		<%while (rs.next()) {%>
		<tr>
			<td><%=rs.getInt("id")%></td>
			<td><%=rs.getString("username")%></td>
			<td><%=rs.getString("email")%></td>
			<td><%=rs.getInt("role")%></td>
			<td><%=rs.getDate("createdate")%></td>
		</tr>
		<%}%>
	</table>
	<%
		sm.close();
		conn.close();
	%>
</body>
</html>