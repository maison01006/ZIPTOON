package kr.co.ziptoon.model.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import kr.co.ziptoon.model.UserVO;
import kr.co.ziptoon.model.UserWebtoonVO;

@Repository
public class UserWebToonDAO{
	private NamedParameterJdbcTemplate jdbc;
	private JdbcTemplate j;
	private RowMapper<UserWebtoonVO> userWebtoonRowMapper = BeanPropertyRowMapper.newInstance(UserWebtoonVO.class);
	
	public String USER_SELECT = "SELECT * FROM user_webtoon WHERE user_id=:id ";
	public String USER_ONE_SELECT = "SELECT * FROM user_webtoon WHERE user_id=:id AND webtoon_id=:webtoon_id";
	public String FAV_WEBTOON_INSERT = "INSERT INTO user_webtoon (user_id,webtoon_id,fav) values(?,?,1)";
	public String WEBTOON_RATING_UPDATE = "UPDATE user_webtoon set rating =:rating where user_id=:id and webtoon_id=:webtoon_id";
	public String DELETE_USER_WEBTOON = "DELETE FROM user_webtoon WHERE user_id=:id AND webtoon_id=:webtoon_id";
	public String DELETE_USER = "DELETE FROM user_webtoon WHERE user_id=:id";
	public UserWebToonDAO(DataSource dataSource) {
		this.jdbc= new NamedParameterJdbcTemplate(dataSource);

		this.j = new JdbcTemplate(dataSource);
	}
	
	public List<UserWebtoonVO> getUserWebtoon(String id) {
		Map<String, String> params=new HashMap<>();
		params.put("id", id);
		return jdbc.query(USER_SELECT, params,userWebtoonRowMapper);
	}
	public List<UserWebtoonVO> getUserWebtoonOne(String id,String webtoonId) {
		Map<String, String> params=new HashMap<>();
		params.put("id", id);
		params.put("webtoon_id", webtoonId);
		return jdbc.query(USER_ONE_SELECT, params,userWebtoonRowMapper);
	}

	public void favWebtoonInsert(UserWebtoonVO vo) {
		j.update(FAV_WEBTOON_INSERT,vo.getUserId(),vo.getWebtoonId());
	  }
	public void  ratingWebtoonUpdate(UserWebtoonVO vo) {
		Map<String, Object> params=new HashMap<>();
		params.put("id", vo.getUserId());
		params.put("webtoon_id", vo.getWebtoonId());
		params.put("rating", vo.getRating());
		jdbc.update(WEBTOON_RATING_UPDATE, params);
	}
	public void deleteUserWebtoon(UserWebtoonVO vo) {
		Map<String, Object> params=new HashMap<>();
		params.put("id", vo.getUserId());
		params.put("webtoon_id", vo.getWebtoonId());
		jdbc.update(DELETE_USER_WEBTOON, params);
	}
	public void deleteUser(UserVO vo) {
		Map<String, Object> params=new HashMap<>();
		params.put("id", vo.getId());
		jdbc.update(DELETE_USER, params);
	}
}
