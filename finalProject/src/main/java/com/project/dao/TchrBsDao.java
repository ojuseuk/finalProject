package com.project.dao;

import java.sql.SQLException;
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

	List<TPCDto> tchrBsTcp() throws SQLException;
	List<TCHRDto> tchrBsTchr() throws SQLException;
	int ttlqzInsert(TTLQZDto ttlqzDto) throws SQLException;
	String attndTchrNo(String id) throws SQLException;
	List<Map<String, String>> attnd(Map<String, String>map) throws SQLException;
	List<Map<String, String>> attndClss(String clssId) throws SQLException;
	List<Map<String, String>> srcExamTp() throws SQLException;
	List<Map<String, String>> srcSbjt() throws SQLException;
	List<Map<String, String>> srcStdt() throws SQLException;
	void srcInsert(SCRDto scrDto) throws SQLException;
	List<String> stSearch(String tchrNo) throws SQLException;
	List<Map<String, Object>> stClssSearch(String clssId) throws SQLException;
	List<SBJTDto> qzSelectView() throws SQLException;
	List<Map<String, Object>> qzSelect(String sbjtNm) throws SQLException;
	List<TTLQZDto> qzUpdateView() throws SQLException;
	TTLQZDto qzUpdateSearch(int id) throws SQLException;
	List<Map<String, String>> qzExamSelect() throws SQLException;
	void qzInsert(List<QZDto> list) throws SQLException;
	int examTpInsert(EXAMTPDto examtpDto) throws SQLException;
	String examTpSelect() throws SQLException;

}
