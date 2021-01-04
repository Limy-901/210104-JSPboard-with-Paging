package board.mvc.model;

import java.util.ArrayList;

import board.mvc.vo.ListResult;
import mvc.domain.Board;

public class BoardService {
	
	ListResult lr = new ListResult();
	
	private BoardDAO dao;
	private static final BoardService instance = new BoardService();
	
	private BoardService() {
		dao = new BoardDAO();
	}
	
	public static BoardService getInstance() {
		return instance;
	}
	
	/*public ArrayList<Board> listS(){
		return dao.list();
	}*/
	public ArrayList<Board> listS(int cp, int ps){
		return dao.list(cp, ps);
	}
	public void insertS(Board dto) {
		dao.insert(dto);
	}
	public boolean delS(int seq) {
		return dao.del(seq);
	}
	public ArrayList<Board> contentS(int seq) {
		return dao.content(seq);
	}
	public void DBupdateS(Board dto) {
		dao.DBupdate(dto);
	}
	
	public long total() {
		return dao.totalCount();
	}
	public ListResult getListResult(int cp, int ps) {
		return new ListResult(cp, total(), ps, listS(cp, ps));
	}
}
