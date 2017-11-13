package com.project.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.dto.CLSSDto;
import com.project.dto.STDTCLSSDto;
import com.project.dto.STDTDto;
import com.project.dto.STDTInfoDto;
import com.project.dto.SmsContentDto;
import com.project.dto.SmsDto;
import com.project.service.StdtMgService;

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
	@RequestMapping("/sendSms")
	public String sendMsg(@RequestParam("command") String command, SmsContentDto msg) {

		String api_key = "NCSMEHTF8CJTANRZ";
		String api_secret = "BEJXLRRUN8QFXGCRICN86VE9MQLKYJ4K";
		SmsDto sms = new SmsDto(api_key, api_secret);
		HashMap<String, String> set = new HashMap<String, String>();
		JSONObject obj = new JSONObject();
		JSONArray list = new JSONArray();
		JSONObject result = null;

		if (command.equals("late")) {
			Map<String, STDTDto> map = stdtMgService.selectByAttnd();
			Set<String> keySet = map.keySet();
			Iterator<String> keyIterator = keySet.iterator();

			for (int i = 0; i < map.size(); i++) {
				String prntPhone = keyIterator.next();
				obj.put("type", "sms"); // 문자타입
				obj.put("to", prntPhone); // 수신번호
				obj.put("text", map.get(prntPhone).getNm() + "학생이 아직 학원에 도착하지 않았습니다."); // 문자내용
				list.add(obj); // 원하는 만큼 obj를 넣어주면 됩니다.
				set.put("extension", list.toString()); // set extension
				set.put("from", "01062635093"); // 발신번호
				result = sms.send(set); // 보내기&전송결과받기
			}
			if ((Boolean) result.get("status") == true) {
				return "test/testS";
			}
		} else if (command.equals("notice")) {
			List<String> phoneList = stdtMgService.selectBySTDT();
			for (int i = 0; i < phoneList.size(); i++) {
				obj.put("type", "sms"); // 문자타입
				obj.put("to", phoneList.get(i)); // 수신번호
				obj.put("text", msg.getContent()); // 문자내용

				list.add(obj); // 원하는 만큼 obj를 넣어주면 됩니다.
				set.put("extension", list.toString()); // set extension
				set.put("from", "01062635093"); // 발신번호
				result = sms.send(set); // 보내기&전송결과받기
			}
			if ((Boolean) result.get("status") == true) {
				return "test/testS";
			}
		}
		return "test/testF";
	}
	
	/**
	 * @Method Name : selectByCrs
	 * @작성일	    : 2017. 11. 9. 
	 * @작성자	    : 김동근
	 * @Method 설명	: 과정 셀렉트 박스 출력, 전체 수강생 조회
	 * return type  : String
	 * @return
	 */
	@RequestMapping("/stdt")
	public String selectByCrs(Model model){
		model.addAttribute("crsList", stdtMgService.selectByCrs());
		model.addAttribute("stdtAllList", stdtMgService.selectAllByStdt());
		return "stdtMg/StdtView";
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
	@RequestMapping("/clss")
	public @ResponseBody List<CLSSDto> selectByClss(@RequestParam("crsId") String crsId){
		return stdtMgService.selectByClss(crsId);
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
	public @ResponseBody List<STDTInfoDto> selectStdtByClss(@RequestParam("crsId") String crsId, @RequestParam("clssNm") String clssNm){
		System.out.println(crsId);
		System.out.println(clssNm);
//		if(clssNm.equals("선 택")){
//			return stdtMgService.selectStdtByCrs(crsId);
//		}
		return stdtMgService.selectByStdtList(clssNm);
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
	
	@RequestMapping("/selectStdtNm")
	public @ResponseBody List<STDTInfoDto> selectByStdtNm(STDTInfoDto stdtInfo, Model model){
		if(stdtInfo.getClssNm().equals("선 택") && stdtInfo.getNm().equals("")){
			model.addAttribute("info", stdtMgService.selectAllByStdt());
			return stdtMgService.selectAllByStdt();
		} else if(stdtInfo.getNm().equals("")){
			model.addAttribute("info", stdtMgService.selectByStdtList(stdtInfo.getClssNm()));
			return stdtMgService.selectByStdtList(stdtInfo.getClssNm());
		}
		model.addAttribute("info", stdtMgService.selectByNm(stdtInfo));
		return stdtMgService.selectByNm(stdtInfo);
	}
}
