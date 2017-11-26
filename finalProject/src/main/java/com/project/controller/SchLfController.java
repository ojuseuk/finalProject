package com.project.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.dto.ClssInfoDto;
import com.project.dto.DateDto;
import com.project.dto.SCRDto;
import com.project.dto.STDTCLSSDto;
import com.project.dto.STDTDto;
import com.project.dto.USRDto;
import com.project.service.SchLfService;

import net.sf.json.JSONArray;

@Controller
public class SchLfController {

	@Autowired
	private SchLfService schLfService;
	
	/**
	 * @Method Name : selectByCrs
	 * @작성일	    : 2017. 11. 14. 
	 * @작성자	    : 김동근
	 * @Method 설명	: 수강신청 페이지 과목명 셀렉트박스 출력, 전체과정 출력
	 * return type  : String
	 * @param model
	 * @return
	 */
	@RequestMapping("viewRegist")
	@PreAuthorize("hasAnyRole('ROLE_ST', 'ROLE_USR')")
	public ModelAndView selectByCrs(Authentication auth){
		USRDto usr = (USRDto) auth.getPrincipal();
		ModelAndView mav = new ModelAndView();
		List<ClssInfoDto> list = schLfService.selectByCrs();
		JSONArray json = JSONArray.fromObject(list);
		mav.addObject("jsonCrs", json);
		mav.addObject("sbjt", schLfService.selectBySbjt());
		mav.addObject("usrId", usr.getId());
		mav.addObject("usrNm", usr.getNm());
		mav.addObject("usrPhone", usr.getPhone());
		mav.addObject("usrEmail", usr.getEmail());
		mav.setViewName("schLf/registClssView");
		return mav;
	}
	
	/**
	 * @Method Name : selectCrsPerSbjt
	 * @작성일	    : 2017. 11. 14. 
	 * @작성자	    : 김동근
	 * @Method 설명	: 과목에 해당하는 과정 출력
	 * return type  : List<CRSDto>
	 * @param sbjtNm
	 * @return
	 */
	@RequestMapping("selectCrsPerSbjt")
	@PreAuthorize("hasAnyRole('ROLE_ST', 'ROLE_USR')")
	public @ResponseBody List<ClssInfoDto> selectCrsPerSbjt(@RequestParam("sbjtNm") String sbjtNm){
		if(sbjtNm.equals("선 택")){
			return schLfService.selectByCrs();
		}
		return schLfService.selectCrsPerSbjt(sbjtNm);
	}
	
	/**
	 * @Method Name : selectClssPerCrs
	 * @작성일	    : 2017. 11. 15. 
	 * @작성자	    : 김동근
	 * @Method 설명	: 과정에 해당하는 강좌 출력
	 * return type  : List<ClssInfoDto>
	 * @param crsId
	 * @return
	 */
/*	@RequestMapping("selectClssPerCrs")
	public @ResponseBody List<ClssInfoDto> selectClssPerCrs(@RequestParam("crsId") String crsId){
		return schLfService.selectClssPerCrs(crsId);
	}*/
	
	/**
	 * @Method Name : applyClss
	 * @작성일	    : 2017. 11. 16. 
	 * @작성자	    : 김동근
	 * @Method 설명	: 수강신청
	 * return type  : String
	 * @param clssList
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("applyClss")
	@PreAuthorize("hasAnyRole('ROLE_ST', 'ROLE_USR')")
	public ModelAndView applyClss(@RequestBody List<String> clssList) throws Exception{
		int fee = 0;
		ModelAndView mav = new ModelAndView();
		List<ClssInfoDto> list = new ArrayList<>();
		JSONParser parser = new JSONParser();
		JSONObject jo = null;
			if(!clssList.equals(null)){
				for (int i = 0; i < clssList.size(); i++) {
					jo = (JSONObject) parser.parse(clssList.get(i));
					list.add(new ClssInfoDto(jo.get("id").toString()
							, jo.get("nm").toString()
							, jo.get("clssNm").toString()
							, jo.get("strtDt").toString()
							, jo.get("endDt").toString()
							, jo.get("stdtclssttn").toString()));
					fee += Integer.parseInt(jo.get("stdtclssttn").toString());
					JSONArray json = JSONArray.fromObject(list);
					mav.addObject("json", json);
				}
			} else {
				mav.addObject("json", "강좌를 선택하세요");
			}
		mav.addObject("fee", fee);
		mav.setViewName("schLf/registListView");
		return mav;
	}
	
	/**
	 * @Method Name : selectMyClss
	 * @작성일	    : 2017. 11. 19. 
	 * @작성자	    : 김동근
	 * @Method 설명	: 나의 수강과정 목록 조회
	 * return type  : List<ClssInfoDto>
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("myClssList")
	@PreAuthorize("hasAnyRole('ROLE_ST', 'ROLE_USR')")
	public ModelAndView selectMyClss(Authentication auth){
		USRDto usr = (USRDto) auth.getPrincipal();
		ModelAndView mav = new ModelAndView();
		List<ClssInfoDto> list = schLfService.selectMyClss(usr.getId());
		JSONArray json = JSONArray.fromObject(list);
		System.out.println(json);
		mav.addObject("json", json);
		mav.setViewName("schLf/myClssView");
		return mav;
	}
	
	/**
	 * @Method Name : selectMyAttnd
	 * @작성일	    : 2017. 11. 21. 
	 * @작성자	    : 김동근
	 * @Method 설명	: 나의 출결현황 조회
	 * return type  : ModelAndView
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("myAttnd")
	@PreAuthorize("hasAnyRole('ROLE_ST', 'ROLE_USR')")
	public ModelAndView selectMyAttnd(Authentication auth){
		USRDto usr = (USRDto) auth.getPrincipal();
	
		SimpleDateFormat formatter1 = new SimpleDateFormat ("yyyyMM");
		SimpleDateFormat formatter2 = new SimpleDateFormat ("MM");
		Date currentTime = new Date ();
		String date = formatter1.format(currentTime);
		String month = formatter2.format(currentTime);
		String statDt = date + "01";
		String endDt = "";
		
		if(month.equals("1")){
			endDt = date + "31";
		} else if(month.equals("2")){
			endDt = date + "29";
		} else if(month.equals("3")){
			endDt = date + "31";
		} else if(month.equals("4")){
			endDt = date + "30";
		} else if(month.equals("5")){
			endDt = date + "31";
		} else if(month.equals("6")){
			endDt = date + "30";
		} else if(month.equals("7")){
			endDt = date + "31";
		} else if(month.equals("8")){
			endDt = date + "31";
		} else if(month.equals("9")){
			endDt = date + "30";
		} else if(month.equals("10")){
			endDt = date + "31";
		} else if(month.equals("11")){
			endDt = date + "30";
		} else if(month.equals("12")){
			endDt = date + "31";
		} else {
			System.out.println("Error");
		}
		
		DateDto dto = new DateDto(usr.getId(), statDt, endDt);
		ModelAndView mav = new ModelAndView();
		List<Map<String, String>> list = schLfService.selectMyAttnd(dto);
		JSONArray json = JSONArray.fromObject(list);
		mav.addObject("list", list);
		mav.addObject("json", json);
		mav.setViewName("schLf/myAttndView");
		return mav;
	}
	
	/**
	 * @Method Name : selectMyScr
	 * @작성일	    : 2017. 11. 21. 
	 * @작성자	    : 김동근
	 * @Method 설명	: 나의 성적 조회
	 * return type  : String
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("/myScr")
	@PreAuthorize("hasAnyRole('ROLE_ST', 'ROLE_USR')")
	public ModelAndView selectMyScr(Authentication auth){
		USRDto usr = (USRDto) auth.getPrincipal();
		ModelAndView mav = new ModelAndView();
		List<SCRDto> list = schLfService.selectMyScr(usr.getId());
		JSONArray json = JSONArray.fromObject(list);
		mav.addObject("scrList", list);
		mav.addObject("json", json);
		mav.setViewName("schLf/myScrView");
		return mav;
	}
	
	@RequestMapping("/payments/complete")
	@PreAuthorize("hasAnyRole('ROLE_ST', 'ROLE_USR')")
	@Transactional
	public String registClss(@RequestBody List<String> clssList) throws Exception{
		System.out.println("registClss");
		JSONParser parser = new JSONParser();
		JSONObject jo = null;
		String id = "";
		ArrayList<String> list = new ArrayList<>();
		// clssList json으로 변환
		if(!clssList.equals(null)){
			for (int i = 0; i < clssList.size(); i++) {
				jo = (JSONObject) parser.parse(clssList.get(i));
				list.add(jo.get("clssId").toString());
			}
			id = jo.get("id").toString();
		}
		// 나의 수강생 번호 조회
		String stdtNo = schLfService.selectMyStdtNo(id);
		System.out.println("나의 수강생 번호 : " + stdtNo);
		// 수강생 번호 없을 시 번호 생성
		if(stdtNo.equals("")){
			stdtNo = schLfService.selectStdtNo();
			String no = stdtNo.substring(1);
			int num = Integer.parseInt(no);
			no = Integer.toString(++num);
			stdtNo = stdtNo.substring(0, 1) + no;
			STDTDto stdt = new STDTDto(stdtNo, id);
			System.out.println("새로운 수강생 : " + stdt);
			// 새로운 수강생 Insert
			schLfService.insertNewStdt(stdt);
		} 
		
		// 오늘 날짜 구하기
		SimpleDateFormat formatter = new SimpleDateFormat ("yyyyMMdd");
		Date currentTime = new Date ();
		String date = formatter.format(currentTime);
		
		STDTCLSSDto stdtClss;
		for (int i = 0; i < list.size(); i++) {
			stdtClss = new STDTCLSSDto(list.get(i), stdtNo, date);
			// 새로운 수강생 수강테이블에 Insert
			System.out.println("수강 : " + stdtClss);
			schLfService.insertStdtToStdtClss(stdtClss);
		}
		
		System.out.println(list);
		System.out.println(id);
		return "schLf/paymentSucView";
	}
	
	
}
