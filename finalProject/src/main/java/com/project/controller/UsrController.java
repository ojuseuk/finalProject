package com.project.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
		try {
			int num = usrService.userInsert(usr);
			System.out.println(num);
			System.out.println("insert");
			System.out.println(data);
			url = "redirect:/main.jsp";

		} catch (Exception e) {
			return "redirect:/error.jsp";
			
		}
		return url;
	}

	// go idpwfind.jsp
	@RequestMapping(value = "idpwfind")
	public String idpwfind(HttpSession session) {
		return "user/idpwfind";
	}

	// find id
	@RequestMapping(value = "/findId")
	public @ResponseBody String findId(@RequestParam("nm") String nm, @RequestParam("phone") String phone) throws SQLException {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("nm", nm);
		map.put("phone", phone);
		JSONObject json = new JSONObject();
		USRDto usrdto = null;
		
		try {
			usrdto = usrService.findId(map);

			if (usrdto != null) {
				json.put("idCheck", usrdto.getId());
			} else {
				json.put("idCheck", false);
			}
			String data1 = json.toString();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return json.toString();
	}// end findId

	// find password
	@RequestMapping("/findPwd")
	@ResponseBody
	public String findPwd(String id, String email) throws SQLException {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("email", email);
		JSONObject json = new JSONObject();
		USRDto usrdto = null;
		try {
			usrdto = usrService.findPwd(map);
			if (usrdto != null) {
				json.put("pwdCheck", usrdto.getPw());
			} else {
				json.put("pwdCheck", false);
			}
			String data2 = json.toString();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return json.toString();
	}

	// goto the changePwdNew jsp
	@RequestMapping("changePwdNew")
	public String changePwdNew(String id, Model model) {
		model.addAttribute("id", id);
		return "/user/changePwdNew";
	}

	// after id check change pwd : new-password->pw
	@RequestMapping("afChangePwdNew")
	public String changePwdNew(String id, String pw) throws SQLException {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pw", pw);// 수정
		try {
			usrService.changePwdNew(map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			return "redirect:/error.jsp";
			
		}

		return "redirect:/main.jsp";
	}

	// idCheck : same id check
	@RequestMapping("/idCheck/{id}")
	@ResponseBody
	public String idCheck(@PathVariable("id") String id) throws SQLException {
		JSONObject json = new JSONObject();
		USRDto usrdto = null;
		try {
			usrdto = usrService.idCheck(id);
			
			if (usrdto != null) {
				json.put("idCheck", true);
			} else {
				json.put("idCheck", false);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return json.toString();
	}// end idcheck

	// go delUser.jsp
	@RequestMapping(value = "delUser")
	public String delUser(HttpSession session) {
		return "user/delUser";
	}
	
	// error :  go main.jsp
	@RequestMapping(value = "error")
	public String error(HttpSession session) {
		return "redirect:/main.jsp";
	}
	
	//userOut
	@RequestMapping(value ="/userOut")
	public @ResponseBody String userOut(String id,String pw) throws SQLException {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("pw", pw);
		JSONObject json = new JSONObject();
		try {
			usrService.userOut(map);
			
			String data1 = json.toString();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return json.toString();

	}
	
	// id, pw 확인창으로 이동
	@RequestMapping("inputUsrInfo")
	public String inputUsrInfo(){
		return "user/confirmUsr";
	}
	
	// id, pw 검증
	@RequestMapping("/confirmUsr")
	public ModelAndView confirmUsr(String id, String pw){
		ModelAndView mav = new ModelAndView();
		USRDto usr = new USRDto(id, pw);
		try {
			usr = usrService.confirmUsr(usr);
			
			if(usr == null){
				mav.addObject("usr", usr);
				mav.setViewName("user/confirmUsr");
			} else {
				mav.addObject("usr", usr);
				mav.setViewName("user/updateUsr");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			mav.setViewName("redirect:/error.jsp");
			return mav;
		}

		return mav;
	}
	
	@RequestMapping("changeUsr")
	public ModelAndView changeUsr(USRDto usr){
		ModelAndView mav = new ModelAndView();
		System.out.println(usr);
		boolean flag = false;
		
		try {
			flag = usrService.updateUsr(usr);
			if(flag){
				// 업데이트 성공시
				usr = usrService.confirmUsr(usr);
				mav.addObject("usr", usr);
				mav.setViewName("user/updateUsr");
			} else {
				// 업데이트 실패시
				mav.addObject("fail", "f");
				mav.setViewName("user/updateUsr");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			mav.setViewName("redirect:/error.jsp");
			return mav;
		}

		return mav;
	}
	
}// end controller
