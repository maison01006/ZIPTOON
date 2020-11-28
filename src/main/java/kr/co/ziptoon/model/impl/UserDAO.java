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

@Repository

public class UserDAO  {
	private NamedParameterJdbcTemplate jdbc;
	private JdbcTemplate j;
	private RowMapper<UserVO> userRowMapper = BeanPropertyRowMapper.newInstance(UserVO.class);
	
	public String USER_SELECT = "SELECT * FROM user WHERE id=:id AND password=:password";
	public String CHECK_USER = "SELECT * FROM user WHERE id=:id";
	public String USER_LIST_SELECT = "SELECT * FROM user WHERE type=0 limit :start,20";
	public String UPDATE_LAST = "UPDATE user SET last = CURRENT_TIMESTAMP where id=?";
	public String DELETE_USER = "DELETE FROM user where id=:id";
	public UserDAO(DataSource dataSource) {
		this.jdbc= new NamedParameterJdbcTemplate(dataSource);
		this.j = new JdbcTemplate(dataSource);
	}
	
	public List<UserVO> login(String id, String password) {
		Map<String, String> params=new HashMap<>();
		params.put("id", id);
		params.put("password", password);
		return jdbc.query(USER_SELECT, params,userRowMapper);
	}
	public List<UserVO> check(String id) {
		Map<String, String> params=new HashMap<>();
		params.put("id", id);
		return jdbc.query(CHECK_USER, params,userRowMapper);
	}
	public void insertUser(UserVO vo) {
		j.update("INSERT INTO user (id,password,sex) SELECT ?, ?,? FROM DUAL  WHERE 0= (SELECT count(*) FROM user WHERE id = ? AND password = ?)",vo.getId(),vo.getPassword(),vo.getSex(),vo.getId(),vo.getPassword());
	}
	public List<UserVO> getUserList(int start){
		Map<String, Integer> params=new HashMap<>();
		params.put("start", start);
		return jdbc.query(USER_LIST_SELECT, params,userRowMapper);
	}
	public void updateLast(UserVO vo) {
		j.update(UPDATE_LAST,vo.getId());
	}
	public void deleteUser(UserVO vo) {
		Map<String, String> params=new HashMap<>();
		params.put("id", vo.getId());
		jdbc.update(DELETE_USER, params);
	}
}
