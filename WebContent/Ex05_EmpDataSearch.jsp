<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","kglim","1004");
		String sql="select empno, ename, sal , job from emp where empno=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(request.getParameter("empno")));
		rs = pstmt.executeQuery();
		
		out.print("<table border='1'>");
		while(rs.next()){
			out.print("<tr><th>empno</th><td>"+rs.getInt(1)+"</td></tr>");
			out.print("<tr><th>ename</th><td>"+rs.getString(2)+"</td></tr>");
			out.print("<tr><th>sal</th><td>"+rs.getInt(3)+"</td></tr>");
			out.print("<tr><th>job</th><td>"+rs.getString(4)+"</td></tr>");
		}
		out.print("</table>");
		
		if(pstmt != null) try{pstmt.close();}catch(Exception e){}
		if(rs != null) try{rs.close();}catch(Exception e){}
		if(conn != null) try{conn.close();}catch(Exception e){}
	%>