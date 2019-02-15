<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DataSource JNDI</title>
</head>
<body>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
	<%
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/FirstDB_datasource");
		Connection con = ds.getConnection();
		String sql = "SELECT id, actor, product FROM acg_character.profile";

		Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
		ResultSet rs = stmt.executeQuery(sql);
		ResultSetMetaData rsmd = rs.getMetaData();
		
		out.print("<table border=\"1\">");
		out.print("<tr>");
		int cols = rsmd.getColumnCount();
		for (int i = 1; i <= cols; i++) {
			// print Column Names
			
			out.print("<th>" + rsmd.getColumnLabel(i) + "</th>");
			
		}
		out.print("</tr>");
		
		while (rs.next()) {
			int id = rs.getInt(1);
			String actor = rs.getString(2);
			String product = rs.getString(3);
			out.print("<tr>");			
			out.print("<td>"+ id + "</td>");
			out.print("<td>"+ actor + "</td>");
			out.print("<td>"+ product + "</td>");
			out.print("</tr>");	
		}
		out.print("</table>");
		rs.close();
		stmt.close();
	%>
</body>
</html>