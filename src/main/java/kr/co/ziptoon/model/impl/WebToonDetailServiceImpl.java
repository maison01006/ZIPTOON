package kr.co.ziptoon.model.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ziptoon.model.WebToonDetailService;
import kr.co.ziptoon.model.WebToonDetailVO;
import kr.co.ziptoon.model.WebToonService;

@Service
public class WebToonDetailServiceImpl implements WebToonDetailService{

	@Autowired
	WebToonDetailDAO webToonDetailDAO;
	
	@Override
	public List<WebToonDetailVO> getWebToonList(String id,int page) {
		List<WebToonDetailVO> webToonDetailList = webToonDetailDAO.getWebToonList(id,page);
		return webToonDetailList;
	}

	@Override
	public int getWebToonCount(String id) {
		return webToonDetailDAO.getWebToonCount(id);
	}

	@Override
	public List<WebToonDetailVO> getWebToonDetail(String id, String episode) {
		return webToonDetailDAO.getWebToonDetail(id, episode);
	}

}
