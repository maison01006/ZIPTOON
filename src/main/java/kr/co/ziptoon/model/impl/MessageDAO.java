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
import kr.co.ziptoon.model.MessageVO;

@Repository
public class MessageDAO{
	private NamedParameterJdbcTemplate jdbc;
	private RowMapper<MessageVO> messageRowMapper = BeanPropertyRowMapper.newInstance(MessageVO.class);
	
	public String SELECT_MEG_RECEIVE = "SELECT distinct(send_user) FROM message where receive_user=:receiveId";
	public String SELECT_MEG = "select s.id as id, s.send_user as send_user, s.text as text, s.date as date, s.readYN as readYN from message s where s.send_user =:sendUser and s.receive_user=:receiveUser union select r.id as id, r.send_user as send_user, r.text as text, r.date as date, r.readYN as readYN from message r where r.send_user =:receiveUser and r.receive_user=:sendUser order by date";
	public MessageDAO(DataSource dataSource) {
		this.jdbc= new NamedParameterJdbcTemplate(dataSource);
	}

	public List<MessageVO> selectMegReceive(MessageVO vo) {
		Map<String, String> params=new HashMap<>();
		params.put("receiveId", vo.getReceiveUser());
		return jdbc.query(SELECT_MEG_RECEIVE, params,messageRowMapper);
	}

	public List<MessageVO> selectMegSend(MessageVO vo) {
		Map<String, String> params=new HashMap<>();
		params.put("sendUser", vo.getSendUser());
		params.put("receiveUser", vo.getReceiveUser());
		return jdbc.query(SELECT_MEG, params,messageRowMapper);
	}
}
