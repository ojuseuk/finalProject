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

import com.project.dto.STDTDto;
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
	 * @Method 설명	: 과정 셀렉트 박스 출력
	 * return type  : String
	 * @return
	 */
	@RequestMapping("/stdt")
	public String selectByCrs(Model model){
		model.addAttribute("crsList", stdtMgService.selectByCrs());
		return "test/StdtView";
	}
	
	@RequestMapping("/clss")
	public String selectByClss(@RequestParam("crsId") String crsId, Model model){
		JSONArray jsonArr = (JSONArray) stdtMgService.selectByClss(crsId);
		model.addAttribute("clssList", jsonArr);
		return "test/StdtView";
	}
}
