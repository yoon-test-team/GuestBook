package com.nhnent.guestbook;

import java.text.DateFormat;
import java.util.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nhnent.guestbook.BoardService;
import com.nhnent.guestbook.Guest;




/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController extends BoardServiceImpl {
	
	
	@Autowired
	BoardService service;
		
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		return "home";
	}	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String list(Locale locale, Model model) {
		
		List<Guest> list = service.getList();  // new BoardServiceImpl().getList();
		model.addAttribute("list",list);
		return "list";
	}
	

	
	@RequestMapping(value="/write.do", method=RequestMethod.POST)
	public String write(Guest item,Model model) {
		/*
		model.addAttribute("name", item.getName());
		model.addAttribute("email", item.getEmail());
		model.addAttribute("pwd", item.getPwd());
		model.addAttribute("contents", item.getContents());
		*/
		
		// insert 
		service.insert(item);
		
		// reload list 
		List<Guest> list = service.getList(); 
		model.addAttribute("list",list);
		
		return "list";
		
	}


	@RequestMapping(value="/check", method=RequestMethod.GET)
	public String check(Model model) {
		return "check";
	}

	
	@RequestMapping(value="/checkPassword.do",method=RequestMethod.POST)
	public @ResponseBody int chkPassword(@RequestParam Map<String, Object> param, ModelMap model)
	{
		return service.checkPwd(param);
	}
	
	@RequestMapping(value="/select.do")
	public @ResponseBody Map<?,?> select(@RequestParam Map<String, Object> param, ModelMap model)
	{
		model.put("results",service.select(param));
		return model;
	}
	
	
	
}
