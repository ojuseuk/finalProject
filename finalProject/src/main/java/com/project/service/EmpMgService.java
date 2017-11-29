package com.project.service;

import java.sql.SQLException;
import java.util.List;

import com.project.dto.EMPDto;
import com.project.dto.TCHRASSNDto;
import com.project.dto.TCHRDto;

public interface EmpMgService {

	public List empSelectAll() throws SQLException;

	public String empInsert(EMPDto emp) throws SQLException;

	public List tchrSelectAll() throws SQLException;

	public String tchrInsert(TCHRDto tchr) throws SQLException;

	public EMPDto empSelect(String empNo);

	public String empUpdate(EMPDto emp);

	public String empRetire(EMPDto emp);

	public TCHRDto tchrSelect(String tchrNo);

	public String tchrUpdate(TCHRDto tchr);

	public List tchrSelectBySbjtNm(String sbjtNm);

	public String assnTchr(TCHRASSNDto tchrAssn);

	public List tchrAssnSelect(String clssId);


}
