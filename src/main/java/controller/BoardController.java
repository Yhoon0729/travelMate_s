package controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import dao.BoardMybatis;
import model.Board;
import model.BoardComment;

@Controller
@RequestMapping("/board/")
public class BoardController {
    HttpSession session;
    HttpServletRequest request;

    @Autowired
    BoardMybatis boarddao = new BoardMybatis();

    @ModelAttribute
    public void service(HttpServletRequest request) throws ServletException, IOException {
        this.request = request;
        session = request.getSession();
    }

    @RequestMapping("index")
    public String index() throws ServletException, IOException {
        return "index";
    }

    @RequestMapping("boardForm")
    public String boardForm() throws ServletException, IOException {
        return "board/boardForm";
    }

    @RequestMapping("boardPro")
    public String boardPro(@RequestParam("boardFile2") MultipartFile multipartFile, Board board)
            throws ServletException, IOException {
    	request.setCharacterEncoding("utf-8");
    	String userId = (String) session.getAttribute("userId");
    	
		String path = request.getServletContext().getRealPath("/") + "img/board/";
		String filename = "";
		if (!multipartFile.isEmpty()) {
			File file = new File(path, multipartFile.getOriginalFilename());
			filename = multipartFile.getOriginalFilename();

			multipartFile.transferTo(file);
		}

        String boardId = (String) session.getAttribute("boardId");
        board.setBoardId(boardId);
        board.setUserId(userId);
        board.setBoardFile(filename); // 파일명을 설정
        System.out.println(board);

        int num = boarddao.insertBoard(board);

        String msg = "게시물 등록 성공";
        String url = "board/boardList?boardId=" + boardId;

        if (num == 0) {
            msg = "게시물 등록 실패";
        }
        request.setAttribute("msg", msg);
        request.setAttribute("url", url);
        return "alert";
    }

    @RequestMapping("boardList")
    public String boardList(String boardId, String pageNum) throws ServletException, IOException {
        session.setAttribute("boardId", boardId);
        if (session.getAttribute("boardId") == null)
            boardId = "1";

        session.setAttribute("pageNum", pageNum);
        if (session.getAttribute("pageNum") == null)
            pageNum = "1";

        String boardName = "";
        switch (boardId) {
        case "1":
            boardName = "공지사항";
            break;
        case "2":
            boardName = "자유게시판";
            break;
        case "3":
            boardName = "QnA";
            break;
        default:
            boardName = "공지사항";
            break;
        }
        session.setAttribute("boardName", boardName);
        int count = boarddao.boardCount(boardId); // 총 게시글 수
        int limit = 10; // 페이지마다 게시글 10개
        int pageInt = Integer.parseInt(pageNum); // 페이지
        int boardNum = count - ((pageInt - 1) * limit); // start page의 serial 계산

        // 페이지 선택
        int bottomLine = 3;
        int start = (pageInt - 1) / bottomLine * bottomLine + 1;

        int end = start + limit - 1;
        int maxPage = (count / limit) + (count % limit == 0 ? 0 : 1);
        if (end > maxPage)
            end = maxPage;

        List<Board> li = boarddao.boardList(boardId, pageInt, limit);

        request.setAttribute("bottomLine", bottomLine);
        request.setAttribute("start", start);
        request.setAttribute("end", end);
        request.setAttribute("maxPage", maxPage);
        request.setAttribute("pageInt", pageInt);
        request.setAttribute("boardNum", boardNum);

        request.setAttribute("boardName", boardName);
        request.setAttribute("li", li);
        request.setAttribute("boardId", boardId);
        request.setAttribute("nav", boardId);
        request.setAttribute("count", count);

        return "board/boardList";
    }

    @RequestMapping("boardInfo")
    public String boardInfo(int boardNum) throws ServletException, IOException {
        System.out.println(boardNum);
        
        boarddao.addReadCount(boardNum);
        int count = boarddao.getCommentCount(boardNum);
        Board board = boarddao.getBoard(boardNum);
        
        List<BoardComment> li = boarddao.commentList(boardNum);
        
        request.setAttribute("board", board);
        request.setAttribute("li", li);
        request.setAttribute("count", count);

        return "board/boardInfo";
    }

    @RequestMapping("boardCommentPro")
    public String boardCommentPro(String commCon, int boardNum) throws ServletException, IOException {
    	String userId = (String) session.getAttribute("userId");
        boarddao.insertComment(commCon, boardNum, userId);
        int count = boarddao.getCommentCount(boardNum);
        Date date = boarddao.getDate();
        request.setAttribute("commCon", commCon);
        request.setAttribute("count", count);
        request.setAttribute("date", date);
        
        return "single/boardCommentPro";
    }

    @RequestMapping("boardUpdate")
    public String boardUpdate(int boardNum) throws ServletException, IOException {
        System.out.println(boardNum);

        Board board = boarddao.getBoard(boardNum);
        request.setAttribute("board", board);

        return "board/boardUpdate";
    }

    @RequestMapping("boardUpdatePro")
    public String boardUpdatePro(@RequestParam("boardFile2") MultipartFile multipartFile, Board board)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String path = request.getServletContext().getRealPath("/") + "img/board/";

        Board boarddb = boarddao.getBoard(board.getBoardNum());

        String filename = null;
        
        if (!multipartFile.isEmpty()) {
            File file = new File(path, multipartFile.getOriginalFilename());
            filename = multipartFile.getOriginalFilename();
            multipartFile.transferTo(file);
            board.setBoardFile(filename);
        } else {
            board.setBoardFile(boarddb.getBoardFile());
        }

        String msg = "수정 되지 않았습니다";
        String url = "boardUpdate?boardNum=" + board.getBoardNum();

        String userId = (String) session.getAttribute("userId");
        if (boarddb != null) {
            if (boarddb.getUserId() == userId) {
                int count = boarddao.boardUpdate(board);
                if (count == 1) {
                    msg = "수정 되었습니다";
                    url = "boardInfo?boardNum=" + board.getBoardNum();
                }

            } else {
                msg = "비밀번호가 다릅니다";
            }
        } else {
            msg = "수정에 실패하였습니다";
        }
        request.setAttribute("msg", msg);
        request.setAttribute("url", url);

        return "alert";
    }

    @RequestMapping("boardDelete")
    public String boardDelete(int boardNum) throws ServletException, IOException {
        request.setAttribute("boardNum", boardNum);

        return "board/boardDelete";
    }

    @RequestMapping("boardDeletePro")
    public String boardDeletePro(int boardNum, String pass, String boardId) throws ServletException, IOException {
        Board boarddb = boarddao.getBoard(boardNum);

        String msg = "삭제 되지 않았습니다";
        String url = "boardDelete?boardNum=" + boardNum;

        String userId = (String) session.getAttribute("userId");

        if (boarddb != null) {
            if (boarddb.getUserId() == userId) {
                int count = boarddao.boardDelete(boardNum);
                if (count == 1) {
                    msg = "삭제 되었습니다";
                    url = "boardList?boardId=" + boardId;
                }
            } else {
                msg = "비밀번호가 다릅니다";
            }
        } else {
            msg = "삭제에 실패하였습니다";
        }
        request.setAttribute("msg", msg);
        request.setAttribute("url", url);

        return "alert";
    }
}
