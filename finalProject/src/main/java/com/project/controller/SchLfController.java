package com.project.controller;

import java.util.HashMap;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.dto.SmsDto;
import com.project.dto.SmsTestDto;
import com.project.service.SchLfService;

@Controller
public class SchLfController {

	@Autowired
	private SchLfService schLfService;
	
	@RequestMapping("/sendSms")
	public String sendMsg(SmsTestDto msg){
		String api_key = "NCSMEHTF8CJTANRZ";
        String api_secret = "BEJXLRRUN8QFXGCRICN86VE9MQLKYJ4K";
		SmsDto sms = new SmsDto(api_key, api_secret);
		HashMap<String, String> set = new HashMap<String, String>(); 
		JSONObject obj = new JSONObject();
		JSONArray list = new JSONArray();
		String attnd = schLfService.selectByAttnd().toString();
		System.out.println(2);
		obj.put("type", "sms"); // 문자타입
		obj.put("to", ","); // 수신번호
		obj.put("text", msg.getContent()); // 문자내용
			
		list.add(obj); // 원하는 만큼 obj를 넣어주면 됩니다.		
		set.put("extension", list.toString()); // set extension

		set.put("from", "01062635093"); // 발신번호
		
		JSONObject result = sms.send(set); // 보내기&전송결과받기
		if ((Boolean) result.get("status") == true) {
			// 메시지 보내기 성공 및 전송결과 출력
			System.out.println("성공");			
			System.out.println(result.get("group_id")); // 그룹아이디
			System.out.println(result.get("result_code")); // 결과코드
			System.out.println(result.get("result_message"));  // 결과메시지
			System.out.println(result.get("success_count")); // 성공갯수
			System.out.println(result.get("error_count"));  // 발송실패 메시지 수
		} else {
			// 메시지 보내기 실패
			System.out.println("실패");
			System.out.println(result.get("code")); // REST API 에러코드
			System.out.println(result.get("message")); // 에러메시지
		}		
		return "test/testS";
	}
}
