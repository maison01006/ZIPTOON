package kr.co.ziptoon.model.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ziptoon.model.UserVO;
import kr.co.ziptoon.model.UserWebToonService;
import kr.co.ziptoon.model.UserWebtoonVO;

@Service
public class UserWebToonServiceImpl implements UserWebToonService{

	@Autowired
	UserWebToonDAO userWebToonDAO;
	
	@Override
	public List<UserWebtoonVO> getUserWebtoon(String id) {
		List<UserWebtoonVO> list = userWebToonDAO.getUserWebtoon(id);
		return list;
	}
	@Override
	public List<UserWebtoonVO> getUserWebtoonOne(String id, String webtoonId) {
		List<UserWebtoonVO> list = userWebToonDAO.getUserWebtoonOne(id, webtoonId);
		return list;
	}
	@Override
	public void insertUserWebtoon(UserWebtoonVO vo) {
		userWebToonDAO.favWebtoonInsert(vo);
	}

	@Override
	public void updateWebtoonRAting(UserWebtoonVO vo) {
		userWebToonDAO.ratingWebtoonUpdate(vo);	
	}
	@Override
	public void deleteUserWebtoon(UserWebtoonVO vo) {
		userWebToonDAO.deleteUserWebtoon(vo);
		
	}
	@Override
	public void deleteUser(UserVO vo) {
		userWebToonDAO.deleteUser(vo);
		
	}



	
}
