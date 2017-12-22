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

	List<TPCDto> tchrBsTcp();
	List<TCHRDto> tchrBsTchr();
	int ttlqzInsert(TTLQZDto ttlqzDto);
	String attndTchrNo(String id);
	List<Map<String, String>> attnd(Map<String, String>map);
	List<Map<String, String>> attndClss(String clssId);
	List<Map<String, String>> srcExamTp();
	List<Map<String, String>> srcSbjt();
	List<Map<String, String>> srcStdt();
	void srcInsert(SCRDto scrDto);
	List<String> stSearch(String id);
	List<Map<String, Object>> stClssSearch(String clssId);
	List<SBJTDto> qzSelectView();
	List<Map<String, Object>> qzSelect(String sbjtNm);
	List<TTLQZDto> qzUpdateView();
	TTLQZDto qzUpdateSearch(int id);
	List<Map<String, String>> qzExamSelect();
	void qzInsert(List<QZDto> list);
	int examTpInsert(EXAMTPDto examtpDto);
	String examTpSelect();

}
