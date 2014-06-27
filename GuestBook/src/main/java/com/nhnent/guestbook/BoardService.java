package com.nhnent.guestbook;
import java.util.ArrayList;
import java.util.HashMap;
import com.nhnent.guestbook.Guest;

public interface BoardService {
	// 방명록 리스트 
	public ArrayList<Guest> getList();
	// 글 추가 
	public void insert(Guest item);
	// 글 수정 
	public void update(Guest item);
	// 글 삭제 
	public void delete(int idx);
	
	
	
	
}
