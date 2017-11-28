package util;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.project.dto.STDTDto;
import com.project.dto.SmsContentDto;
import com.project.dto.SmsDto;
import com.project.service.StdtMgService;

public class SMS {
	public static String sendMsg(String command, SmsContentDto msg, StdtMgService stdtMgService) throws Exception {
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
				obj.put("to", "01062635093"); // 수신번호 prntPhone
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
}
