package com.project.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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

	@RequestMapping(value = "/userInsert.do", method = RequestMethod.POST)
	public String userInsert(USRDto usr, Model data) {
		String url = "user/error";
		System.out.println("controller : " + usr);
//		try {
//			int num = usrService.userInsert(usr);
//			System.out.println(num);
//			System.out.println("insert");
//			System.out.println(data);
//			url = "redirect:/main.jsp";
//
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		System.out.println("OK");
		return url;
	}

	@RequestMapping(value = "/userLogin.do", method = RequestMethod.POST)
	public String userLogin(String id, String pw, HttpSession session, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("pw", pw);

		String url = "redirect:/main.jsp";
		USRDto usrDto = null;
		
		try {
			usrDto = usrService.userLogin(map);
			
			if (usrDto != null) {
				
				System.out.println("controller : " + usrDto);
				if(usrDto.getUsrTp() == null) {
					System.out.println("여기??");
				}else
				if (usrDto.getUsrTp().equals("staff")) {
					System.out.println("직원");
					session.setAttribute("id", id);
					session.setAttribute("name", usrDto.getNm());
					session.setAttribute("usrTp", usrDto.getUsrTp());
					
					url = "user/main_staff";
				} else if (usrDto.getUsrTp().equals("st")) {
					System.out.println("학생");
					session.setAttribute("id", id);
					session.setAttribute("name", usrDto.getNm());
					session.setAttribute("usrTp", usrDto.getUsrTp());
					
				} else if (usrDto.getUsrTp().equals("tchr")) {
					System.out.println("강사");
					session.setAttribute("id", id);
					session.setAttribute("name", usrDto.getNm());
					session.setAttribute("usrTp", usrDto.getUsrTp());
					
					url = "user/main_tchr";
				} else {
					System.out.println("사용자");
					session.setAttribute("id", id);
					session.setAttribute("name", usrDto.getNm());
//					session.setAttribute("usrTp", usrDto.getUsrTp());
					
					
				}
				
			} else {
				// 나중에 수정
				System.out.println("!1111111111111111111111111");
				try {
					String msg = "아이디 또는 비밀번호가 일치하지 않습니다.";
					msg = msg.replaceAll("\\+", "%20");
					
					url += "?login_errMsg="+URLEncoder.encode(msg, "UTF-8");
					
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return url;
	}

	// go logoutPro.jsp
	@RequestMapping(value = "logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "user/logoutPro";
	}

	// go idpwfind.jsp
	@RequestMapping(value = "idpwfind")
	public String idpwfind(HttpSession session) {
		return "user/idpwfind";
	}

	// find id
	@RequestMapping(value = "/findId")
	public @ResponseBody String findId(@RequestParam("nm") String nm, @RequestParam("phone") String phone)
			throws SQLException {
		System.out.println("controller nm : " + nm);
		System.out.println("controller phone : " + phone);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("nm", nm);
		map.put("phone", phone);
		JSONObject json = new JSONObject();
		USRDto usrdto = usrService.findId(map);

		if (usrdto != null) {
			json.put("idCheck", usrdto.getId());
		} else {
			json.put("idCheck", false);
		}
		String data1 = json.toString();
		System.out.println(data1);

		return json.toString();
	}// end findId

	// find password
	@RequestMapping("/findPwd")
	@ResponseBody
	public String findPwd(String id, String email) throws SQLException {
		System.out.println("controller id : " + id);
		System.out.println("controller email : " + email);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("email", email);
		JSONObject json = new JSONObject();
		USRDto usrdto = usrService.findPwd(map);

		if (usrdto != null) {
			json.put("pwdCheck", usrdto.getPw());
		} else {
			json.put("pwdCheck", false);
		}
		String data2 = json.toString();
		System.out.println(data2);
		return json.toString();
	}

	// goto the changePwdNew jsp
	@RequestMapping("changePwdNew")
	public String changePwdNew(String id, Model model) {
		System.out.println("changePwdNewcontroller id : " + id);
		model.addAttribute("id", id);
		return "/user/changePwdNew";
	}

	// after id check change pwd : new-password->pw
	@RequestMapping("afChangePwdNew")
	public String changePwdNew(String id, String pw) throws SQLException {
		System.out.println("afchangePwdNewcontroller id : " + id);
		System.out.println("afchangePwdNewcontroller pw : " + pw);
		HashMap<String, Object> map = new HashMap<String, Object>();
		System.out.println("아이디,비밀번호:" + id + "," + pw);
		map.put("id", id);
		map.put("pw", pw);// 수정
		usrService.changePwdNew(map);

		return "redirect:/main.jsp";
	}

	// idCheck : same id check
	@RequestMapping("/idCheck/{id}")
	@ResponseBody
	public String idCheck(@PathVariable("id") String id) throws SQLException {
		JSONObject json = new JSONObject();
		USRDto usrdto = usrService.idCheck(id);

		if (usrdto != null) {
			json.put("idCheck", true);
		} else {
			json.put("idCheck", false);
		}
		return json.toString();
	}// end idcheck

	// go delUser.jsp
	@RequestMapping(value = "delUser")
	public String delUser(HttpSession session) {
		return "user/delUser";
	}
	//userOut
	@RequestMapping(value ="/userOut")
	public @ResponseBody String userOut(String id,String pw) throws SQLException {
		System.out.println("userOutcontroller id : " + id);
		System.out.println("userOutcontroller pw : " + pw);
		HashMap<String, Object> map = new HashMap<String, Object>();
		System.out.println("아이디:" + id);
		System.out.println("비밀번호:" + pw);
		map.put("id", id);
		map.put("pw", pw);
		JSONObject json = new JSONObject();
		usrService.userOut(map);
		String data1 = json.toString();
		System.out.println(data1);
		return json.toString();

	}
	

}// end controller
