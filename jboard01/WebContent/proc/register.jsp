<%@page import="kr.co.jboard01.config.DBConfig"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//파라미터 수신
	request.setCharacterEncoding("UTF-8");

	String uid = request.getParameter("id");
	String pass = request.getParameter("pw1");
	String name = request.getParameter("name");
	String nick = request.getParameter("nick");
	String email = request.getParameter("email");
	String hp = request.getParameter("hp");
	String zip = request.getParameter("zip");
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");
	String regip = request.getRemoteAddr();
	
	Connection conn = null;
	PreparedStatement psmt = null;
	
	String sql = "INSERT INTO JB_MEMBER ";
		   sql += "(uid, pass, name, nick, email, hp, zip, addr1, addr2, regip, rdate)";
		   sql += "VALUES(?,?,?,?,?,?,?,?,?,?,NOW())";

	conn = DBConfig.getConnect();
	
	//3단계
	psmt = conn.prepareStatement(sql);
	psmt.setString(1, uid);
	psmt.setString(2, pass);
	psmt.setString(3, name);
	psmt.setString(4, nick);
	psmt.setString(5, email);
	psmt.setString(6, hp);
	psmt.setString(7, zip);
	psmt.setString(8, addr1);
	psmt.setString(9, addr2);
	psmt.setString(10, regip);
	//4단계
	psmt.executeUpdate();
	//5단계
	//6단계
	psmt.close();
	conn.close();
	//로그인페이지 이동
	response.sendRedirect("/jboard01/login.jsp?reg=success");
%>