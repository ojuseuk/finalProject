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
import util.DateTimeUtil;

@Controller
public class EmpMgController {

	@Autowired
	private EmpMgService empMgService;
	@Autowired	
	private EmpMgDao empMgDao;
	@Autowired
	private CrsMgService crsMgService;
	

	@RequestMapping("/mgTchr")
	@PreAuthorize("hasRole('ROLE_STAFF')")
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
	public @ResponseBody USRDto usrSelect(@RequestParam("id") String id) {
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
		data.addAttribute("jsonLjsonListTchrist", jsonList);
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
			url = "emp/mgEmp";
			System.out.println("emp controller : " + list.size());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return url;
	}
	

	@RequestMapping("/empInsert")
	public String empInsert(EMPDto emp, Model data) {
		String url = "error";
		if(emp.getRetiredDt() != null) {
			emp.setRetiredDt(emp.getRetiredDt().replace("-", ""));
		}
		try {
			empMgService.empInsert(emp);
			data.addAttribute("list", empMgService.empSelectAll());
			data.addAttribute("resultMsg", "직원 정보가 정상적으로 등록되었습니다.");
			url ="emp/mgEmp";  	

		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("OK");
		return url;
	}
											   
	@RequestMapping(value="/empUpdate")
	public String empUpdate(EMPDto emp, Model data) {
		System.out.println("/empUpdate update Controller : " + emp);
		String url = "error";
		if(emp.getRetiredDt() != null) {
			emp.setRetiredDt(emp.getRetiredDt().replace("-", ""));
		}
		try {
			empMgService.empUpdate(emp);
			data.addAttribute("list", empMgService.empSelectAll());
			data.addAttribute("resultMsg", "직원 정보가 정상적으로 수정되었습니다.");
			// 날짜처럼 보이기 위해 '-' 삽입
			if(emp != null) {
				if(!emp.getRetiredDt().equals("")) {
					emp.setRetiredDt(DateTimeUtil.dateForm(emp.getRetiredDt()));
				}
			}
			data.addAttribute("emp", emp); // @@@		20171120
			url ="emp/mgEmp";  	
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("OK");
		return url;
	}
	
	@RequestMapping(value="/tchrUpdate")
	public String tchrUpdate(TCHRDto tchr, Model data) {
		System.out.println("tchrUpdate Controller : " + tchr);
		String url = "error";
		try {
			empMgService.tchrUpdate(tchr);
			data.addAttribute("list", empMgService.tchrSelectAll());
			data.addAttribute("sbjtList", crsMgService.sbjtSelectAll());
			data.addAttribute("resultMsg", "강사 정보가 정상적으로 수정되었습니다.");
			
			url ="tchr/mgTchr";  	
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("tchrUpdate OK");
		return url;
	}
	
	@RequestMapping(value="/empRetire")
	public String empRetire(EMPDto emp, Model data) {
		System.out.println("update"); // @@@
		System.out.println("Controller : " + emp); // @@@
		String url = "error";
		if(emp.getRetiredDt() != null) {
			emp.setRetiredDt(emp.getRetiredDt().replace("-", ""));
		}
		try {
			empMgService.empRetire(emp);
			data.addAttribute("list", empMgService.empSelectAll());
			url ="emp/mgEmp";  	
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("OK");
		return url;
	}
	
	
	@RequestMapping(value="/assgnTchr", method=RequestMethod.POST, produces = "application/json; charset=utf8")
	public @ResponseBody String assgnTchr(TCHRASSNDto tchrAssn) {
		System.out.println("강사 배정 : controller : tchrAssn : " + tchrAssn);
		System.out.println(empMgService.assnTchr(tchrAssn));
		return empMgService.assnTchr(tchrAssn);
	}
	
	@RequestMapping(value="/tchrInsert.do", method=RequestMethod.POST)
		public String tchrInsert(TCHRDto tchr, Model data, HttpSession session, @RequestParam("imgFile") MultipartFile imgFile) throws IllegalStateException, IOException {
		String url = "error";
		
// file upload 시작
		if(!imgFile.isEmpty()) {
			String path = session.getServletContext().getRealPath("/") + "imgs\\img\\";
			
			
			System.out.println("imgFile.getOriginalFilename() : " + imgFile.getOriginalFilename()); 
			System.out.println("imgFile.getName() : " + imgFile.getName()); 
			System.out.println("imgFile.getContentType() : " + imgFile.getContentType()); 
			
			String ext[] = imgFile.getOriginalFilename().split("\\.");
			
			System.out.println("tchr.getTchrNo().length() : " + tchr.getTchrNo().length()); 		// @@@
			
//			파일명을 "강사번호.확장자"로 변경
			System.out.println("ext[0] : " + ext[0]); 		// @@@
			System.out.println("ext[1] : " + ext[1]); 		// @@@
			
			File file = new File(path + tchr.getTchrNo() + "." + ext[1]);
			
			imgFile.transferTo(file);
			
			System.out.println("file.getName() : " + file.getName()); 
			System.out.println("file.getAbsoluteFile() : " + file.getAbsoluteFile()); 
			
			tchr.setTchrPt(file.getName());
			
			System.out.println("■path:::" + path);


		}
// file upload 끝
		
		try {
			System.out.println("controller : " + tchr);
			empMgService.tchrInsert(tchr);
			data.addAttribute("list", empMgService.tchrSelectAll());
			data.addAttribute("sbjtList", crsMgService.sbjtSelectAll());
			data.addAttribute("resultMsg", "강사 정보가 정상적으로 등록되었습니다.");
			url ="tchr/mgTchr";  	
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("Controller : Insert OK");
		
		 
		return url;
	}

} // end of class
