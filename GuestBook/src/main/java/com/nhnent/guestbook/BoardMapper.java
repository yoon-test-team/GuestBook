package com.nhnent.guestbook;

import java.util.ArrayList;

public interface BoardMapper {
	// 리스트 목록
	public ArrayList<Guest> getList();
	// 새 글 등록
	public int insert(Guest item);	
	// 글 수정 
	public void update(Guest item);	
	// 글삭제 
	public void delete(int idx);
}
