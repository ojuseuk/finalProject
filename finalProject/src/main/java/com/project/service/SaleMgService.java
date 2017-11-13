package com.project.service;

import java.util.List;
import java.util.Map;

import com.project.dto.SALEDto;
import com.project.dto.TCHRASSNDto;
import com.project.dto.TCHRDto;

public interface SaleMgService {

	void insert(String date, int amount, String costItem);
	Map<List<Map<String, String>>, List<Map<String, String>>> selectLtfee();
	List<SALEDto> mgSaleList(String date1, String date2);
	List<TCHRDto> ltfeeInsert(List<String> tchrId, List<String> tchrSlr, List<String> ssnId, List<String> ssnSlr, List<String> tchrNm, List<String> ssnNm);

}
