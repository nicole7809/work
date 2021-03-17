package work.spring.model;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/board/")
public class BoardBean {
	@Autowired
	private BoardDBService boardDAO = null;
	
	@RequestMapping("content.do")
	//게시판 상세내용
	public String content(Model model,@RequestParam int num) throws Exception { 
		//해당번호글상세내용
		BoardDataBean oen = boardDAO.detail(num);
		model.addAttribute("oen", oen);
	return "board/content"; 
	}

	//@RequestMapping("deleteForm.do")
	//public String deleteForm() {
		//return "board/deleteForm";}
	
	@RequestMapping("deletePro.do")
	public String deletePro(Model model,@RequestParam int num,HttpSession session) throws Exception {
		String id = (String) session.getAttribute("memId");
		BoardDataBean oen = boardDAO.detail(num);
		if(id.equals(oen.getId())) {
			boardDAO.delete(num);
			model.addAttribute("flag", "삭제했습니다.");
		}else {
			model.addAttribute("flag", "본인작성글아닌경우 삭제할수없습니다!");
		}
		return "board/deletePro";
	}
	
	@RequestMapping("list.do")
	public String list(Model model, HttpSession session,@RequestParam(defaultValue = "1", required = true) int pageNum) throws Exception {
		// 세션 아니디 확인
		//String id = (String) session.getAttribute("memId");
		int pageSize = 10;// 한 페이지의 글의 개수
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * pageSize + 1;// 한 페이지의 시작글 번호
		int endRow = currentPage * pageSize;// 한 페이지의 마지막 글번호
		int total =  boardDAO.boardCount();
		int count = total;
		int number = 1000;
		HashMap map =new HashMap();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<BoardDataBean> listAll = boardDAO.listAll(map);
		//System.out.println("listAll :: " + listAll.size());
		model.addAttribute("listAll", listAll);
		number = count - (currentPage - 1) * pageSize;// 글목록에 표시할 글번호
		// 해당 뷰에서 사용할 속성
		model.addAttribute("currentPage", new Integer(currentPage));
		model.addAttribute("startRow", new Integer(startRow));
		model.addAttribute("endRow", new Integer(endRow));
		model.addAttribute("count", new Integer(count));
		model.addAttribute("pageSize", new Integer(pageSize));
		model.addAttribute("number", new Integer(number));
		return "board/list";
	}
	
	@RequestMapping("updateForm.do")
	public String updateForm(HttpSession session, Model model,@RequestParam int num)  throws Exception {
		//String id = (String) session.getAttribute("memId");
		BoardDataBean boardDataBean = boardDAO.detail(num);
		model.addAttribute("c",boardDataBean);
		/*
		 * if(id.equals(c.getId())) { boardDAO.getBoard(id); model.addAttribute("c",
		 * "删除成功"); }else { model.addAttribute("c", "非本人信息无法删除"); }
		 */
		return "board/updateForm";
	}
	
	@RequestMapping("updatePro.do")
	public String updatePro(BoardDataBean dto,@RequestParam int num, HttpSession session, Model model) throws Exception {
		String id = (String) session.getAttribute("memId");
		BoardDataBean oen = boardDAO.detail(num);
		if(id.equals(oen.getId())) {
			boardDAO.updateContent(dto);
			model.addAttribute("flag", "수정했습니다.");
		}else {
			model.addAttribute("flag", "본인작성글아닌경우 삭제할수없습니다!");
		}
		return "board/updatePro";
	}
	
	@RequestMapping("writeForm.do")
	public String writeForm() {
		return "board/writeForm";
	}
	
	@RequestMapping(value = "writePro.do", method = RequestMethod.POST)
	public String writePro(BoardDataBean dto,HttpSession session)throws Exception {
		String id = (String) session.getAttribute("memId");
		dto.setId(id);
		boardDAO.insertBoard(dto);
		return "board/writePro";
	}
	
}
