package kr.co.ziptoon.model;

import java.util.List;

public interface MessageService {

	List<MessageVO> selectMegReceive(MessageVO vo);

	List<MessageVO> selectMegSend(MessageVO vo);

}