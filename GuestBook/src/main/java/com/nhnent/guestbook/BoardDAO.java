package com.nhnent.guestbook;
import java.util.List;

import com.nhnent.guestbook.Guest;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;


public class BoardDAO {
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	protected final Log logger = LogFactory.getLog(getClass());

	public List<Guest> getList() {
		SqlSession session = sqlSessionFactory.openSession();

		try {
			List<Guest> guests = session.selectList("com.nhnent.guestbook.GuestMapper.selectAll");
			return guests;
		}
		finally {
			session.close();
		}
	}
	
	
	 public static void main(String args[]) {
	 
		 BoardDAO dao = new BoardDAO();
		 
		 for(Guest user : dao.getList()) {

		 System.out.println(user.getContents());

		 }
	 }
	

}
