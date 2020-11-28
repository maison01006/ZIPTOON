package kr.co.ziptoon.model;

import java.util.List;

public interface WebToonDetailService {

	List<WebToonDetailVO> getWebToonList(String id,int page);
	int getWebToonCount(String id);
	List<WebToonDetailVO> getWebToonDetail(String id,String episode);
}