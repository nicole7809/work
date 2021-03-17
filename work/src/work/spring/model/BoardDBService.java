package work.spring.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

public interface BoardDBService {
	
	//계시글 저장
	public void insertBoard(BoardDataBean board)throws Exception;
	
	//리스트 출력
	public List<BoardDataBean> listAll(HashMap map)throws Exception;
	
	//글 삭제
	public void delete(int board)throws Exception;
	
	//글 상세 내용 보기
	public BoardDataBean detail(int num)throws Exception;
	
	//글 수정
	public void updateContent(BoardDataBean board)throws Exception;
	
	public BoardDataBean board(String id)throws Exception;
	
	//글시 글 개수 
	public int boardCount()throws Exception;

	//public BoardDataBean getBoard(String id) throws Exception;




	


	
	
}
