package kr.co.ziptoon.model.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;

import kr.co.ziptoon.model.WebToonDetailVO;

@Repository
public class WebToonDetailDAO {
	private NamedParameterJdbcTemplate jdbc;
	private JdbcTemplate j;
	private RowMapper<WebToonDetailVO> webtoonRowMapper = BeanPropertyRowMapper.newInstance(WebToonDetailVO.class);
	
	public String WEBTOON_SELECT = "SELECT * FROM webtoon where id =:id limit :page,10";
	public String WEBTOON_COUNT = "SELECT count(*) FROM webtoon where id = ?";
	public String WEBTOON_DETAIL = "SELECT URL FROM webtoon where id=:id AND episode=:episode";
	
	public WebToonDetailDAO(DataSource dataSource) {
		this.jdbc= new NamedParameterJdbcTemplate(dataSource);
		this.j = new JdbcTemplate(dataSource);
	}
	
	public List<WebToonDetailVO> getWebToonList(String id,int page) {
		Map<String, Object> params=new HashMap<>();
		params.put("id",id);
		params.put("page",page);
		return jdbc.query(WEBTOON_SELECT, params,webtoonRowMapper);
	}
	public List<WebToonDetailVO> getWebToonDetail(String id,String episode) {
		Map<String, String> params=new HashMap<>();
		params.put("id",id);
		params.put("episode",episode);
		return jdbc.query(WEBTOON_DETAIL, params,webtoonRowMapper);
	}
	public int getWebToonCount(String id) {
		return j.queryForObject(WEBTOON_COUNT, new Object[] {id}, Integer.class);
	}
}
