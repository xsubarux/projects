package kr.co.jboard01.dao;

public class SQL {
	
	
	//È¸¿ø
	
	//Äõ¸®¹®
	public static final String BOARD_COUNT = "SELECT COUNT(*) FROM JB_BOARD";
	public static final String BOARD_LIST = "SELECT * FROM JB_BOARD ORDER BY seq DESC LIMIT ?,10;";
	public static final String BOARD_WRITE  = "INSERT INTO JB_BOARD SET cate=?, title=?, content=?, uid=?, regip=?, rdate=NOW()";
	public static final String BOARD_VIEW = "SELECT * FROM JB_BOARD WHERE seq=?";
}
