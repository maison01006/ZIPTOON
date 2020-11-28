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

import kr.co.ziptoon.model.QnaVO;
import kr.co.ziptoon.model.UserVO;

@Repository
public class QnaDAO {
	private NamedParameterJdbcTemplate jdbc;
	private RowMapper<QnaVO> userRowMapper = BeanPropertyRowMapper.newInstance(QnaVO.class);
	public String SELECT_QNA_LIST = "SELECT id,user_id,title,type,date FROM qna";
	public String SELECT_QNA = "SELECT * FROM qna WHERE id =:id";
	public String SELECT_QNA_MY = "SELECT * FROM qna WHERE user_id =:userId";
	public String SELECT_QNA_MANAGER = "SELECT * FROM qna WHERE result = 'n'";
	public String DELETE_QNA = "SELECT * FROM qna  WHERE id=:id";
	public String INSERT_QNA = "INSERT INTO qna (user_id,title,type,text) values(:user_id,:title,:type,:text)";
	public String DELETE_USER = "DELETE FROM qna where user_id=:user_id";
	public QnaDAO(DataSource dataSource) {
		this.jdbc= new NamedParameterJdbcTemplate(dataSource);
	}
	
	public List<QnaVO> selectQnaList() {
		Map<String, Integer> params=new HashMap<>();
		return jdbc.query(SELECT_QNA_LIST, params,userRowMapper);
	}
	public List<QnaVO> selectQnaManagerList() {
		Map<String, Integer> params=new HashMap<>();
		return jdbc.query(SELECT_QNA_MANAGER, params,userRowMapper);
	}
	public List<QnaVO> selectQnaMyList(QnaVO vo) {
		Map<String, String> params=new HashMap<>();
		params.put("userId", vo.getUserId());
		return jdbc.query(SELECT_QNA_MY, params,userRowMapper);
	}
	public QnaVO selectQna(QnaVO vo) {
		Map<String, Integer> params=new HashMap<>();
		params.put("id", vo.getId());
		return jdbc.queryForObject(SELECT_QNA, params,userRowMapper); 
	}
	
	public void deleteQna(QnaVO vo) {
		Map<String, Integer> params=new HashMap<>();
		params.put("id", vo.getId());
		jdbc.update(DELETE_QNA, params); 
	}
	
	public void deleteUser(UserVO vo) {
		Map<String, String> params=new HashMap<>();
		params.put("id", vo.getId());
		jdbc.update(DELETE_USER, params); 
	}
	public void insertQna(QnaVO vo) {
		Map<String, Object> params=new HashMap<>();
		params.put("user_id", vo.getUserId());
		params.put("title", vo.getTitle());
		params.put("type", vo.getType());
		params.put("text", vo.getText());
		jdbc.update(INSERT_QNA, params); 
	}
}
