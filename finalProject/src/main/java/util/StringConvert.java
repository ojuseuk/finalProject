package util;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.project.dto.STDTDto;

public class StringConvert {

	public static String convertToPhone(Map<String, STDTDto> map){
		String phone = "";
		Set<String> keySet = map.keySet();
		Iterator<String> keyIterator = keySet.iterator();
		while(keyIterator.hasNext()){
			phone += keyIterator.next();
			phone += ",";
		}
		System.out.println(phone);
		return phone;
	}
	
	public static String convertToNm(Map<String, STDTDto> map){
		String nm = "";
		Set<String> keySet = map.keySet();
		Iterator<String> keyIterator = keySet.iterator();
		while(keyIterator.hasNext()){
			String phone = keyIterator.next();
			STDTDto stdt = map.get(phone);
			nm += stdt.getNm();
		}
		System.out.println(nm);
		return nm;
	}
	
	public static List<String> convertToList(Map<String, Object> map){
		List<String> list = new ArrayList<>();
		Set<String> keySet = map.keySet();
		Iterator<String> keyIterator = keySet.iterator();
		while(keyIterator.hasNext()){
			String key = keyIterator.next();
			String stdt = map.get(key).toString();
			list.add(stdt);
		}
		System.out.println(list);
		return list;
	}
}
