package kr.co.ziptoon.model.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ziptoon.model.MessageService;
import kr.co.ziptoon.model.MessageVO;

@Service
public class MessageServiceImpl implements MessageService{

	@Autowired
	MessageDAO messageDAO;
	
	@Override
	public List<MessageVO> selectMegReceive(MessageVO vo) {
		List<MessageVO> list = messageDAO.selectMegReceive(vo);
		return list;
	}

	@Override
	public List<MessageVO> selectMegSend(MessageVO vo) {
		List<MessageVO> list = messageDAO.selectMegSend(vo);
		return list;
	}

}
