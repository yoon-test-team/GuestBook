package com.nhnent.guestbook;
import com.nhnent.guestbook.Guest;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;


public class BoardDAO {
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	protected final Log logger = LogFactory.getLog(getClass());

	public Guest getList() {
		SqlSession session = sqlSessionFactory.openSession();

		try {
			Guest guests = (Guest) session.selectOne("com.nhnent.guestbook.GuestMapper.selectAll","yoon");
			return guests;
		}
		finally {
			session.close();
		}
	}

}
