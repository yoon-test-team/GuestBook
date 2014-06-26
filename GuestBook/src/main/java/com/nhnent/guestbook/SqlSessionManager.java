package com.nhnent.guestbook;

import java.io.IOException;
import java.io.Reader;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/**
 * iBatis는 SqlMapClient 클래스, Mybatis는 SqlSessionFactory 클래스
 * query를 실행하기 위해서는 SqlSessionFactory를 통해서 SqlSession 객체를 생성하여 query를 실행할 수 있다.
 */
public class SqlSessionManager {
  public static SqlSessionFactory sqlSession;

  static {
    String resource = "Configuration.xml";
    //resource = "/src/Configuration.xml";
    Reader reader;

    try {
      reader = Resources.getResourceAsReader(resource);
      sqlSession = new SqlSessionFactoryBuilder().build(reader);
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  public static SqlSessionFactory getSqlSession() {
    return sqlSession;
  }
}