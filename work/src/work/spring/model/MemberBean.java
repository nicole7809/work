package work.spring.model;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/member/")
public class MemberBean {

	@Autowired
	private MemberDBService memberDAO = null;

	@RequestMapping("loginForm.do")
	public String loginForm() {
		return "member/loginForm";
	}

	@RequestMapping("loginPro.do")
	public String loginPro(MemberDataBean member, HttpSession session, Model model) throws Exception {
		int check = memberDAO.userCheck(member);
		if (check == 1) {
			session.setAttribute("memId", member.getId());
		}
		model.addAttribute("check", check);
		return "member/loginPro";
		
		
	}

	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
	 
		return "member/logout";
	}

	@RequestMapping("inputForm.do")
	public String inputForm(Model model) {

		return "member/inputForm";
	}

	//@RequestMapping(value = "inputPro.do", method = RequestMethod.POST)
	@RequestMapping("inputPro.do")
	public String inputPro(MemberDataBean dto) throws Exception {
		memberDAO.insertMember(dto);
		return "member/inputPro";
	}


	//@RequestMapping("confirmId.do")
	//public @ResponseBody String confirmId(MemberDataBean dto, MemberDataBean member, 
			//HttpSession session, Model model) throws Exception {
		//int check = memberDAO.confirmId(member);
		//int check = memberDAO.userCheck(member);
		//if (check == 1) {
			//memberDAO.insertMember(dto);
			//session.setAttribute("memId", member.getId());
		//}
		//model.addAttribute("check", check);
				
		//return check + "";
	//}
	
	
	@RequestMapping("confirmId.do")
	public @ResponseBody String confirmId(MemberDataBean member) throws Exception {
		int check = memberDAO.confirmId(member);
		return check + "";
	}

	

}
