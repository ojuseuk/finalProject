package com.project.dao;

import java.util.List;
import java.util.Map;

import com.project.dto.SALEDto;
import com.project.dto.TCHRASSNDto;
import com.project.dto.TCHRDto;

public interface SaleMgDao {

	void insert(SALEDto saleDto);
	int saleNo(SALEDto saleDto);
	List<Map<String, String>> selectTchr();
	List<Map<String, String>> selectTchrassn();
	List<SALEDto> mgSaleList(Map<String, String> map);
	void ltfeeInsert(List<TCHRDto> list);
	int ltfeeInsertTest(TCHRDto tchrDto);
	List<SALEDto> mgSaleList2(SALEDto saleDto);

}
