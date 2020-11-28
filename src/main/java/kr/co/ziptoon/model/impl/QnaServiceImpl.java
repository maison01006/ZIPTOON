package kr.co.ziptoon.model.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ziptoon.model.QnaService;
import kr.co.ziptoon.model.QnaVO;
import kr.co.ziptoon.model.UserVO;

@Service
public class QnaServiceImpl implements QnaService{

	@Autowired
	QnaDAO qnaDao;
	
	
	@Override
	public List<QnaVO> selectQnaList() {
		List<QnaVO> list = qnaDao.selectQnaList();
		return list;
	}

	@Override
	public QnaVO selectQna(QnaVO vo) {
		QnaVO qna = qnaDao.selectQna(vo);
		return qna;
	}

	@Override
	public void deleteQna(QnaVO vo) {
		qnaDao.deleteQna(vo);
		
	}

	@Override
	public void deleteUser(UserVO vo) {
		qnaDao.deleteUser(vo);
		
	}

	@Override
	public void insertQna(QnaVO vo) {
		qnaDao.insertQna(vo);
	}

	@Override
	public List<QnaVO> selectQnaManagerList() {
		List<QnaVO> list = qnaDao.selectQnaManagerList();
		return list;
	}

	@Override
	public List<QnaVO> selectQnaMyList(QnaVO vo) {
		List<QnaVO> list = qnaDao.selectQnaMyList(vo); 
		return list;
	}

}
