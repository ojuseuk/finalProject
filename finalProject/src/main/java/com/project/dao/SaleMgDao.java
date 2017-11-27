package com.project.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.project.dto.SALEDto;
import com.project.dto.TCHRASSNDto;
import com.project.dto.TCHRDto;

public interface SaleMgDao {

	void insert(SALEDto saleDto) throws SQLException;
	int saleNo(SALEDto saleDto) throws SQLException;
	List<Map<String, String>> selectTchr() throws SQLException;
	List<Map<String, String>> selectTchrassn() throws SQLException;
	List<SALEDto> mgSaleList(Map<String, String> map) throws SQLException;
	void ltfeeInsert(List<TCHRDto> list) throws SQLException;
	int ltfeeInsertTest(TCHRDto tchrDto) throws SQLException;
	List<SALEDto> mgSaleList2(SALEDto saleDto) throws SQLException;

}
