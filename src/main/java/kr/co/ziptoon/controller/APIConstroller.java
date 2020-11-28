package kr.co.ziptoon.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.co.ziptoon.model.UserService;
import kr.co.ziptoon.model.UserVO;
import kr.co.ziptoon.model.WatchedService;
import kr.co.ziptoon.model.WatchedVO;
import kr.co.ziptoon.model.WebToonService;
import kr.co.ziptoon.model.WebToonVO;

@RestController
public class APIConstroller {

	@Autowired
	WebToonService webToonService;
	@Autowired
	UserService userService;
	@Autowired
	WatchedService watchedService;
	
	@GetMapping(value = "/getAllWebtoon",produces="text/plain;charset=UTF-8")
	public String getAllWebToon() {
		JSONArray days = new JSONArray();
		JSONArray mon = new JSONArray();
		JSONArray tue = new JSONArray();
		JSONArray wed = new JSONArray();
		JSONArray thu = new JSONArray();
		JSONArray fri = new JSONArray();
		JSONArray sat = new JSONArray();
		JSONArray sun = new JSONArray();
		List<WebToonVO> list;
		try {
			list = webToonService.getWebToonList();
			for(WebToonVO vo : list){
				if(vo.getDay().equals("월")) {
					mon.add(dist(vo));
				}else if(vo.getDay().equals("화")) {
					tue.add(dist(vo));
				}else if(vo.getDay().equals("수")) {
					wed.add(dist(vo));
				}else if(vo.getDay().equals("목")) {
					thu.add(dist(vo));
				}else if(vo.getDay().equals("금")) {
					fri.add(dist(vo));
				}else if(vo.getDay().equals("토")) {
					sat.add(dist(vo));
				}else if(vo.getDay().equals("일")) {
					sun.add(dist(vo));
				}
			}
			days.add(mon);
			days.add(tue);
			days.add(wed);
			days.add(thu);
			days.add(fri);
			days.add(sat);
			days.add(sun);
			return days.toJSONString();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	@GetMapping(value = "/getWebtoon",produces="text/plain;charset=UTF-8")
	public String getWebToon(@RequestParam("day") int index) {
		
		JSONArray ja = new JSONArray();
		List<WebToonVO> webToonList;
		try {
			webToonList = webToonService.getDayWebToon(index);
			for(WebToonVO vo : webToonList){
				ja.add(dist(vo));
			}
			
			return ja.toJSONString();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public JSONObject dist(WebToonVO vo) {
		JSONObject jo = new JSONObject();
		jo.put("title", vo.getId());
		jo.put("img", vo.getImg());
		jo.put("days", vo.getDay());
		jo.put("web", vo.getWeb());
		jo.put("intro", vo.getIntroduction());
		return jo;
	}
	@GetMapping(value = "/getMyWebToon",produces="text/plain;charset=UTF-8")
	public String getMyWebToon(@RequestParam("id") String id) {
		JSONArray days = new JSONArray();
		JSONArray mon = new JSONArray();
		JSONArray tue = new JSONArray();
		JSONArray wed = new JSONArray();
		JSONArray thu = new JSONArray();
		JSONArray fri = new JSONArray();
		JSONArray sat = new JSONArray();
		JSONArray sun = new JSONArray();
		List<WebToonVO> list;
		try {
			list = webToonService.getMyWebToonList(id);
			for(WebToonVO vo : list){
				if(vo.getDay().equals("월")) {
					mon.add(dist(vo));
				}else if(vo.getDay().equals("화")) {
					tue.add(dist(vo));
				}else if(vo.getDay().equals("수")) {
					wed.add(dist(vo));
				}else if(vo.getDay().equals("목")) {
					thu.add(dist(vo));
				}else if(vo.getDay().equals("금")) {
					fri.add(dist(vo));
				}else if(vo.getDay().equals("토")) {
					sat.add(dist(vo));
				}else if(vo.getDay().equals("일")) {
					sun.add(dist(vo));
				}
			}
			days.add(mon);
			days.add(tue);
			days.add(wed);
			days.add(thu);
			days.add(fri);
			days.add(sat);
			days.add(sun);
			return days.toJSONString();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	@GetMapping(value = "/popularWebtoon",produces="text/plain;charset=UTF-8")
	public String getPopularWebtoon(WebToonVO vo) {
		vo.setWeb("daum");
		List<WebToonVO> daumList = webToonService.getPopularWebToonList(vo);
		vo.setWeb("naver");
		List<WebToonVO> naverList = webToonService.getPopularWebToonList(vo);
		JSONArray jad = new JSONArray();
		for(int i=0;i<daumList.size();i++) {
			jad.add(dist(daumList.get(i)));
		}
		JSONArray jan = new JSONArray();
		for(int i=0;i<daumList.size();i++) {
			jan.add(dist(naverList.get(i)));
		}
		JSONArray ja = new JSONArray();
		ja.add(jad);
		ja.add(jan);
		return ja.toJSONString();
	}
	@GetMapping(value = "/searchWebtoon",produces="text/plain;charset=UTF-8")
	public String getSearchWebtoon(WebToonVO vo) {
		List<WebToonVO> list = webToonService.getSearchWebToon(vo.getId());
		JSONArray ja = new JSONArray();
		for(int i=0;i<list.size();i++) {
			ja.add(dist(list.get(i)));
		}
		return ja.toJSONString();
	}
	
	@GetMapping("/check")
	public String check(@RequestParam("id") String id) {
		List<UserVO> user = userService.check(id);
		if(user.size()==1)
			return "false";
		return "true";
	}
	@GetMapping(value = "/watched",produces="text/plain;charset=UTF-8")
	public String getWatched(@RequestParam("webtoonId") String webtoonId,HttpSession session) {
		JSONArray ja = new JSONArray();
		String userId = (String)session.getAttribute("userId");
		List<WatchedVO> list = watchedService.getWatched(userId, webtoonId);
		for(int i=0;i<list.size();i++) {			
			ja.add(list.get(i).getEpisode());
		}
		return ja.toJSONString();
	}
}
