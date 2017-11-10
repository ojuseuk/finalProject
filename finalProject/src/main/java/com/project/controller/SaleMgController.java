package com.project.controller;

import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	 * @Method 설명 : return type : String
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
	 * @Method 설명 : return type : void
	 * @param session
	 * @param date
	 * @param amount
	 * @param costItem
	 */
	@RequestMapping("/saleMgInsert")
	public void saleMgInsert(HttpSession session, @RequestParam("date") String date, @RequestParam("amount") int amount,
			@RequestParam("costItem") String costItem) {

		System.out.println("controller saleMgInsert");
		String adminId = (String) session.getAttribute("adminId");

		saleMgService.insert(date, amount, costItem);

	}

	/**
	 * @Method Name : saleMgLtfee
	 * @작성일 : 2017. 11. 9.
	 * @작성자 : 오주석
	 * @Method 설명 : return type : void
	 */
	@RequestMapping("/ltfee")
	public ModelAndView saleMgLtfee() {

		ModelAndView mav = new ModelAndView();
		System.out.println("controller saleMgLtfee");

		Map<List<TCHRDto>, List<TCHRASSNDto>> map = saleMgService.selectLtfee();
		Set<List<TCHRDto>> set = map.keySet();

		List<TCHRDto> listTchr = null;
		List<TCHRASSNDto> listSsn = null;
		System.out.println("controller 성공 이후");
		for (List<TCHRDto> list : set) {
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
	 * @Method 설명 : return type : String
	 * @return
	 */
	@RequestMapping("/manager")
	public String saleMgManager() {

		System.out.println("controller saleMgManager");

		return "/saleMg/manager";
	}

	/**
	 * @Method Name : saleMgMgSale
	 * @작성일 : 2017. 11. 9.
	 * @작성자 : 오주석
	 * @Method 설명 : 매출 리스트를 가져오기 위한 메소드 return type : void
	 */
	@RequestMapping("/mgSale")
	public ModelAndView saleMgmgSale(@RequestParam("date1") String date1, @RequestParam("date2") String date2) {

		System.out.println("controller saleMgMgSale");
		System.out.println(date1);
		System.out.println(date2);

		ModelAndView mav = new ModelAndView();
		List<SALEDto> list = saleMgService.mgSaleList(date1, date2);
		mav.addObject("list", list);
		mav.setViewName("saleMg/saleList");

		return mav;

	}

	@RequestMapping("/mgSale2")
	public ModelAndView saleMgmgSale() {

		System.out.println("controller saleMgMgSale");
		String date1 = "2017-11-10";
		String date2 = "2017-11-20";
		System.out.println(date1);
		System.out.println(date2);

		ModelAndView mav = new ModelAndView();
		List<SALEDto> list = saleMgService.mgSaleList(date1, date2);

		JSONArray jsonArray = JSONArray.fromObject(list);
		JSONObject jsonObject = new JSONObject();
		jsonObject.toJSONArray(jsonArray);
		mav.addObject("json", jsonArray);
		mav.addObject("object", jsonObject);
		mav.addObject("list", list);
		// mav.setViewName("saleMg/saleList");
		mav.setViewName("saleMg/kendoTest");

		return mav;

	}
}
