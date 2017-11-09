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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.dto.STDTDto;
import com.project.dto.SmsContentDto;
import com.project.dto.SmsDto;
import com.project.service.SchLfService;

@Controller
public class SchLfController {

	@Autowired
	private SchLfService schLfService;
	
	/**
	 * @Method Name : sendMsg
	 * @작성일	    : 2017. 11. 8. 
	 * @작성자	    : 김동근
	 * @Method 설명	: 수강생 지각시 문자발송 및 전체 수강생 공지사항 문자 발송
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
			Map<String, STDTDto> map = schLfService.selectByAttnd();
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
				// 메시지 보내기 성공 및 전송결과 출력
				System.out.println("성공");
				System.out.println(result.get("group_id")); // 그룹아이디
				System.out.println(result.get("result_code")); // 결과코드
				System.out.println(result.get("result_message")); // 결과메시지
				System.out.println(result.get("success_count")); // 성공갯수
				System.out.println(result.get("error_count")); // 발송실패 메시지 수
				return "test/testS";
			} else {
				// 메시지 보내기 실패
				System.out.println("실패");
				System.out.println(result.get("code")); // REST API 에러코드
				System.out.println(result.get("message")); // 에러메시지
				return "test/testF";
			}
		} else if (command.equals("notice")) {
			List<String> phoneList = schLfService.selectBySTDT();
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
				// 메시지 보내기 성공 및 전송결과 출력
				System.out.println("성공");
				System.out.println(result.get("group_id")); // 그룹아이디
				System.out.println(result.get("result_code")); // 결과코드
				System.out.println(result.get("result_message")); // 결과메시지
				System.out.println(result.get("success_count")); // 성공갯수
				System.out.println(result.get("error_count")); // 발송실패 메시지 수
				return "test/testS";
			} else {
				// 메시지 보내기 실패
				System.out.println("실패");
				System.out.println(result.get("code")); // REST API 에러코드
				System.out.println(result.get("message")); // 에러메시지
				return "test/testF";
			}
		}
		return "test/testF";
	}
}
