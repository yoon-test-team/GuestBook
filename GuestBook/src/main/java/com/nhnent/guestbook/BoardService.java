package com.nhnent.guestbook;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.nhnent.guestbook.Guest;

public interface BoardService {
	// 방명록 리스트 
	public List<Guest> getList();
	// 글 추가 
	@Transactional
	public Guest insert(Guest item);
	// 글 수정 
	@Transactional
	public void update(Guest item);
	// 글 삭제 
	@Transactional
	public void delete(int idx);
	// 비밀번호 확인
	public int checkPwd(Map<String, Object> param);
	
	public List<Guest> select(Map<String, Object> param);
	
	
}
