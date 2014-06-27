package com.nhnent.guestbook;
import java.util.*;

public class BoardServiceImpl implements BoardService {
	private BoardMapper boardMapper;
	
	public void setBoardMapper(BoardMapper boardMapper) {
		this.boardMapper = boardMapper;
	}
	
	public  ArrayList<Guest> getList() {
		return boardMapper.getList();
	}
	
	public void insert(Guest item) {
		boardMapper.insert(item);
	}

	public void update(Guest item) {
		boardMapper.update(item);
	}
	
	public void delete(int idx) {
		boardMapper.delete(idx);
	}
	
	
}
