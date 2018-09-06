<%@page import="kr.co.jboard01.dao.BoardDAO"%>
<%@page import="kr.co.jboard01.config.DBConfig"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.jboard01.vo.MemberVO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.jboard01.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//파라미터 수신
	request.setCharacterEncoding("UTF-8");
	String pg = request.getParameter("pg");
	
	MemberVO user = (MemberVO)session.getAttribute("user");
	
	BoardDAO dao = new BoardDAO();
	int total = dao.getTotalCount();
	int start = dao.getLimit(pg);
	int paging = dao.getPage(total);
	List<BoardVO> list = dao.list(start);
%>