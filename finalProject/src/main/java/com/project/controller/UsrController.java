package com.project.controller;

import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String userLogin(String id,String pw,HttpSession session, Model model) throws SQLException{
		HashMap<String,Object> map=new HashMap<String,Object>();
		map.put("id",id);
		map.put("pw",pw);
		
		HashMap<String, Object> map1=usrService.userLogin(map);
		System.out.println(map1);
		String url = "";
		if(map1.get("USR_TP").equals("staff")) {
			session.setAttribute("staff", id);
			url ="user/main_staff";
		}else if(map1.get("USR_TP").equals("st")) {
			session.setAttribute("id", id);
			url = "redirect:/main.jsp";
		}else if(map1.get("USR_TP").equals("tchr")) {
			session.setAttribute("tchr", id);
			url = "user/main_tchr";
		}else {
			session.setAttribute("id", id);
			url = "redirect:/main.jsp";
		}
		
		if(map1!=null) {
		
		}else {
			//나중에 수정
			model.addAttribute("login_errMsg", "아이디 또는 비밀번호가 일치하지 않습니다.");		
		}
		return url;
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
	
	//비밀번호 찾기
	@RequestMapping("/findPwd")
	@ResponseBody
	public String findPwd(String id,String email,String phone) throws SQLException{
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("id", id);
		map.put("email", email);
		map.put("phone", phone);
		JSONObject json=new JSONObject();
		USRDto usrdto=usrService.findPwd(map);
		
		if(usrdto != null){
			json.put("pwdCheck", usrdto.getPw());
		}else{
			json.put("pwdCheck", false);
		}
		return json.toString();
	}
	
	
	//idcheck
	@RequestMapping("/idCheck/{id}")
	@ResponseBody
	public String idCheck(@PathVariable("id")String id) throws SQLException{
		JSONObject json=new JSONObject();
		USRDto usrdto=usrService.idCheck(id);
		
		if(usrdto != null){
			json.put("idCheck", true);
		}else{
			json.put("idCheck", false);
		}
		return json.toString();
	}//end idcheck
	
	
}//end controller 











