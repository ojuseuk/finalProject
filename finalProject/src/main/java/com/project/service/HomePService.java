package com.project.service;

import java.util.List;

import com.project.dto.NTCDto;
import com.project.dto.QNADto;
import com.project.dto.USRDto;

public interface HomePService {

	void qnaInsert(QNADto qnaDto) throws Exception;
	List<QNADto> qnaSelectView() throws Exception;
	QNADto qnaUpdateView(int no) throws Exception;
	int qnaUpdate(QNADto qnaDto) throws Exception;
	String ntcTchr(String id) throws Exception;
	int ntcInsert(String id, NTCDto ntcDto) throws Exception;
	List<NTCDto> ntcList() throws Exception;
	NTCDto ntcUpdatePage(int no) throws Exception;
	int ntcUpdate(NTCDto ntcDto) throws Exception;
}
