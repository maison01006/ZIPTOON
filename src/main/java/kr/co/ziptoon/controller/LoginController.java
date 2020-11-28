package kr.co.ziptoon.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;


import kr.co.ziptoon.model.UserService;
import kr.co.ziptoon.model.UserVO;
import kr.co.ziptoon.model.UserWebToonService;
import kr.co.ziptoon.model.UserWebtoonVO;
import kr.co.ziptoon.model.WebToonService;
import kr.co.ziptoon.model.WebToonVO;
@Controller
public class LoginController {

	@Autowired
	UserService userService;
	@Autowired
	UserWebToonService userWebToonService;
	@Autowired
	WebToonService webtoonService;

	@PostMapping("/login.do")
	public String login(UserVO vo,HttpSession session) {
		List<UserVO> userList = userService.login(vo.getId(),vo.getPassword());
		if (userList.size()==1) {
			session.setAttribute("userId", userList.get(0).getId());
			session.setAttribute("type", userList.get(0).getType());
			userService.updateLast(vo);
			if(userList.get(0).getType()==1) {
				return "redirect:manager";
			}

			return "redirect:/";
		} else

			return "redirect:/";
	}
	@PostMapping("/minilogin.do")
	public String minilogin(UserVO vo,HttpSession session) {
		List<UserVO> userList = userService.login(vo.getId(),vo.getPassword());
		if (userList.size()==1) {
			session.setAttribute("userId", userList.get(0).getId());
			session.setAttribute("type", userList.get(0).getType());
			userService.updateLast(vo);
		}
		return "redirect:login";
	}
	@PostMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@PostMapping("/join.do")
	public String join(UserVO vo,HttpServletRequest request) {
		userService.insertUser(vo);
		UserWebtoonVO vo2 = new UserWebtoonVO();
		vo2.setUserId(vo.getId());
		String [] list = request.getParameterValues("like");
		if(list!=null) {
			for(int i=0;i<list.length;i++) {
				vo2.setWebtoonId(list[i]);
				userWebToonService.insertUserWebtoon(vo2);				
			}
		}

		return "redirect:/";
	}
}
