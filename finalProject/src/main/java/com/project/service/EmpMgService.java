package com.project.service;

import java.sql.SQLException;
import java.util.List;

import com.project.dto.EMPDto;
import com.project.dto.TCHRDto;

public interface EmpMgService {

	public List empSelectAll() throws SQLException;

	public void empInsert(EMPDto emp) throws SQLException;

	public List tchrSelectAll() throws SQLException;

	public void tchrInsert(TCHRDto tchr);


}
