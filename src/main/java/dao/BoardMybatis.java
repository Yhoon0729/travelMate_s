package dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.Board;
import model.BoardComment;

@Component
public class BoardMybatis {

	@Autowired
	SqlSessionTemplate session;
	
	String namespace = "xml.board.";
	Map map = new HashMap();
	
	public int insertBoard(Board board) {
		int num = session.insert(namespace + "insertBoard", board);
		return num;
	}

	public List<Board> boardList(String boardId, int pageInt, int limit) {
		map.clear();
		map.put("boardId", boardId);
		map.put("start", (pageInt-1)*limit+1);
		map.put("end", pageInt*limit);
		List<Board> li = session.selectList(namespace + "boardList", map);
		return li;
	}

	public Board getBoard(int boardNum) {
		Board b = session.selectOne(namespace + "getBoard", boardNum);
		return b;
	}

	public int addReadCount(int boardNum) {
		int count = session.update(namespace + "addReadCount", boardNum);
		return count;
	}

	public int boardUpdate(Board board) {
		int num = session.update(namespace + "boardUpdate", board);
		return num;
	}
	
	public int boardDelete(int boardNum) {
		int count = session.update(namespace + "addReadCount", boardNum);
		return count;
	}

	public int boardCount(String boardId) {
		map.clear();
		map.put("boardId", boardId);
		int count = session.selectOne(namespace + "boardCount", map);
		return count;
	}

	public int insertComment(String commCon, int boardNum, String userId) {
		map.clear();
		map.put("commCon", commCon);
		map.put("boardNum", boardNum);
		map.put("userId", userId);
		int num = session.insert(namespace + "insertComment", map);
		return num;
	}
	
	public int getCommentCount(int boardNum) {
		int count = session.selectOne(namespace + "getCommentCount", boardNum);
		return count;
	}

	public List<BoardComment> commentList(int boardNum) {
		List<BoardComment> li = session.selectList(namespace + "commentList", boardNum);
		return li;
	}
	
	public Date getDate() {
		Date date = session.selectOne(namespace + "getDate");
		return date;
	}
}
