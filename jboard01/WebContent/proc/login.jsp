<%@page import="kr.co.jboard01.config.DBConfig"%>
<%@page import="kr.co.jboard01.vo.MemberVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//파라미터 수신
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String sql = "SELECT * FROM JB_MEMBER WHERE ";
		   sql += "uid='"+id+"' AND pass='"+pw+"';";
	
	out.println("sql : "+sql);
		   
	conn =  DBConfig.getConnect();
	//3단계
	stmt = conn.createStatement();
	//4단계
	rs = stmt.executeQuery(sql);
	//5단계
	if(rs.next()){
		//일치하는 회원이 있을경우
		MemberVO user = new MemberVO();
		
		user.setSeq(rs.getInt(1));
		user.setUid(rs.getString(2));
		user.setPass(rs.getString(3));
		user.setName(rs.getString(4));
		user.setNick(rs.getString(5));
		user.setEmail(rs.getString(6));
		user.setHp(rs.getString(7));
		user.setGrade(rs.getInt(8));
		user.setZip(rs.getString(9));
		user.setAddr1(rs.getString(10));
		user.setAddr2(rs.getString(11));
		user.setRegip(rs.getString(12));
		user.setRdate(rs.getString(13));
		//세션 저장
		session.setAttribute("user", user);
		//게시판 리스트 이동
		
		response.sendRedirect("../list.jsp");
	}else{
		//일치하는 회원이 없을경우
		//로그인 페이지 이동
		response.sendRedirect("../login.jsp?reg=fail");
	}
	
	//6단계
	rs.close();
	stmt.close();
	conn.close();
%>