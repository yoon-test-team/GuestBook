package com.nhnent.guestbook;
import java.util.List;
import java.util.Map;

import com.nhnent.guestbook.Guest;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;


public class BoardDAO {
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	protected final Log logger = LogFactory.getLog(getClass());

	// guest book list 
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
	
	// guest item insert 
	public Guest insert(Guest item)
	{
		SqlSession session = sqlSessionFactory.openSession();
		try {
			session.insert("com.nhnent.guestbook.GuestMapper.insert",item);
			session.commit();
			return item;
		}
		catch(Exception e)
		{
			logger.error("BoardDAO Insert Error!! ");
			session.rollback();
			return null;
			
		}
		finally {
			session.close();
		}	
	}
	
	public int checkPwd(Map<String, Object> param)
	{
		SqlSession session = sqlSessionFactory.openSession();
		try {
			System.out.println(param.get("idx"));
			return session.selectOne("com.nhnent.guestbook.GuestMapper.chekcPassword",param);
		}
		catch(Exception e)
		{
			logger.error("checkPwd Check Error!! ");
			return -1;
			
		}
		finally {
			session.close();
		}	
	}
	// 방명록 가져오기 
	public List<Guest> select(Map<String, Object> param) {
		SqlSession session = sqlSessionFactory.openSession();

		try {
			return session.selectList("com.nhnent.guestbook.GuestMapper.select",param);
		}
		catch(Exception e)
		{
			logger.error("select Error!! ");
			return null;
		}
		finally {
			session.close();
		}
	}
	
	
		
/* for test	
	 public static void main(String args[]) {
	 
		 BoardDAO dao = new BoardDAO();
		 
		 for(Guest user : dao.getList()) {

		 System.out.println(user.getContents());

		 }
	 }
 */
	

}
