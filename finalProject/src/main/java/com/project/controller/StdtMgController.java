package com.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.dto.CLSSDto;
import com.project.dto.STDTCLSSDto;
import com.project.dto.STDTInfoDto;
import com.project.dto.SmsContentDto;
import com.project.service.StdtMgService;

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
	public String testM(){
		return "stdtMg/sendSMSView";
	}
	
	@RequestMapping("/sendSms")
	public String sendMsg(@RequestParam("command") String command, SmsContentDto msg) {
		return SMS.sendMsg(command, msg , stdtMgService);
	}
	
	/**
	 * @Method Name : selectByCrs
	 * @작성일	    : 2017. 11. 9. 
	 * @작성자	    : 김동근
	 * @Method 설명	: 과정 셀렉트 박스 출력, 전체 수강생 조회
	 * return type  : String
	 * @return
	 */
	@RequestMapping("/stdtAllList")
	public String selectByCrs(Model model){
		model.addAttribute("crsList", stdtMgService.selectByCrs());
		model.addAttribute("stdtAllList", stdtMgService.selectAllByStdt());
		return "stdtMg/StdtListView";
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
	@RequestMapping("/clssList")
	public @ResponseBody List<CLSSDto> selectByClss(@RequestParam("crsId") String crsId){
		return stdtMgService.selectByClss(crsId);
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
	@RequestMapping("/stdtListCrs")
	public @ResponseBody List<STDTInfoDto> selectStdtByCrs(@RequestParam("crsId") String crsId){
		if(crsId.equals("선 택")){
			return stdtMgService.selectAllByStdt();
		}
		return stdtMgService.selectStdtByCrs(crsId);
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
	@RequestMapping("/stdtList")
	public @ResponseBody List<STDTInfoDto> selectStdtByClss(STDTInfoDto stdtInfo){
		if(stdtInfo.getClssNm().equals("선 택")){
			return stdtMgService.selectStdtByCrs(stdtInfo.getCrsId());
		}
		return stdtMgService.selectByStdtList(stdtInfo.getClssNm());
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
	@RequestMapping("/stdtInfo")
	public @ResponseBody List<STDTInfoDto> selectStdtInfo(@RequestParam("stdtNo") String stdtNo, Model model){
		model.addAttribute("info", stdtMgService.selectStdtInfo(stdtNo));
		return stdtMgService.selectStdtInfo(stdtNo);
	}
	
	/**
	 * @Method Name : selectStdtNo
	 * @작성일	    : 2017. 11. 12. 
	 * @작성자	    : 김동근
	 * @Method 설명	: 수강생 등록 시 가장 마지막 수강생 번호 출력
	 * return type  : String
	 * @param model
	 * @return
	 */
	@RequestMapping("/selectStdtNo")
	public String selectStdtNo(Model model){
		model.addAttribute("stdtNo", stdtMgService.selectStdtNo());
		return "stdtMg/writeStdt";
	}
	
	/**
	 * @Method Name : updateToStdt
	 * @작성일	    : 2017. 11. 13. 
	 * @작성자	    : 김동근
	 * @Method 설명	: 수강생의 반 정보 변경
	 * return type  : String
	 * @param stdtInfo
	 * @param model
	 * @return
	 */
	@RequestMapping("/updateStdt")
	public String updateToStdt(STDTCLSSDto stdtInfo, Model model){
		stdtMgService.updateStdtClss(stdtInfo);
		model.addAttribute("crsList", stdtMgService.selectByCrs());
		model.addAttribute("stdtAllList", stdtMgService.selectAllByStdt());
		return "stdtMg/StdtView";
	}
	
	
	/**
	 * @Method Name : selectByStdtNm
	 * @작성일	    : 2017. 11. 13. 
	 * @작성자	    : 김동근
	 * @Method 설명	: 이름으로 수강생 검색(clssNm"선택"을 clssId 변경 고민중)
	 * return type  : List<STDTInfoDto>
	 * @param stdtInfo
	 * @param model
	 * @return
	 */
	@RequestMapping("/selectStdtNm")
	public @ResponseBody List<STDTInfoDto> selectByStdtNm(STDTInfoDto stdtInfo, Model model){
		if(stdtInfo.getClssNm().equals("선 택") && stdtInfo.getNm().equals("")){
			model.addAttribute("info", stdtMgService.selectAllByStdt());
			return stdtMgService.selectAllByStdt();
		} else if(stdtInfo.getNm().equals("")){
			model.addAttribute("info", stdtMgService.selectByStdtList(stdtInfo.getClssNm()));
			return stdtMgService.selectByStdtList(stdtInfo.getClssNm());
		} else if(stdtInfo.getClssNm().equals("선 택") && !stdtInfo.getNm().equals("")){
			model.addAttribute("info", stdtMgService.selectByStdtNm(stdtInfo));
			return stdtMgService.selectByStdtNm(stdtInfo);
		} else {
			model.addAttribute("info", stdtMgService.selectByClssStdtNm(stdtInfo));
			return stdtMgService.selectByClssStdtNm(stdtInfo);
		}
	}
}
