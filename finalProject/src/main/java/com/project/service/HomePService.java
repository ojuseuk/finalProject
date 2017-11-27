package com.project.service;

import java.util.List;

import com.project.dto.NTCDto;
import com.project.dto.QNADto;
import com.project.dto.USRDto;

public interface HomePService {

	void qnaInsert(QNADto qnaDto);
	List<QNADto> qnaSelectView();
	QNADto qnaUpdateView(int no);
	int qnaUpdate(QNADto qnaDto);
	String ntcTchr(String id);
	int ntcInsert(String id, NTCDto ntcDto);
	List<NTCDto> ntcList();
	NTCDto ntcUpdatePage(int no);
	int ntcUpdate(NTCDto ntcDto);
}
