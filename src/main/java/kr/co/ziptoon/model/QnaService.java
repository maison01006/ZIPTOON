package kr.co.ziptoon.model;

import java.util.List;

public interface QnaService {

	List<QnaVO> selectQnaList();

	QnaVO selectQna(QnaVO vo);

	void deleteQna(QnaVO vo);

	void deleteUser(UserVO vo);

	void insertQna(QnaVO vo);
	List<QnaVO> selectQnaManagerList();
	
	List<QnaVO> selectQnaMyList(QnaVO vo);
}