package com.project.dao;

import java.util.List;

import com.project.dto.EMPDto;
import com.project.dto.TCHRDto;
import com.project.dto.USRDto;

public interface EmpMgDao {

	List empSelectAll();

	void empInsert(EMPDto emp);

	EMPDto empSelect(String id);

	USRDto usrSelect(String id);

	List tchrSelectAll();

	void tchrInsert(TCHRDto tchr);

	void usrUpdateToTchr(String id);

	void usrUpdateToStaff(String id);

}
