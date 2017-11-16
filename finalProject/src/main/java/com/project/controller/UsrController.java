package com.project.controller;

import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.dto.USRDto;
import com.project.service.UsrService;

import net.sf.json.JSONObject;


@Controller
public class UsrController {

	@Autowired
	private UsrService usrService;
	
	public void setService(UsrService service) {
		this.usrService = service;
	}
	
	
	@RequestMapping(value="/userInsert.do",method=RequestMethod.POST)
	public String userInsert(USRDto usr, Model data) {
		String url = "user/error";
		System.out.println("controller : " + usr); 		
		try {
			usrService.userInsert(usr);
			System.out.println("insert");
			System.out.println(data);
			url ="user/main2";  	


		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("OK");
		return url;
	}
	
	@RequestMapping(value="/userLogin.do",method=RequestMethod.POST)
	public String userLogin(String id,String pw,HttpSession session,Model model) throws SQLException{
		HashMap<String,Object> map=new HashMap<String,Object>();
		map.put("id",id);
		map.put("pw",pw);
		
		
		HashMap<String, Object> map1=usrService.userLogin(map);
		

		if(map1!=null) {
			return "user/main2";
			}else {
				model.addAttribute("login_errMsg", "아이디 또는 비밀번호가 일치하지 않습니다.");
				session.setAttribute("id", id);
				return "redirect:/";
			}
		}
	
	@RequestMapping(value="logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "user/logoutPro";
	}
	
	//아이디 비밀번호 
	@RequestMapping(value="idpwfind")
	public String idpwfind(HttpSession session) {
		return "user/idpwfind";
	}
	
	//아이디 찾기 
	@RequestMapping(value="findId")
	public String findId(String nm, String phone) throws SQLException {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("nm", nm);
		map.put("phone", phone);
		JSONObject json = new JSONObject();
		USRDto usrdto=usrService.findId(map);
		
		if(usrdto != null) {
			json.put("idCheck", usrdto.getId());
		}else {
			json.put("idCheck", false);
		}
		return json.toString();
	}//end findId
	
	
	
	
	
	}//end controller 











