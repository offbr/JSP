package pack.mybatis;

import java.io.Reader;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapConfig {
	public static SqlSessionFactory sqlSession; //Factory가 붙으면 거의 싱글톤이라봐도 된다
	//자바에서의 세션은 하나의 작업단위 유닛을 뜻한다.

	static {
		String resource = "pack/mybatis/Configuration.xml";

		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlSession = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
			
			//Annotation 사용 시 ----------------------
			Class[] mapper = {
					pack.business.SqlMapperInter.class
					//pack.business.SqlMapperInter.class		
			};
			
			for(Class m:mapper){
				//mapper 등록 작업
				//sqlSession.getConfiguration().addMapper(m);
				sqlSession.getConfiguration().addMapper(m);
			}
			//----------------------------------------
		} catch (Exception e) {
			System.out.println("SqlMapConfig 오류 : " + e);
		}
	}

	public static SqlSessionFactory getSqlSession() {
		return sqlSession;
	}
}