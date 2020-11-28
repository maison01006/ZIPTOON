package kr.co.ziptoon.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.ziptoon.model.QnaService;
import kr.co.ziptoon.model.QnaVO;
import kr.co.ziptoon.model.UserService;
import kr.co.ziptoon.model.UserVO;
import kr.co.ziptoon.model.UserWebToonService;
import kr.co.ziptoon.model.UserWebtoonVO;
import kr.co.ziptoon.model.WatchedService;
import kr.co.ziptoon.model.WatchedVO;
import kr.co.ziptoon.model.WebToonService;
import kr.co.ziptoon.model.WebToonVO;

@Controller
public class CUDController {
	
	@Autowired
	UserWebToonService userWebToonService;
	@Autowired
	WatchedService watchedService;
	@Autowired
	WebToonService webToonService;
	@Autowired
	UserService userService;
	@Autowired
	QnaService qnaService;
	
	
	@ResponseBody
	@GetMapping(value ="/addMyPage",produces="text/plain;charset=UTF-8")
	public String addMyPage(@RequestParam("title") String title,HttpSession session) {
		String id = (String)session.getAttribute("userId");
		if(id.equals("")) {
			return "redirect:/login.do";
		}
		UserWebtoonVO vo = new UserWebtoonVO();
		
		vo.setUserId(id);
		vo.setWebtoonId(title);
		List<UserWebtoonVO> list = userWebToonService.getUserWebtoonOne(id, title);
		if(list.isEmpty()) {
			userWebToonService.insertUserWebtoon(vo);
		}else {
			userWebToonService.deleteUserWebtoon(vo);
		}
			
		
		return "Success";
	}
	@ResponseBody
	@GetMapping(value ="/updateRating",produces="text/plain;charset=UTF-8")
	public String addMyPage(@RequestParam("title") String title,@RequestParam("rating") int rating,HttpSession session) {
		String id = (String)session.getAttribute("userId");
		UserWebtoonVO vo = new UserWebtoonVO();
		
		vo.setUserId(id);
		vo.setRating(rating);
		vo.setWebtoonId(title);
		
		List<UserWebtoonVO> list = userWebToonService.getUserWebtoonOne(id, title);
		if(list.isEmpty()) {
			userWebToonService.insertUserWebtoon(vo);
		}

		userWebToonService.updateWebtoonRAting(vo);
		
		return "Success";
	}
	
	@ResponseBody
	@GetMapping(value ="/watch",produces="text/plain;charset=UTF-8")
	public String watch(@RequestParam("title") String title,@RequestParam("episode") String episode,HttpSession session) {
		String id = (String)session.getAttribute("userId");
		watchedService.insertWatched(id, title, episode);
		
		return "Success";
	}
	@GetMapping(value ="/deleteUser.do",produces="text/plain;charset=UTF-8")
	public String deleteUser(HttpServletRequest request,UserVO vo) {
		String [] list = request.getParameterValues("user");
		for(int i=0;i<list.length;i++) {
			
			userWebToonService.deleteUser(vo);
			watchedService.deleteUser(vo);
			qnaService.deleteUser(vo);
			userService.deleteUser(vo);
		}
		return "redirect:/manager-user?page=0";
	}
	@GetMapping(value ="/insertQna.do",produces="text/plain;charset=UTF-8")
	public String insertQna(HttpSession session,QnaVO vo) {
		if(session.getAttribute("userId")==null) {
			return "redirect:/";
		}
		vo.setUserId((String)session.getAttribute("userId"));
		qnaService.insertQna(vo);
		return "redirect:/";
	}
}
