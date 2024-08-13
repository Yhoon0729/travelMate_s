package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.User;

@Component
public class UserMybatis {

	@Autowired
	SqlSessionTemplate session;
	String namespace = "xml.user.";
	
	Map map = new HashMap();
	
	public List<User> userList() {
		List<User> li = session.selectList(namespace + "userList");
		return li;
	}
	
	public User getUser(String userId) {
		map.clear();
		map.put("userId", userId);
		User user = session.selectOne(namespace + "getUser", map);
		System.out.println("유저마이바이바티스 uesr" + user);
		return user;
	}
	
	public int userInsert(User user) {
		int num = session.insert(namespace + "userInsert", user);
		return num;
	}

	public int userUpdate(User user) {
		int num = session.update(namespace + "userUpdate", user);
		return num;
	}

	public int userDelete(String userId) {
		map.clear();
    	map.put("userId", userId);
		int num = session.delete(namespace + "userDelete", map);
		return num;
	}
	
	public int chgPassUser(String userId, String chgPass) {
		map.clear();
    	map.put("userId", userId);
    	map.put("chgPass", chgPass);
		int num = session.update(namespace + "chgPassUser", map);
		return num;
	}
	
}
