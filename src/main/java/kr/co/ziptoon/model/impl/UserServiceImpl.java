package kr.co.ziptoon.model.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



import kr.co.ziptoon.model.UserService;
import kr.co.ziptoon.model.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDAO userDAO;
	@Override
	public List<UserVO> login(String id, String password) {
		List<UserVO> patientList = userDAO.login(id, password);
		return patientList;
	}
	@Override
	public List<UserVO> check(String id) {
		List<UserVO> user = userDAO.check(id);
		return user;
	}
	@Override
	public void insertUser(UserVO vo) {
		userDAO.insertUser(vo);
		
	}
	@Override
	public List<UserVO> getUserList(int start) {
		List<UserVO> list = userDAO.getUserList(start);
		return list;
	}
	@Override
	public void updateLast(UserVO vo) {
		userDAO.updateLast(vo);
		
	}
	@Override
	public void deleteUser(UserVO vo) {
		userDAO.deleteUser(vo);
		
	}
}
