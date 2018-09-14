<%@page import="kr.co.jboard01.vo.BoardVO"%>
<%@page import="kr.co.jboard01.dao.BoardDAO"%>
<%@page import="kr.co.jboard01.config.DBConfig"%>
<%@page import="java.sql.DriverManager"%>
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
	
	BoardVO vo = new BoardVO();
	vo.setCate("notice");
	vo.setTitle(title);
	vo.setContent(content);
	vo.setRegip(regip);
	
	BoardDAO dao = BoardDAO.getInstance();
	dao.write(vo);
	
	//리스트 페이지 이동
	response.sendRedirect("../list.jsp");
%>