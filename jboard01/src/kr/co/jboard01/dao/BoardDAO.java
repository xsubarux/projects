package kr.co.jboard01.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kr.co.jboard01.config.DBConfig;
import kr.co.jboard01.vo.BoardVO;

//DAO : DATA Access Object 4�ܰ�,5�ܰ�
//�����ͺ��̽��� ������ �����ϴ� ��ü
public class BoardDAO {
	
	//��ü �� ����
	public int getTotalCount() throws Exception {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		int count = 0;
		
		conn = DBConfig.getConnect();
		
		stmt = conn.createStatement();
		rs = stmt.executeQuery(SQL.BOARD_COUNT);
		
		if(rs.next()) {
			count = rs.getInt(1);
		}
		
		rs.close();
		stmt.close();
		
		return count;
	}
		
		//������ ���
		public int getPage(int total) {
			//������ ���
			int page = 0;

			if(total%10 == 0){
				page = total / 10;
			}else{
				page = total/10+1;
			}
			
			return page;
		}
		
		public int getLimit(String pg) {
			int start = 0;
			
			if(pg == null){
				start = 1;
			}else{
				start = Integer.parseInt(pg);		
			}
			return start;
		}

	
	//�۾���
	public void write() {}
	//�۸��
	public List<BoardVO> list(int start) throws Exception {
		
		//��ü�غ�
		Connection conn = null;
		
		PreparedStatement psmt = null;
		ResultSet rsList = null;
		
		List<BoardVO> list = new ArrayList<>();
		
		conn = DBConfig.getConnect();
		
		//3�ܰ�
		
		psmt = conn.prepareStatement(SQL.BOARD_LIST);
		psmt.setInt(1, start);
		rsList = psmt.executeQuery();
		
		while(rsList.next()){
			
			BoardVO vo = new BoardVO();
			vo.setSeq(rsList.getInt(1));
			vo.setParent(rsList.getInt(2));
			vo.setComment(rsList.getInt(3));
			vo.setCate(rsList.getString(4));
			vo.setTitle(rsList.getString(5));
			vo.setContent(rsList.getString(6));
			vo.setFile(rsList.getInt(7));
			vo.setHit(rsList.getInt(8));
			vo.setUid(rsList.getString(9));
			vo.setRegip(rsList.getString(10));
			vo.setRdate(rsList.getString(11));
			
			list.add(vo);
		}
		
		// 6�ܰ�
		rsList.close();
		
		
		psmt.close();
		conn.close();
		
		return list;
	}
	//�ۺ���
	public void view() {}
	//�ۼ���
	public void modify() {}
	//��۾���
	public void commentWrite() {}
	//��۸��
	public void commentList() {}

}
