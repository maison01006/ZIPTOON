package kr.co.ziptoon.model;

import java.util.List;

public interface WatchedService {

	List<WatchedVO> getWatched(String userId, String webtoonId);

	void insertWatched(String userId, String webtoonId, String episode);
	void deleteUser(UserVO vo);
}