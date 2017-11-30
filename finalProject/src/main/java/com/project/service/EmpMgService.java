package com.project.service;

import java.sql.SQLException;
import java.util.List;

import com.project.dto.EMPDto;
import com.project.dto.TCHRASSNDto;
import com.project.dto.TCHRDto;

public interface EmpMgService {

	public List empSelectAll() throws Exception;
	public String empInsert(EMPDto emp) throws Exception;
	public List tchrSelectAll() throws Exception;
	public String tchrInsert(TCHRDto tchr) throws Exception;
	public EMPDto empSelect(String empNo) throws Exception;
	public String empUpdate(EMPDto emp) throws Exception;
	public String empRetire(EMPDto emp) throws Exception;
	public TCHRDto tchrSelect(String tchrNo) throws Exception;
	public String tchrUpdate(TCHRDto tchr) throws Exception;
	public List tchrSelectBySbjtNm(String sbjtNm) throws Exception;
	public String assnTchr(TCHRASSNDto tchrAssn) throws Exception;
	public List tchrAssnSelect(String clssId) throws Exception;

}
