package work.spring.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("boardDAO")
public class BoardDBServiceMybatis implements BoardDBService {
	// String sql = "boardSQL.";

	@Autowired
	SqlSessionTemplate dao = null;

	@Override
	public void insertBoard(BoardDataBean board) throws Exception {
		dao.insert("board.insertBoard", board);

	}

	@Override
	public List<BoardDataBean> listAll(HashMap map) throws Exception{
		return dao.selectList("board.listAll", map);
	}

	@Override
	public void delete(int board) throws Exception{
		dao.delete("board.delete", board);

	}

	@Override
	public BoardDataBean detail(int num) throws Exception{
		return dao.selectOne("board.detail", num);
	}

	@Override
	public void updateContent(BoardDataBean board) throws Exception {
		dao.update("board.update", board);
	}

	@Override
	public BoardDataBean board(String id) throws Exception {
		return dao.selectOne("board.board", id);
	}

	@Override
	public int boardCount() throws Exception {
		return dao.selectOne("board.boardCount");
	}

}
