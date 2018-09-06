package kr.co.jboard01.dao;

public class SQL {
	
	
	//È¸¿ø
	
	//Äõ¸®¹®
	public static final String BOARD_COUNT = "SELECT COUNT(*) FROM JB_BOARD";
	public static final String BOARD_LIST = "SELECT * FROM JB_BOARD ORDER BY seq DESC LIMIT ?,10;";

}
