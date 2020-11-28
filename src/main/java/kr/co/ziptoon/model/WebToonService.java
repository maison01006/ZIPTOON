package kr.co.ziptoon.model;

import java.util.List;

public interface WebToonService {
	List<WebToonVO> getWebToonList();
	List<WebToonVO> getWebToon(String id);
	List<WebToonVO> getPopularWebToonList(WebToonVO vo);
	List<WebToonVO> getMyWebToonList(String id);
	List<WebToonVO> getWebToonListDistinct();
	List<WebToonVO> getSearchWebToon(String id);
	List<WebToonVO> getDayWebToon(int index);
}