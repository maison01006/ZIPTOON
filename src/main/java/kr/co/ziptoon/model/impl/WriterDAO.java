package kr.co.ziptoon.model.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import kr.co.ziptoon.model.WriterVO;

@Repository
public class WriterDAO{
	private NamedParameterJdbcTemplate jdbc;
	private RowMapper<WriterVO> writerRowMapper = BeanPropertyRowMapper.newInstance(WriterVO.class);
	
	public String WRITER_LIST_SELECT = "SELECT name FROM webtoon_writer ww inner join writer w on ww.writer_id = w.id where webtoon_id = :id";

	public WriterDAO(DataSource dataSource) {
		this.jdbc= new NamedParameterJdbcTemplate(dataSource);
	}
	public List<WriterVO> getWriterList(String id) {
		Map<String, String> params=new HashMap<>();
		params.put("id", id);
		return jdbc.query(WRITER_LIST_SELECT, params,writerRowMapper);
	}
}
