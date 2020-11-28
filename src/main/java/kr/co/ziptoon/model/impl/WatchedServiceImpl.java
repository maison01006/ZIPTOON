package kr.co.ziptoon.model.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ziptoon.model.UserVO;
import kr.co.ziptoon.model.UserWebtoonVO;
import kr.co.ziptoon.model.WatchedService;
import kr.co.ziptoon.model.WatchedVO;

@Service
public class WatchedServiceImpl implements WatchedService{

	@Autowired
	WatchedDAO watchedDAO;
	
	@Override
	public List<WatchedVO> getWatched(String userId, String webtoonId) {
		List<WatchedVO> list = watchedDAO.getWatched(userId, webtoonId);
		return list;
	}

	@Override
	public void insertWatched(String userId, String webtoonId, String episode) {
		watchedDAO.insertWatched(userId, webtoonId, episode);
	}

	@Override
	public void deleteUser(UserVO vo) {
		watchedDAO.deleteUser(vo);
		
	}

	
}
