package kr.co.ziptoon.model.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ziptoon.model.CategoryService;
import kr.co.ziptoon.model.CategoryVO;

@Service
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	CategoryDAO categoryDAO;
	
	@Override
	public List<CategoryVO> getCategoryList(String id) {
		List<CategoryVO> list = categoryDAO.getCategoryList(id);
		return list;
	}
	
}
