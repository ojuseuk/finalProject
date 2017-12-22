package com.project.controller;

import java.util.List;

import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
	public String accep() {

		System.out.println("controller accep()");

		return "saleMg/accep";

	}

	/**
	 * @Method Name : saleMgInsert
	 * @작성일 : 2017. 11. 8.
	 * @작성자 : 오주석
	 * @Method 설명 : 
	 * return type : void
	 * @param session
	 * @param date
	 * @param amount
	 * @param costItem
	 */
	@RequestMapping("/saleMgInsert")
	public void saleMgInsert(HttpSession session, @RequestParam("date") String date, @RequestParam("amount") int amount) {

		System.out.println("controller saleMgInsert");
		String adminId = (String) session.getAttribute("adminId");

		saleMgService.insert(date, amount);

	}

	/**
	 * @Method Name : saleMgLtfee
	 * @작성일 : 2017. 11. 9.
	 * @작성자 : 오주석
	 * @Method 설명 : 
	 * return type : void
	 */
	@RequestMapping("/ltfee")
	public ModelAndView saleMgLtfee() {

		ModelAndView mav = new ModelAndView();
		System.out.println("controller saleMgLtfee");

		Map<List<Map<String, String>>, List<Map<String, String>>> map = saleMgService.selectLtfee();
		Set<List<Map<String, String>>> set = map.keySet();

		List<Map<String, String>> listTchr = null;
		List<Map<String, String>> listSsn = null;
		System.out.println("controller 성공 이후");
		for (List<Map<String, String>> list : set) {
			listTchr = list;
			listSsn = map.get(list);
			System.out.println(listTchr);
			System.out.println(listSsn);
		}
		
		
		mav.addObject("listTchr", listTchr);
		mav.addObject("listSsn", listSsn);
		mav.setViewName("/saleMg/ltfee");

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
	public String saleMgManager() {

		System.out.println("controller saleMgManager");

		return "/saleMg/saleTest";
	}

	/**
	 * @Method Name : saleMgMgSale
	 * @작성일 : 2017. 11. 9.
	 * @작성자 : 오주석
	 * @Method 설명 : 매출 리스트를 가져오기 위한 메소드 return type : void
	 */

/*	@RequestMapping("/mgSale")
	public @ResponseBody List<SALEDto> saleMgmgSale(@RequestParam("date1") String date1, @RequestParam("date2") String date2) {

		System.out.println("controller saleMgMgSale");
		System.out.println(date1);
		System.out.println(date2);

		List<SALEDto> list = saleMgService.mgSaleList(date1, date2);

		return list;

	}
*/
	
	@RequestMapping("/mgSale")
	public @ResponseBody List<SALEDto> saleMgmgSale(@RequestParam("year") int year, @RequestParam("month") int month, @RequestParam("day") int day) {

		System.out.println("controller saleMgMgSale");
		System.out.println(year);
		System.out.println(month);

//		List<SALEDto> list = saleMgService.mgSaleList(date1, date2);
		List<SALEDto> list = saleMgService.mgSaleList2(year, month, day);
		JSONArray json = JSONArray.fromObject(list);
		System.out.println(list);

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
	public ModelAndView saleMgltfeeInsert(@RequestParam(value="tchrId", required=true) List<String> tchrId, 
	@RequestParam(value="tchrSlr", required=true) List<String> tchrSlr, @RequestParam(value="tchrNm", required=true) List<String> tchrNm, 
	@RequestParam(value="ssnId", required=true) List<String> ssnId, @RequestParam(value="ssnSlr", required=true) List<String> ssnSlr,
	@RequestParam(value="ssnNm", required=true) List<String> ssnNm) {
		System.out.println("service saleMgltfeeInsert");
		
		ModelAndView mav = new ModelAndView();
		
		List<TCHRDto> list = saleMgService.ltfeeInsert(tchrId, tchrSlr, ssnId, ssnSlr, tchrNm, ssnNm);
		mav.addObject("list", list);
		mav.setViewName("saleMg/ltfeeConfirm");
		
		return mav;
		
		
	}
}
