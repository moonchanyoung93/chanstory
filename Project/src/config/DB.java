package config;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class DB {
		public static Connection getConn() {
			//context.xml에 설정된 dbcp에서 커넥션을 가져온다
			DataSource ds=null;
			Connection conn=null;
			try {
				Context ctx=new InitialContext();
				//context.xml의 Resource태그 검색
				ds=(DataSource)ctx.lookup("java:comp/env/oraDB");
				conn=ds.getConnection();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return conn;
		}

}
