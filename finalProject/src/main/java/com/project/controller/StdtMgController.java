package com.project.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.dto.CLSSDto;
import com.project.dto.SCRDto;
import com.project.dto.STDTCLSSDto;
import com.project.dto.STDTDto;
import com.project.dto.STDTInfoDto;
import com.project.dto.SmsContentDto;
import com.project.dto.USRDto;
import com.project.service.StdtMgService;

import net.sf.json.JSONArray;
import util.SMS;

@Controller
public class StdtMgController {

	@Autowired
	private StdtMgService stdtMgService;
	
	/**
	 * @Method Name : sendMsg
	 * @작성일	    : 2017. 11. 8. 
	 * @작성자	    : 김동근
	 * @Method 설명	: 수강생 지각시 문자발송 및 전체 수강생에게 공지사항 문자 발송
	 * return type  : String
	 * @param command
	 * @param msg
	 * @return
	 */
	@RequestMapping("/testSMS")
	@PreAuthorize("hasRole('ROLE_STAFF')")
	public String testM(){
		return "stdtMg/sendSMSView";
	}
	
	@RequestMapping("/sendSms")
	@PreAuthorize("hasRole('ROLE_STAFF')")
	public String sendMsg(@RequestParam("command") String command, SmsContentDto msg) {
		String str = "";
		try {
			str = SMS.sendMsg(command, msg , stdtMgService);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return str;
	}
	
	/**
	 * @Method Name : selectByCrs
	 * @작성일	    : 2017. 11. 9. 
	 * @작성자	    : 김동근
	 * @Method 설명	: 과정 셀렉트 박스 출력, 전체 수강생 조회, 가장 마지막 학생번호 조회
	 * return type  : String
	 * @return
	 */
	@RequestMapping("stdtAllList")
	@PreAuthorize("hasRole('ROLE_STAFF')")
	public ModelAndView selectByCrs(){
		String stdtNo = "";
		ModelAndView mav = null;
		JSONArray json = null;
		
		try {
			stdtNo = stdtMgService.selectStdtNo();
			String no = stdtNo.substring(1);
			int num = Integer.parseInt(no);
			no = Integer.toString(++num);
			stdtNo = stdtNo.substring(0, 1) + no;
			List<STDTInfoDto> list = stdtMgService.selectAllByStdt();
			mav = new ModelAndView();
			json = JSONArray.fromObject(list);
			mav.addObject("stdtAllList", list);
			mav.addObject("crsList", stdtMgService.selectByCrs());
			mav.addObject("json", json);
			mav.addObject("stdtNo", stdtNo);
			mav.setViewName("stdtMg/stdtListView");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	/**
	 * @Method Name : selectByClss
	 * @작성일	    : 2017. 11. 10. 
	 * @작성자	    : 김동근
	 * @Method 설명	: 강좌 셀렉트 박스 출력
	 * return type  : List<CLSSDto>
	 * @param crsId
	 * @return
	 */
	@RequestMapping("clssList")
	@PreAuthorize("hasRole('ROLE_STAFF')")
	public @ResponseBody List<CLSSDto> selectByClss(@RequestParam("crsId") String crsId){
		List<CLSSDto> list = new ArrayList<>();
		try {
			list = stdtMgService.selectByClss(crsId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * @Method Name : selectStdtByCrs
	 * @작성일	    : 2017. 11. 13. 
	 * @작성자	    : 김동근
	 * @Method 설명	: 과정별 수강생 조회
	 * return type  : List<STDTInfoDto>
	 * @param crsId
	 * @return
	 */
	@RequestMapping("stdtListCrs")
	@PreAuthorize("hasRole('ROLE_STAFF')")
	public @ResponseBody List<STDTInfoDto> selectStdtByCrs(@RequestParam("crsId") String crsId){
		List<STDTInfoDto> list = new ArrayList<>();
		try {
			if(crsId.equals("default")){
				list = stdtMgService.selectAllByStdt();
			} else {
				list = stdtMgService.selectStdtByCrs(crsId);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * @Method Name : selectStdtByClss
	 * @작성일	    : 2017. 11. 11. 
	 * @작성자	    : 김동근
	 * @Method 설명	: 강좌별 수강생 조회
	 * return type  : List<STDTListDto>
	 * @param clssNm
	 * @return
	 */
	@RequestMapping("stdtList")
	@PreAuthorize("hasRole('ROLE_STAFF')")
	public @ResponseBody List<STDTInfoDto> selectStdtByClss(STDTInfoDto stdtInfo){
		System.out.println(stdtInfo);
		List<STDTInfoDto> list = new ArrayList<>();
		try {
			if(stdtInfo.getClssId().equals("default")){
				list = stdtMgService.selectStdtByCrs(stdtInfo.getCrsId());
			}
			list = stdtMgService.selectByStdtList(stdtInfo.getClssId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * @Method Name : selectStdtInfo
	 * @작성일	    : 2017. 11. 12. 
	 * @작성자	    : 김동근
	 * @Method 설명	: 수강생의 정보 조회
	 * return type  : List<STDTListDto>
	 * @param stdtNo
	 * @param model
	 * @return
	 */
	@RequestMapping("stdtInfo")
	@PreAuthorize("hasRole('ROLE_STAFF')")
	public @ResponseBody ModelAndView selectStdtInfo(@RequestParam("stdtNo") String stdtNo, Model model){
		ModelAndView mav = new ModelAndView();
		List<STDTInfoDto> list = new ArrayList<>();
		try {
			list = stdtMgService.selectStdtInfo(stdtNo);
			JSONArray json = JSONArray.fromObject(list);
			mav.addObject("json", json);
			mav.setViewName("stdtMg/updateStdtView");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	/**
	 * @Method Name : updateToStdt
	 * @작성일	    : 2017. 11. 13. 
	 * @작성자	    : 김동근
	 * @Method 설명	: 수강생의 반 정보 변경, 부모님 연락처 변경?
	 * return type  : String
	 * @param stdtInfo
	 * @param model
	 * @return
	 */
	@RequestMapping("updateStdt")
	@PreAuthorize("hasRole('ROLE_STAFF')")
	public ModelAndView updateToStdt(STDTCLSSDto stdtClss, STDTDto stdt, Model model){
		ModelAndView mav = new ModelAndView();
		try {
			stdtMgService.updateStdtClss(stdtClss);
			stdtMgService.updateStdtPrnt(stdt);
			String stdtNo = stdtMgService.selectStdtNo();
			if(!stdtNo.equals("")){
				String no = stdtNo.substring(1);
				int num = Integer.parseInt(no);
				no = Integer.toString(++num);
				stdtNo = stdtNo.substring(0, 1) + no;
			}
			List<STDTInfoDto> list = stdtMgService.selectAllByStdt();
			JSONArray json = JSONArray.fromObject(list);
			mav.addObject("stdtAllList", list);
			mav.addObject("crsList", stdtMgService.selectByCrs());
			mav.addObject("json", json);
			mav.addObject("stdtNo", stdtNo);
			mav.setViewName("stdtMg/stdtListView");
		} catch (Exception e) {
			// TODO: handle exception
		}
		return mav;
	}
	
	/**
	 * @Method Name : selectStdtId
	 * @작성일	    : 2017. 11. 19. 
	 * @작성자	    : 김동근
	 * @Method 설명	: 수강생 등록시 ID 조회
	 * return type  : String
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/selectStdtId")
	@PreAuthorize("hasRole('ROLE_STAFF')")
	public @ResponseBody String selectStdtId(@RequestParam("id") String id){
		String usrId = "";
		try {
			usrId = stdtMgService.selectStdtId(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return usrId;
	}
	
	/**
	 * @Method Name : insertStdt
	 * @작성일	    : 2017. 11. 20. 
	 * @작성자	    : 김동근
	 * @Method 설명	: 종합반 수강생 등록
	 * return type  : String
	 * @param stdtDto
	 * @param stdtClssDto
	 * @param model
	 * @return
	 */
	@RequestMapping("/insertStdt")
	@Transactional
	@PreAuthorize("hasRole('ROLE_STAFF')")
	public String insertStdt(STDTDto stdtDto, STDTCLSSDto stdtClssDto, Model model){
		String date = stdtClssDto.getPaidDt().replace("-", "");
		try {
			stdtClssDto.setPaidDt(date);
			stdtMgService.insertStdt(stdtDto);
			stdtMgService.insertStdtClss(stdtClssDto);
			stdtMgService.updateUsrTp(stdtDto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/stdtAllList";
	}
}
