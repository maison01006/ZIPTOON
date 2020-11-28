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
import kr.co.ziptoon.model.WebToonVO;

@Repository
public class WebToonDAO{
	private NamedParameterJdbcTemplate jdbc;
	private RowMapper<WebToonVO> webtoonRowMapper = BeanPropertyRowMapper.newInstance(WebToonVO.class);
	
	public String WEBTOON_LIST_SELECT = "select wi.id as id,img,web,day from webtoon_info wi inner join webtoon_day wd on wi.id = wd.id order by id";
	public String DISTINCT_WEBTOON_LIST_SELECT = "SELECT id, img FROM webtoon_info";
	public String MYWEBTOON_LIST_SELECT = "select id,img,day,web from (select w2.id as id,img,day,web from webtoon_info w2 inner join webtoon_day wd on wd.id = w2.id) wi inner join(select webtoon_id from user u inner join user_webtoon uw on u.id = uw.user_id where u.id = :id) w on wi.id = w.webtoon_id";
	public String WEBTOON_SELECT = "SELECT * FROM webtoon_info where id=:id";
	public String POPULAR_WEBTOON_SELECT = "SELECT * FROM webtoon_info where web=:web order by avg_rating desc limit 20";
	public String SEARCH_WEBTOON_SELECT = "SELECT * FROM webtoon_info WHERE id LIKE :id";
	public String DAY_WEBTOON_SELECT = "SELECT wi.id AS id,img,web,avg_rating,day FROM webtoon_info wi INNER JOIN webtoon_day wd ON wi.id=wd.id WHERE day=:day order by id";
	
	public String days[] = {"월","화","수","목","금","토","일"};
	public WebToonDAO(DataSource dataSource) {
		this.jdbc= new NamedParameterJdbcTemplate(dataSource);
	}
	
	public List<WebToonVO> getWebToonList() {
		Map<String, String> params=new HashMap<>();
		return jdbc.query(WEBTOON_LIST_SELECT, params,webtoonRowMapper);
	}
	public List<WebToonVO> getPopularWebToonList(WebToonVO vo) {
		Map<String, String> params=new HashMap<>();
		params.put("web", vo.getWeb());
		return jdbc.query(POPULAR_WEBTOON_SELECT, params,webtoonRowMapper);
	}
	public List<WebToonVO> getWebToonListDistinct() {
		Map<String, String> params=new HashMap<>();
		return jdbc.query(DISTINCT_WEBTOON_LIST_SELECT, params,webtoonRowMapper);
	}
	public List<WebToonVO> getMyWebToonList(String id) {
		Map<String, String> params=new HashMap<>();
		params.put("id", id);
		return jdbc.query(MYWEBTOON_LIST_SELECT, params,webtoonRowMapper);
	}
	public List<WebToonVO> getWebToon(String id) {
		Map<String, String> params=new HashMap<>();
		params.put("id", id);
		return jdbc.query(WEBTOON_SELECT, params,webtoonRowMapper);
	}
	public List<WebToonVO> getSearchWebToon(String id) {
		Map<String, String> params=new HashMap<>();
		params.put("id", "%"+id+"%");
		return jdbc.query(SEARCH_WEBTOON_SELECT, params,webtoonRowMapper);
	}
	public List<WebToonVO> getDayWebToon(int index) {
		Map<String, String> params=new HashMap<>();
		params.put("day", days[index]);
		return jdbc.query(DAY_WEBTOON_SELECT, params,webtoonRowMapper);
	}
}
