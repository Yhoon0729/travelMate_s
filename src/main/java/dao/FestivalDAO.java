package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.Festival;

@Component
public class FestivalDAO {
	
	@Autowired
	SqlSessionTemplate session;
	String nameSpace = "festival";
	
	
	// 2. 축제 전체 리스트
	// XML 방식
	public List<Festival> getFestivalListAll() {
		List<Festival> result 
			=  session.selectList( nameSpace + ".getFestivalListAll" );
		return result;
	}// get
	
	
	// 3. 축제 정보 
	// XML 방식
	public Festival getFestivalInfo(String code) {
		
		Festival result 
			=  session.selectOne( nameSpace + ".getFestivalInfo", code );
		return result;
	}// get

	
	// 3. 축제 정보 
	// XML 방식
	public String getCountry(String country) {
		
		String result 
			=  session.selectOne( nameSpace + ".getCountry", country );
		return result;
	}// get

	

	// 4. 축제 입력
	public int insertFestival(Festival festival) {
		
		int result 
			=  session.insert( nameSpace + ".insertFestival", festival );
		return result;
	}// get

	
	
	// 5. 축제 전체 리스트
	public List<Festival> getFestivalList() {
		
		List<Festival> result 
			= session.selectList( nameSpace + ".getFestivalList");
		
		return result;
	}// get
	
	// 6. 축제 Update
	public int festivalUpdate( Festival festival ) {
		
		int result 
			= session.update( nameSpace + ".festivalUpdate", festival);
		
		return result;
	}// get

	// 7. 축제 Update
	public int festivalDelete( String code ) {
		
		int result 
			= session.delete( nameSpace + ".festivalDelete", code);
		
		return result;
	}// get

	
}// class
