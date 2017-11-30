package com.project.dao;

import java.util.List;
import java.util.Map;

import com.project.dto.EXAMTPDto;
import com.project.dto.QZDto;
import com.project.dto.SBJTDto;
import com.project.dto.SCRDto;
import com.project.dto.TCHRDto;
import com.project.dto.TPCDto;
import com.project.dto.TTLQZDto;

public interface TchrBsDao {

	List<TPCDto> tchrBsTcp() throws Exception;
	List<TCHRDto> tchrBsTchr() throws Exception;
	int ttlqzInsert(TTLQZDto ttlqzDto) throws Exception;
	String attndTchrNo(String id) throws Exception;
	List<Map<String, String>> attnd(Map<String, String>map) throws Exception;
	List<Map<String, String>> attndClss(String clssId) throws Exception;
	List<Map<String, String>> srcExamTp() throws Exception;
	List<Map<String, String>> srcSbjt() throws Exception;
	List<Map<String, String>> srcStdt() throws Exception;
	void srcInsert(SCRDto scrDto) throws Exception;
	List<String> stSearch(String tchrNo) throws Exception;
	List<Map<String, Object>> stClssSearch(String clssId) throws Exception;
	List<SBJTDto> qzSelectView() throws Exception;
	List<Map<String, Object>> qzSelect(String sbjtNm) throws Exception;
	List<TTLQZDto> qzUpdateView() throws Exception;
	TTLQZDto qzUpdateSearch(int id) throws Exception;
	List<Map<String, String>> qzExamSelect() throws Exception;
	void qzInsert(List<QZDto> list) throws Exception;
	int examTpInsert(EXAMTPDto examtpDto) throws Exception;
	String examTpSelect() throws Exception;

}
