package com.project.service;

import java.util.List;
import java.util.Map;

import com.project.dto.SALEDto;
import com.project.dto.TCHRASSNDto;
import com.project.dto.TCHRDto;

public interface SaleMgService {

	void insert(String date, int amount, String costItem);
	Map<List<TCHRDto>, List<TCHRASSNDto>> selectLtfee();
	List<SALEDto> mgSaleList(String date1, String date2);

}
