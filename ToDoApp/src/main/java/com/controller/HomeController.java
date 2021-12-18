package com.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dao.TodoDao;
import com.entities.Todo;

@Controller
public class HomeController {
	
	@Autowired
	ServletContext context;
	
	@Autowired
	TodoDao todoDao;
	
	@RequestMapping("/home")
	public String home(Model m) {
		
		String s = "Home";
		m.addAttribute("page",s);
		
		List<Todo> list = this.todoDao.getAll();
		m.addAttribute("todos",list);
		return"home";
	}

	@RequestMapping("/add")
	public String addTodo(Model m) {
		
		Todo todo = new Todo();
		m.addAttribute("page","Add");
		m.addAttribute("todo",todo);
		return "home";
	}
	
	@RequestMapping(value="/saveTodo",method=RequestMethod.POST)
	public String saveTodo(@ModelAttribute("todo") Todo t, Model m) {
		String pattern = "E, dd MMM yyyy";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
		t.setTodoDate(simpleDateFormat.format(new Date()));
		this.todoDao.save(t);
		m.addAttribute("msg","Successfully Added!!");
		return "home";
		
	}
	
}
