package kr.co.ziptoon.model;

import java.util.List;

public interface UserWebToonService {

	List<UserWebtoonVO> getUserWebtoon(String id);
	List<UserWebtoonVO> getUserWebtoonOne(String id,String webtoonId);
	void insertUserWebtoon(UserWebtoonVO vo);
	void updateWebtoonRAting(UserWebtoonVO vo);
	void deleteUserWebtoon(UserWebtoonVO vo);
	void deleteUser(UserVO vo);
}