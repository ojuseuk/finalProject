package com.project.dao;

import java.util.List;
import java.util.Map;

import com.project.dto.SCRDto;
import com.project.dto.TCHRDto;
import com.project.dto.TPCDto;
import com.project.dto.TTLQZDto;

public interface TchrBsDao {

	List<TPCDto> tchrBsTcp();
	List<TCHRDto> tchrBsTchr();
	int qzInsert(TTLQZDto ttlqzDto);
	List<Map<String, String>> attnd(String id);
	List<Map<String, String>> attndClss(String clssId);
	List<Map<String, String>> srcExamTp();
	List<Map<String, String>> srcSbjt();
	List<Map<String, String>> srcStdt();
	void srcInsert(SCRDto scrDto);
	List<String> stSearch(String id);
	List<Map<String, Object>> stClssSearch(String clssId);

}
