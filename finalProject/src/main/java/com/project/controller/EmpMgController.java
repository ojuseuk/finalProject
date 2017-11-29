package com.project.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.dao.EmpMgDao;
import com.project.dto.EMPDto;
import com.project.dto.TCHRASSNDto;
import com.project.dto.TCHRDto;
import com.project.dto.USRDto;
import com.project.service.CrsMgService;
import com.project.service.EmpMgService;

import net.sf.json.JSONArray;
import util.Constants;
import util.DateTimeUtil;

@Controller
public class EmpMgController {

	@Autowired
	private EmpMgService empMgService;
	@Autowired	
	private EmpMgDao empMgDao;
	@Autowired
	private CrsMgService crsMgService;
	

	@Secured("ROLE_STAFF")
	@RequestMapping("/mgTchr")
	public String tchrView(Model data) {
		String url = "error";
		System.out.println("controller tchrView");
		try {
			
			List list = empMgService.tchrSelectAll();
			List sbjtList = crsMgService.sbjtSelectAll();
			data.addAttribute("list", list);
			data.addAttribute("sbjtList", sbjtList);
			
			JSONArray jsonList = JSONArray.fromObject(list);
			JSONArray jsonSbjtList = JSONArray.fromObject(sbjtList);
			
			data.addAttribute("jsonList", jsonList);
			data.addAttribute("jsonSbjtList", jsonSbjtList);
			
			url = "tchr/mgTchr";
			System.out.println("tchr controller : " + list.size());

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return url;
	}
	
	@RequestMapping("/usrSearch")
	@PreAuthorize("hasRole('ROLE_STAFF')")
	public @ResponseBody USRDto usrSelect(@RequestParam("id") String id) {
		System.out.println(id);
		return empMgDao.usrSelect(id);
	}
	
	@RequestMapping("/empSearchById")
	public @ResponseBody EMPDto empSelectById(@RequestParam("id") String id) {
		return empMgDao.empSelectById(id);
	}
	
	@RequestMapping("/tchrSelectBySbjtNm")
	public @ResponseBody List<TCHRDto> tchrSelectBySbjtNm(@RequestParam("sbjtNm") String sbjtNm) {
		System.out.println("tchrSelectBySbjtNm : Controller : " + sbjtNm);
		return empMgService.tchrSelectBySbjtNm(sbjtNm);
	}
	
	@RequestMapping("/tchrSearchById")
	public @ResponseBody TCHRDto tchrSelectById(@RequestParam("id") String id) {
		return empMgDao.tchrSelectById(id);
	}
	
	@RequestMapping("/empSelect")
	public @ResponseBody EMPDto empSelect(@RequestParam("empNo") String empNo) {
		System.out.println("emp controller empNo : " + empNo);
		System.out.println("emp controller emp : " + empMgService.empSelect(empNo));
		return empMgService.empSelect(empNo);
	}
					 
	@RequestMapping("/tchrSelect")
	public @ResponseBody TCHRDto tchrSelect(@RequestParam("tchrNo") String tchrNo) {
		System.out.println("tchr controller tchrNo : " + tchrNo);
		TCHRDto tchr = empMgService.tchrSelect(tchrNo);
		System.out.println("tchr controller tchr : " + tchr);
		return tchr;
	}
	
	@RequestMapping("/tchrAssnSelect")
	@PreAuthorize("hasRole('ROLE_STAFF')")
	public @ResponseBody List<TCHRASSNDto> tchrAssnSelect(@RequestParam("clssId") String clssId, Model data) {
		System.out.println("강사 배정 조회 : Controller " + clssId);
		List list = empMgService.tchrAssnSelect(clssId);
		System.out.println("강사 배정 조회 : Controller : DB조회 후 : " + list); 
		JSONArray jsonList = JSONArray.fromObject(list);
		data.addAttribute("jsonListTchr", jsonList);
		return list;
	}

	
	@RequestMapping(value="/assgnTchr", method=RequestMethod.POST, produces = "application/json; charset=utf8")
	public @ResponseBody List<TCHRASSNDto> assgnTchr(TCHRASSNDto tchrAssn, Model data) {
		System.out.println("강사 배정 : controller : tchrAssn : " + tchrAssn);
		String resultMsg = "";
		resultMsg = empMgService.assnTchr(tchrAssn);
		List list = empMgService.tchrAssnSelect(tchrAssn.getClssId());
		JSONArray jsonList = JSONArray.fromObject(list);
		data.addAttribute("jsonListTchr", jsonList);
		return list;		
		
	}

	
	@RequestMapping("/emp")
	@PreAuthorize("hasRole('ROLE_STAFF')")
	public String empView(Model data) {
		String url = "error";
		
		try {
			List list =  empMgService.empSelectAll();
			data.addAttribute("list", list);
			
			JSONArray jsonList = JSONArray.fromObject(list);
			data.addAttribute("jsonList", jsonList);
			System.out.println(jsonList);
			url = "emp/mgEmp";
			System.out.println("emp controller list.size() : " + list.size());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return url;
	}
	

	@RequestMapping("/empInsert")
	public String empInsert(EMPDto emp, Model data) {
		String url = "error";
		String resultMsg = "";
		
		if(emp.getRetiredDt() != null) {
			emp.setRetiredDt(emp.getRetiredDt().replace("-", ""));
		}
		try {
			resultMsg = empMgService.empInsert(emp);
			url = listEmp(emp, data, resultMsg, url);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(resultMsg);
		return url;
	}
											   
	@RequestMapping(value="/empUpdate")
	public String empUpdate(EMPDto emp, Model data) {
		System.out.println("/empUpdate update Controller : " + emp);
		String url = "error";
		String resultMsg = "";

		try {
			resultMsg = empMgService.empUpdate(emp);
			url = listEmp(emp, data, resultMsg, url);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(resultMsg);
		return url;
	}
	
	private String listEmp(EMPDto emp, Model data, String resultMsg, String url) throws SQLException {
		List list =  empMgService.empSelectAll();
		data.addAttribute("list", list);
		
		JSONArray jsonList = JSONArray.fromObject(list);
		data.addAttribute("jsonList", jsonList);
		data.addAttribute("resultMsg", resultMsg);
		data.addAttribute("emp", emp); // @@@		20171120
		
		return "emp/mgEmp";  	
		
	}

	@RequestMapping(value="/empRetire")
	public String empRetire(EMPDto emp, Model data) {
		System.out.println("empRetire Controller : " + emp); // @@@
		String resultMsg = "";
		String url = "error";
		try {
			resultMsg = empMgService.empRetire(emp);
			url = listEmp(emp, data, resultMsg, url);
				
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(resultMsg);
		return url;
	}
	

	@RequestMapping(value="/tchrUpdate")
	public String tchrUpdate(TCHRDto tchr, Model data, HttpSession session, @RequestParam("imgFile") MultipartFile imgFile) throws IllegalStateException, IOException{
		if(!imgFile.isEmpty()) {
			uploadImg(tchr, session, imgFile);
		}		
		System.out.println("tchrUpdate Controller : " + tchr);
		String url = "error";
		String resultMsg = "";
		try {
			resultMsg = empMgService.tchrUpdate(tchr);
			List list = empMgService.tchrSelectAll();
			JSONArray jsonList = JSONArray.fromObject(list);
			
			data.addAttribute("list", list);
			data.addAttribute("jsonList", jsonList);
			
			data.addAttribute("sbjtList", crsMgService.sbjtSelectAll());
			data.addAttribute("resultMsg", resultMsg);
			
			url ="tchr/mgTchr";  	
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(resultMsg);
		return url;
	}
	
	@RequestMapping(value="/tchrInsert.do", method=RequestMethod.POST)
		public String tchrInsert(TCHRDto tchr, Model data, HttpSession session, @RequestParam("imgFile") MultipartFile imgFile) throws IllegalStateException, IOException {
		
		if(!imgFile.isEmpty()) {
			uploadImg(tchr, session, imgFile);
		}
		
		System.out.println("tchrInsert Controller : " + tchr);
		String url = "error";
		String resultMsg = "";		
		try {
			resultMsg = empMgService.tchrInsert(tchr);
			
			List list =  empMgService.tchrSelectAll();
			JSONArray jsonList = JSONArray.fromObject(list);
			data.addAttribute("list", list);
			data.addAttribute("jsonList", jsonList);
			
			data.addAttribute("sbjtList", crsMgService.sbjtSelectAll());
			data.addAttribute("resultMsg", resultMsg);
			
			url ="tchr/mgTchr";  	
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return url;
	}
	
	private void uploadImg(TCHRDto tchr, HttpSession session, MultipartFile imgFile) throws IllegalStateException, IOException {
		// TODO Auto-generated method stub
		String path = session.getServletContext().getRealPath("/") + "imgs\\img\\";
		
		System.out.println("imgFile.getOriginalFilename() : " + imgFile.getOriginalFilename()); 
		System.out.println("imgFile.getName() : " + imgFile.getName()); 
		System.out.println("imgFile.getContentType() : " + imgFile.getContentType()); 
		
		String ext[] = imgFile.getOriginalFilename().split("\\.");
		
		System.out.println("tchr.getTchrNo().length() : " + tchr.getTchrNo().length()); 		// @@@
		
		/*파일명을 "강사번호.확장자"로 변경*/
		System.out.println("ext[0] : " + ext[0]); 		// @@@
		System.out.println("ext[1] : " + ext[1]); 		// @@@
		
		File file = new File(path + tchr.getTchrNo() + "." + ext[1]);
		
		imgFile.transferTo(file);
		
		System.out.println("file.getName() : " + file.getName()); 
		System.out.println("file.getAbsoluteFile() : " + file.getAbsoluteFile()); 
		
		tchr.setTchrPt(file.getName());
		
		System.out.println("■path:::" + path);		
	}

} // end of class