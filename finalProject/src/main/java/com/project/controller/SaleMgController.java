package com.project.controller;

import java.sql.SQLException;
import java.util.List;

import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.dto.SALEDto;
import com.project.dto.TCHRASSNDto;
import com.project.dto.TCHRDto;
import com.project.service.SaleMgService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/saleMg")
public class SaleMgController {

	@Autowired
	private SaleMgService saleMgService;

	/**
	 * @Method Name : accep
	 * @작성일 : 2017. 11. 8.
	 * @작성자 : 오주석
	 * @Method 설명 : 
	 * return type : String
	 * @return
	 */
	@RequestMapping("/accep")
	@PreAuthorize("hasRole('ROLE_STAFF')")
	public String accep() {

		return "saleMg/accep";

	}

	/**
	 * @Method Name : saleMgInsert
	 * @작성일 : 2017. 11. 8.
	 * @작성자 : 오주석
	 * @Method 설명 : 학생 수강료 수납
	 * return type : void
	 * @param session
	 * @param date
	 * @param amount
	 * @param costItem
	 */
	@RequestMapping("/saleMgInsert")
	@PreAuthorize("hasRole('ROLE_STAFF')")
	public String saleMgInsert(@RequestParam("date") String date, @RequestParam("amount") int amount) {

		try {
			saleMgService.insert(date, amount);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			return "redirect:/error.jsp";
		}

		return "saleMg/accep";
	}

	/**
	 * @Method Name : saleMgLtfee
	 * @작성일 : 2017. 11. 9.
	 * @작성자 : 오주석
	 * @Method 설명 : 
	 * return type : void
	 */
	@RequestMapping("/ltfee")
	@PreAuthorize("hasRole('ROLE_STAFF')")
	public ModelAndView saleMgLtfee() {

		ModelAndView mav = new ModelAndView();

		Map<List<Map<String, String>>, List<Map<String, String>>> map = null;
		try {
			map = saleMgService.selectLtfee();
			
			Set<List<Map<String, String>>> set = map.keySet();

			List<Map<String, String>> listTchr = null;
			List<Map<String, String>> listSsn = null;
			for (List<Map<String, String>> list : set) {
				listTchr = list;
				listSsn = map.get(list);
			}
			
			mav.addObject("listTchr", listTchr);
			mav.addObject("listSsn", listSsn);
			mav.setViewName("/saleMg/ltfee");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			mav.setViewName("redirect:/error.jsp");
			return mav;
		}

		return mav;
	}

	/**
	 * @Method Name : saleMgManager
	 * @작성일 : 2017. 11. 9.
	 * @작성자 : 오주석
	 * @Method 설명 :
	 *  return type : String
	 * @return
	 */
	@RequestMapping("/manager")
	@PreAuthorize("hasRole('ROLE_STAFF')")
	public String saleMgManager() {

		return "/saleMg/saleManager";
	}

	/**
	 * @Method Name : saleMgmgSale
	 * @작성일	    : 2017. 11. 09.
	 * 최종 수정    : 2017. 11. 24. 
	 * @작성자	    : 
	 * @Method 설명	:
	 * return type  : List<SALEDto>
	 * @param year
	 * @param month
	 * @param day
	 * @return
	 */
	@RequestMapping("/mgSale")
	@PreAuthorize("hasRole('ROLE_STAFF')")
	public @ResponseBody List<SALEDto> saleMgmgSale(@RequestParam("year") int year, @RequestParam("month") int month, @RequestParam("day") int day) {


		List<SALEDto> list = null;
		try {
			list = saleMgService.mgSaleList2(year, month, day);
			JSONArray json = JSONArray.fromObject(list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;

	}

	/**
	 * @Method Name : saleMgltfeeInsert
	 * @작성일	    : 2017. 11. 12. 
	 * @작성자	    : 
	 * @Method 설명	:
	 * return type  : ModelAndView
	 * @param tchrId
	 * @param tchrSlr
	 * @param tchrNm
	 * @param ssnId
	 * @param ssnSlr
	 * @param ssnNm
	 * @return
	 */
	@RequestMapping("/ltfeeInsert")
	@PreAuthorize("hasRole('ROLE_STAFF')")
	public ModelAndView saleMgltfeeInsert(@RequestParam(value="tchrId", required=true) List<String> tchrId, 
	@RequestParam(value="tchrSlr", required=true) List<String> tchrSlr, @RequestParam(value="tchrNm", required=true) List<String> tchrNm, 
	@RequestParam(value="ssnId", required=true) List<String> ssnId, @RequestParam(value="ssnSlr", required=true) List<String> ssnSlr,
	@RequestParam(value="ssnNm", required=true) List<String> ssnNm) {
		
		ModelAndView mav = new ModelAndView();
		
		List<TCHRDto> list = null;
		try {
			list = saleMgService.ltfeeInsert(tchrId, tchrSlr, ssnId, ssnSlr, tchrNm, ssnNm);

			mav.addObject("list", list);
			mav.setViewName("saleMg/ltfeeConfirm");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			mav.setViewName("redirect:/error.jsp");
			return mav;
		}

		return mav;
		
	}
}
