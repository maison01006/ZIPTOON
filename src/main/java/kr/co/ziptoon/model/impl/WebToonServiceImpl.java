package kr.co.ziptoon.model.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ziptoon.model.WebToonDetailVO;
import kr.co.ziptoon.model.WebToonService;
import kr.co.ziptoon.model.WebToonVO;


@Service
public class WebToonServiceImpl implements WebToonService{
	@Autowired
	WebToonDAO webToonDAO;
	
	@Override
	public List<WebToonVO> getWebToonList() {
		List<WebToonVO> webToonList = webToonDAO.getWebToonList();
		return webToonList;
	}
	@Override
	public List<WebToonVO> getWebToon(String id) {
		List<WebToonVO> webToon = webToonDAO.getWebToon(id);
		return webToon;
	}
	@Override
	public List<WebToonVO> getMyWebToonList(String id) {
		List<WebToonVO> webToon = webToonDAO.getMyWebToonList(id);
		return webToon;
	}
	@Override
	public List<WebToonVO> getWebToonListDistinct() {
		List<WebToonVO> webToonList = webToonDAO.getWebToonListDistinct();
		return webToonList;
	}
	@Override
	public List<WebToonVO> getPopularWebToonList(WebToonVO vo) {
		List<WebToonVO> list = webToonDAO.getPopularWebToonList(vo);
		return list;
	}
	@Override
	public List<WebToonVO> getSearchWebToon(String id) {
		List<WebToonVO> list = webToonDAO.getSearchWebToon(id);
		return list;
	}
	@Override
	public List<WebToonVO> getDayWebToon(int index) {
		List<WebToonVO> list = webToonDAO.getDayWebToon(index);
		return list;
	}
}
