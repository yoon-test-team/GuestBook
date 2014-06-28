package com.nhnent.guestbook;
import java.util.*;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class BoardServiceImpl implements BoardService {
	
	public  ArrayList<Guest> getList() {
		ArrayList<Guest> list = new ArrayList<Guest>();
		list.add(new BoardDAO().getList());
		return list;
	}
				
	
	public void insert(Guest item) {
	//	boardMapper.insert(item);
	}

	public void update(Guest item) {
		//boardMapper.update(item);
	}
	
	public void delete(int idx) {
		//boardMapper.delete(idx);
	}
	
	
}
