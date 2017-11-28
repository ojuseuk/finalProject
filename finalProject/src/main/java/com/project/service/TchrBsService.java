package com.project.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.project.dto.EXAMTPDto;
import com.project.dto.SBJTDto;
import com.project.dto.SCRDto;
import com.project.dto.TCHRDto;
import com.project.dto.TPCDto;
import com.project.dto.TTLQZDto;

public interface TchrBsService {

	Map<List<TPCDto>, List<TCHRDto>> qzView() throws SQLException;
	int ttlqzInsert(TTLQZDto ttlqzDto) throws SQLException;
	List<Map<String, String>> attnd(String string) throws SQLException;
	List<Map<String, String>> attndClss(String clssId) throws SQLException;
	Map<String, List<Map<String, String>>> srcIn() throws SQLException;
	void srcInsert(SCRDto scrDto) throws SQLException;
	List<String> stSearch(String id) throws SQLException;
	List<Map<String, Object>> stClssSearch(String clssId) throws SQLException;
	Map<List<SBJTDto>, List<Map<String, String>>> qzSelectView() throws SQLException;
	List<Map<String, Object>> qzSelect(String sbjtNm) throws SQLException;
	List<TTLQZDto> qzUpdateView() throws SQLException;
	TTLQZDto qzUpdateSearch(int id) throws SQLException;
	void qzInsert(EXAMTPDto examtpDto, List<Integer> id) throws SQLException;

}
