package kr.co.ziptoon.model.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import kr.co.ziptoon.model.UserVO;
import kr.co.ziptoon.model.UserWebtoonVO;
import kr.co.ziptoon.model.WatchedVO;
import kr.co.ziptoon.model.WebToonVO;

@Repository

public class WatchedDAO {
	private NamedParameterJdbcTemplate jdbc;
	private JdbcTemplate j;
	private RowMapper<WatchedVO> watchedRowMapper = BeanPropertyRowMapper.newInstance(WatchedVO.class);
	
	public String WATCHED_WEBTOON_LIST_SELECT = "SELECT episode FROM user_watched where user_id =:userId and webtoon_id =:webtoonId";
	public String WATCHED_WEBTOON_CLICK_SELECT = "SELECT click FROM user_watched where user_id =:userId and webtoon_id =:webtoonId and episode =:episode";
	public String DELETE_USER = "DELETE FROM user_watched where user_id = :id";
	public WatchedDAO(DataSource dataSource) {
		this.jdbc= new NamedParameterJdbcTemplate(dataSource);
		this.j = new JdbcTemplate(dataSource);
	}
	public List<WatchedVO> getWatched(String userId,String webtoonId) {
		Map<String, Object> params=new HashMap<>();
		params.put("userId",userId);
		params.put("webtoonId",webtoonId);
		return jdbc.query(WATCHED_WEBTOON_LIST_SELECT, params,watchedRowMapper);
	}

	public void insertWatched(String userId,String webtoonId, String episode) {
		Map<String, String> params=new HashMap<>();
		params.put("userId",userId);
		params.put("webtoonId",webtoonId);
		params.put("episode",episode);
		
		if(jdbc.query(WATCHED_WEBTOON_CLICK_SELECT, params,watchedRowMapper).isEmpty()) {
			j.update("INSERT INTO user_watched values(?,?,?,?)", userId,webtoonId,episode,1);	
		}
		else {
			int count = jdbc.query(WATCHED_WEBTOON_CLICK_SELECT, params,watchedRowMapper).get(0).getClick();
			j.update("update user_watched set click =? where user_id = ? and webtoon_id = ? and episode = ?",++count, userId,webtoonId,episode );
		}		
	}
	public void deleteUser(UserVO vo) {
		Map<String, String> params=new HashMap<>();
		params.put("id",vo.getId());
		jdbc.update(DELETE_USER, params);
	}
}
