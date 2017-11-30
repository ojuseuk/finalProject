package com.project.dao;

import java.util.List;
import java.util.Map;

import com.project.dto.SALEDto;
import com.project.dto.TCHRASSNDto;
import com.project.dto.TCHRDto;

public interface SaleMgDao {

	void insert(SALEDto saleDto) throws Exception;
	int saleNo(SALEDto saleDto) throws Exception;
	List<Map<String, String>> selectTchr() throws Exception;
	List<Map<String, String>> selectTchrassn() throws Exception;
	List<SALEDto> mgSaleList(Map<String, String> map) throws Exception;
	void ltfeeInsert(List<TCHRDto> list) throws Exception;
	int ltfeeInsertTest(TCHRDto tchrDto) throws Exception;
	List<SALEDto> mgSaleList2(SALEDto saleDto) throws Exception;

}
