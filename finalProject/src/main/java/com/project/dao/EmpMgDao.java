package com.project.dao;

import java.util.List;

import com.project.dto.EMPDto;
import com.project.dto.TCHRASSNDto;
import com.project.dto.TCHRDto;
import com.project.dto.USRDto;

public interface EmpMgDao {

	List empSelectAll() throws Exception;

	String empInsert(EMPDto emp) throws Exception;

	EMPDto empSelect(String id) throws Exception;

	USRDto usrSelect(String id) throws Exception;

	List tchrSelectAll() throws Exception;

	String tchrInsert(TCHRDto tchr) throws Exception;

	String usrUpdateToTchr(String id) throws Exception;

	String usrUpdateToStaff(String id) throws Exception;

	String empUpdate(EMPDto emp) throws Exception;

	String empRetire(EMPDto emp) throws Exception;

	EMPDto empSelectById(String id) throws Exception;

	TCHRDto tchrSelectById(String id) throws Exception;

	TCHRDto tchrSelect(String tchrNo) throws Exception;

	String tchrUpdate(TCHRDto tchr) throws Exception;

	List tchrSelectBySbjtNm(String sbjtNm) throws Exception;

	String assnTchr(TCHRASSNDto tchrAssn) throws Exception;

	List tchrAssnSelect(String clssId) throws Exception;

}
