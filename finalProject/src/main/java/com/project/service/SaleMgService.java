package com.project.service;

import java.util.List;
import java.util.Map;

import com.project.dto.SALEDto;
import com.project.dto.TCHRASSNDto;
import com.project.dto.TCHRDto;

public interface SaleMgService {

	void insert(String date, int amount) throws Exception;
	Map<List<Map<String, String>>, List<Map<String, String>>> selectLtfee() throws Exception;
	List<SALEDto> mgSaleList(String date1, String date2) throws Exception;
	List<TCHRDto> ltfeeInsert(List<String> tchrId, List<String> tchrSlr, List<String> ssnId, List<String> ssnSlr, List<String> tchrNm, List<String> ssnNm) throws Exception;
	List<SALEDto> mgSaleList2(int year, int month, int day) throws Exception;

}
