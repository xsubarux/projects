<%@page import="kr.co.jboard01.config.DBConfig"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	//파라미터 수신
	request.setCharacterEncoding("UTF-8");

	String title = request.getParameter("subject");
	String content = request.getParameter("content");
	String uid = request.getParameter("uid");
	String regip = request.getRemoteAddr();
	
	Connection conn = null;
	Statement stmt = null;
		
	String sql  = "INSERT INTO JB_BOARD SET ";
		   sql += "cate='notice', ";
		   sql += "title='"+title+"', ";
		   sql += "content='"+content+"', ";
		   sql += "uid='"+uid+"', ";
		   sql += "regip='"+regip+"', ";
		   sql += "rdate=NOW();";
	
	conn = DBConfig.getConnect();	   
	//3단계
	stmt = conn.createStatement();
	//4단계
	stmt.executeUpdate(sql);
	//5단계
	//6단계
	stmt.close();
	conn.close();
	
	//리스트 페이지 이동
	response.sendRedirect("../list.jsp");
%>