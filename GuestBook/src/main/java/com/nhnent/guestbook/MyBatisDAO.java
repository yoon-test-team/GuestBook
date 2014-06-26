package com.nhnent.guestbook;
import cubrid.jdbc.driver.*;
import cubrid.sql.*; 
import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class MyBatisDAO{

	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	protected final Log logger = LogFactory.getLog(getClass());

	public MybatisVO getMyBatis(int id) {
		SqlSession session = sqlSessionFactory.openSession();

		try {
			MybatisVO mybatis = (MybatisVO) session.selectOne("com.nhnent.guestbook.MybatisMapper.selectMybatis", id);
			return mybatis;
			
		}
		finally {
			session.close();
		}
	}

	 
	public static void main(String[] args) {
		MyBatisDAO dao = new MyBatisDAO();
		MybatisVO vo = dao.getMyBatis(1);
		System.out.println(vo.getTitle());
	}
	
}
