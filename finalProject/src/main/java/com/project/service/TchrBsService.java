package com.project.service;

import java.util.List;
import java.util.Map;

import com.project.dto.SCRDto;
import com.project.dto.TCHRDto;
import com.project.dto.TPCDto;
import com.project.dto.TTLQZDto;

public interface TchrBsService {

	Map<List<TPCDto>, List<TCHRDto>> qzView();
	int qzInsert(TTLQZDto ttlqzDto);
	List<Map<String, String>> attnd(String string);
	List<Map<String, String>> attndClss(String clssId);
	Map<String, List<Map<String, String>>> srcIn();
	void srcInsert(SCRDto scrDto);
	List<String> stSearch(String id);
	List<Map<String, Object>> stClssSearch(String clssId);

}
