package com.project.service;

import java.util.List;
import java.util.Map;

import com.project.dto.EXAMTPDto;
import com.project.dto.SBJTDto;
import com.project.dto.SCRDto;
import com.project.dto.TCHRDto;
import com.project.dto.TPCDto;
import com.project.dto.TTLQZDto;

public interface TchrBsService {

	Map<List<TPCDto>, List<TCHRDto>> qzView() throws Exception;
	int ttlqzInsert(TTLQZDto ttlqzDto) throws Exception;
	List<Map<String, String>> attnd(String string) throws Exception;
	List<Map<String, String>> attndClss(String clssId) throws Exception;
	Map<String, List<Map<String, String>>> srcIn() throws Exception;
	void srcInsert(SCRDto scrDto) throws Exception;
	List<String> stSearch(String id) throws Exception;
	List<Map<String, Object>> stClssSearch(String clssId) throws Exception;
	Map<List<SBJTDto>, List<Map<String, String>>> qzSelectView() throws Exception;
	List<Map<String, Object>> qzSelect(String sbjtNm) throws Exception;
	List<TTLQZDto> qzUpdateView() throws Exception;
	TTLQZDto qzUpdateSearch(int id) throws Exception;
	void qzInsert(EXAMTPDto examtpDto, List<Integer> id) throws Exception;

}
