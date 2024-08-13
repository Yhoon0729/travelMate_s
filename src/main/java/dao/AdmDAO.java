package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.AdmActAnal;
import model.AdmActLog;

@Service
public class AdmDAO {
	
	
	@Autowired
	SqlSessionTemplate session;
	
	String nameSpace = "admin";
	
	
	
	// 로그 리스트
	public List<AdmActLog> logList( int listStart, int listEnd ){
		
		Map<String, Integer> map = new HashMap<>();
		
		map.put( "listStart", listStart );
		map.put( "listEnd", listEnd );
					
		List<AdmActLog> result = session.selectList
				(nameSpace + ".logList", map);
		
		return result;
	}


	// 로그 리스트 갯수
	public int logListCount(){
		
		int result = session.selectOne(nameSpace + ".logListCount");
		
		return result;
	}

	

	
	// 로그 통계 자료
	public List<AdmActAnal> actAnalList(){
		
		List<AdmActAnal> result = session.selectList(nameSpace + ".actAnalList");
		
		return result;
	}

	
}//class
