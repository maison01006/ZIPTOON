package kr.co.ziptoon.model.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import kr.co.ziptoon.model.CategoryVO;


@Repository
public class CategoryDAO{
	private NamedParameterJdbcTemplate jdbc;
	private RowMapper<CategoryVO> categoryRowMapper = BeanPropertyRowMapper.newInstance(CategoryVO.class);
	
	public String CATEGORY_LIST_SELECT = "SELECT category FROM webtoon_category wc inner join category c on wc.category_id = c.id where webtoon_id=:id";

	public CategoryDAO(DataSource dataSource) {
		this.jdbc= new NamedParameterJdbcTemplate(dataSource);
	}
	public List<CategoryVO> getCategoryList(String id) {
		Map<String, String> params=new HashMap<>();
		params.put("id", id);
		return jdbc.query(CATEGORY_LIST_SELECT, params,categoryRowMapper);
	}
}
