package kr.co.ziptoon.model;

import java.util.List;

public interface UserService {

	List<UserVO> login(String id, String password);
	List<UserVO> check(String id);
	void insertUser(UserVO vo);
	List<UserVO> getUserList(int start);
	public void updateLast(UserVO vo);
	public void deleteUser(UserVO vo);
}