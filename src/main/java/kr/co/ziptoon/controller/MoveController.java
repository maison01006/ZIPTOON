package kr.co.ziptoon.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.ziptoon.model.CategoryService;
import kr.co.ziptoon.model.CategoryVO;
import kr.co.ziptoon.model.MessageService;
import kr.co.ziptoon.model.MessageVO;
import kr.co.ziptoon.model.QnaService;
import kr.co.ziptoon.model.QnaVO;
import kr.co.ziptoon.model.UserService;
import kr.co.ziptoon.model.UserVO;
import kr.co.ziptoon.model.UserWebToonService;
import kr.co.ziptoon.model.UserWebtoonVO;
import kr.co.ziptoon.model.WatchedService;
import kr.co.ziptoon.model.WatchedVO;
import kr.co.ziptoon.model.WebToonDetailService;
import kr.co.ziptoon.model.WebToonDetailVO;
import kr.co.ziptoon.model.WebToonService;
import kr.co.ziptoon.model.WebToonVO;
import kr.co.ziptoon.model.WriterService;
import kr.co.ziptoon.model.WriterVO;

@Controller
public class MoveController {

	@Autowired
	WebToonDetailService webToonDetailService;
	@Autowired
	WebToonService webToonService;
	@Autowired
	WriterService writerService;
	@Autowired
	CategoryService categoryService;
	@Autowired
	UserWebToonService userWebToonService;
	@Autowired
	UserService userService;
	@Autowired
	QnaService qnaService;
	@Autowired
	MessageService messageService;
	
	
	
	@GetMapping("/test")
	public String goTest() {
		return "test";
	}
	@GetMapping("/webtoon")
	public String goWebtoon(Model model) {
		Calendar cal = Calendar.getInstance(); 
		int num = cal.get(Calendar.DAY_OF_WEEK)-1; 
		
		List<WebToonVO> list = webToonService.getWebToonList();
		List<WebToonVO> mon = new ArrayList<WebToonVO>();
		List<WebToonVO> tue = new ArrayList<WebToonVO>();
		List<WebToonVO> wed = new ArrayList<WebToonVO>();
		List<WebToonVO> thu = new ArrayList<WebToonVO>();
		List<WebToonVO> fri = new ArrayList<WebToonVO>();
		List<WebToonVO> sat = new ArrayList<WebToonVO>();
		List<WebToonVO> sun = new ArrayList<WebToonVO>();
		
		if(num==0) {
			for(int i=0;i<list.size();i++) {
				 if(list.get(i).getDay().equals("일")) {
					sun.add(list.get(i));
				}
			}
		}else if(num==1) {
			for(int i=0;i<list.size();i++) {
				if(list.get(i).getDay().equals("월")) {
					mon.add(list.get(i));
				}
			}
		}else if(num==2) {
			for(int i=0;i<list.size();i++) {
				if(list.get(i).getDay().equals("화")) {
					tue.add(list.get(i));
				}
			}
		}else if(num==3) {
			for(int i=0;i<list.size();i++) {
				if(list.get(i).getDay().equals("수")) {
					wed.add(list.get(i));
				}
			}
		}else if(num==4) {
			for(int i=0;i<list.size();i++) {
				if(list.get(i).getDay().equals("목")) {
					thu.add(list.get(i));
				}
			}
		}else if(num==5) {
			for(int i=0;i<list.size();i++) {
				if(list.get(i).getDay().equals("금")) {
					fri.add(list.get(i));
				}
			}
		}else{
			for(int i=0;i<list.size();i++) {
				if(list.get(i).getDay().equals("토")) {
					sat.add(list.get(i));
				}
			}
		}
		
		
		
		
		model.addAttribute("mon", mon);
		model.addAttribute("tue", tue);
		model.addAttribute("wed", wed);
		model.addAttribute("thu", thu);
		model.addAttribute("fri", fri);
		model.addAttribute("sat", sat);
		model.addAttribute("sun", sun);
		
		return "webtoon";
	}
	@GetMapping("/mywebtoon")
	public String gomyWebtoon() {
		return "mywebtoon";
	}
	@GetMapping("/search")
	public String gosearch(WebToonVO vo,Model model) {
		model.addAttribute("title", vo.getId());
		return "search";
	}
	@GetMapping("/toon")
	public String goToon(@RequestParam("id") String id,@RequestParam("page") int page,Model model,HttpSession session) {
		int num = webToonDetailService.getWebToonCount(id)/10;
		int p = page/10;
		int n= num/10;
		
		
		List<WebToonDetailVO> list= webToonDetailService.getWebToonList(id,page*10);
		WebToonVO webToon = webToonService.getWebToon(id).get(0);
		List<WriterVO> writerList = writerService.getWriterList(id);
		List<CategoryVO> categoryList = categoryService.getCategoryList(id);
		if(session.getAttribute("userId")!=null) {
			List<UserWebtoonVO> userWebtoonList = userWebToonService.getUserWebtoonOne((String)session.getAttribute("userId"),id);
			if(!userWebtoonList.isEmpty()) {
				model.addAttribute("star", userWebtoonList.get(0).getRating());
				model.addAttribute("fav", userWebtoonList.get(0).getFav());
			}
		}
		model.addAttribute("list", list);
		if(p>=1) {
			model.addAttribute("prev",true);
			model.addAttribute("prevpage", (p-1)*10);
		}
		else {
			model.addAttribute("prev",false);
		}
		
		if(n>p) {
			model.addAttribute("next",true);
			model.addAttribute("nextpage",(p+1)*10);
		}
		else {
			model.addAttribute("next",false);
		}
		
		if(p==n) {
			model.addAttribute("end",num);
		}else {
			model.addAttribute("end",(p*10)+9);
		}
		model.addAttribute("start", (p*10));
		model.addAttribute("id",id);
		model.addAttribute("page",page);
		model.addAttribute("img", webToon.getImg());
		model.addAttribute("web", webToon.getWeb());
		model.addAttribute("writer",writerList);
		model.addAttribute("category",categoryList);
		
		return "toon";
	}
	
	@GetMapping("/")
	public String goMain(Model model) {
		WebToonVO vo = new WebToonVO();
		vo.setWeb("naver");
		List<WebToonVO> naver = webToonService.getPopularWebToonList(vo);
		model.addAttribute("naver", naver);
		
		vo.setWeb("daum");
		List<WebToonVO> daum = webToonService.getPopularWebToonList(vo);
		model.addAttribute("daum", daum);
		return "main";
	}
	@GetMapping("/login")
	public String goLogin() {
		return "login";
	}
	@GetMapping("/join")
	public String goJoin(Model model) {
		List<WebToonVO> list = webToonService.getWebToonListDistinct();
		Collections.shuffle(list);
		List<WebToonVO> cList = new ArrayList<WebToonVO>();
		for(int i=0;i<24;i++) {
			cList.add(list.get(i));
		}
		model.addAttribute("webtoon", cList);
		return "join";
	}
	@GetMapping("/find")
	public String goFind() {
		return "find";
	}
	@GetMapping("/manager")
	public String manager(HttpSession session,Model model) {
		if(!session.getAttribute("type").equals(1)) {
			return "redirect:/";
		}else {
			model.addAttribute("userId", session.getAttribute("userId"));
			return "manager";
		}
			
	}
	@GetMapping("/manager-user")
	public String managerUser(@RequestParam("page") int page,HttpSession session,Model model) {
		if(!session.getAttribute("type").equals(1)) {
			return "redirect:/";
		}else {
			List<UserVO> userList = userService.getUserList(page);
			model.addAttribute("user", userList);
			return "manager-user";
		}
			
	}
	@GetMapping("/manager-qna")
	public String managerQna(HttpSession session,Model model) {
		if(!session.getAttribute("type").equals(1)) {
			return "redirect:/";
		}else {
			Date date = new Date();
			 SimpleDateFormat time = new SimpleDateFormat("yyyy-MM-dd");
			 List<String> timeList = new ArrayList<String>();
			 List<QnaVO> qnaList = qnaService.selectQnaManagerList();
			for(int i=0;i<qnaList.size();i++) {
				
				timeList.add(time.format(qnaList.get(i).getDate()));

			}
			model.addAttribute("time", timeList);
			model.addAttribute("qna", qnaList);
			return "manager-qna";
		}
			
	}
	@GetMapping("/meg.do")
	public String executeMeg(MessageVO vo,Model model) {
		List<MessageVO> list = messageService.selectMegReceive(vo);
		model.addAttribute("person", list);
		return "meg";
	}
	@GetMapping("/chat.do")
	public String executeChat(MessageVO vo,Model model,HttpSession session) {
		session.removeAttribute("sendUser");
		session.setAttribute("sendUser", vo.getSendUser());
		vo.setReceiveUser((String)session.getAttribute("userId"));
		List<MessageVO> list = messageService.selectMegSend(vo);
		model.addAttribute("meg", list);
		return "chat";
	}
	@GetMapping("/qna")
	public String qna() {
		return "qna";
	}
	@GetMapping("/myqnalist")
	public String myQnaList(Model model,QnaVO vo) {
		model.addAttribute("qna", qnaService.selectQnaMyList(vo));
		return "myqnalist";
	}
	@GetMapping("/qnapage")
	public String qnaPage(HttpSession session,Model model,QnaVO vo) {
		
//		
//		if(session.getAttribute("userId").equals("관리자")) {
//			return "redirect:qna-result";
//		}
		 model.addAttribute("data",qnaService.selectQna(vo) );
		return "qnapage";
	}
	@GetMapping("/introduction")
	public String goIntroduction() {
		return "introduction";
	}
	@GetMapping("/setting")
	public String goSetting() {
		return "setting";
	}
}
