package com.project.dao;

import java.util.List;

import com.project.dto.EMPDto;
import com.project.dto.TCHRASSNDto;
import com.project.dto.TCHRDto;
import com.project.dto.USRDto;

public interface EmpMgDao {

	List empSelectAll();

	String empInsert(EMPDto emp);

	EMPDto empSelect(String id);

	USRDto usrSelect(String id);

	List tchrSelectAll();

	String tchrInsert(TCHRDto tchr);

	String usrUpdateToTchr(String id);

	String usrUpdateToStaff(String id);

	String empUpdate(EMPDto emp);

	String empRetire(EMPDto emp);

	EMPDto empSelectById(String id);

	TCHRDto tchrSelectById(String id);

	TCHRDto tchrSelect(String tchrNo);

	String tchrUpdate(TCHRDto tchr);

	List tchrSelectBySbjtNm(String sbjtNm);

	String assnTchr(TCHRASSNDto tchrAssn);

	List tchrAssnSelect(String clssId);

}
