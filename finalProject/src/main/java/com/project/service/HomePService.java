package com.project.service;

import java.sql.SQLException;
import java.util.List;

import com.project.dto.NTCDto;
import com.project.dto.QNADto;
import com.project.dto.USRDto;

public interface HomePService {

	void qnaInsert(QNADto qnaDto) throws SQLException;
	List<QNADto> qnaSelectView() throws SQLException;
	QNADto qnaUpdateView(int no) throws SQLException;
	int qnaUpdate(QNADto qnaDto) throws SQLException;
	String ntcTchr(String id) throws SQLException;
	int ntcInsert(String id, NTCDto ntcDto) throws SQLException;
	List<NTCDto> ntcList() throws SQLException;
	NTCDto ntcUpdatePage(int no) throws SQLException;
	int ntcUpdate(NTCDto ntcDto) throws SQLException;
}
