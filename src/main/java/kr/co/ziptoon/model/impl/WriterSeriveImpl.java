package kr.co.ziptoon.model.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ziptoon.model.WebToonService;
import kr.co.ziptoon.model.WebToonVO;
import kr.co.ziptoon.model.WriterService;
import kr.co.ziptoon.model.WriterVO;

@Service
public class WriterSeriveImpl implements WriterService{

	@Autowired
	WriterDAO writerDAO;
	
	@Override
	public List<WriterVO> getWriterList(String id) {
		List<WriterVO> list = writerDAO.getWriterList(id);
		return list;
	}
}
