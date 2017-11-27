package com.project.dao;

import java.util.List;

import com.project.dto.NTCDto;
import com.project.dto.QNADto;

public interface HomePDao {

	void qnaInsert(QNADto qnaDto);
	int qnaCnt();
	int qnaSeqNum(QNADto qnaDto);
	List<QNADto> qnaSelectView();
	QNADto qnaUpdateView(int no);
	int qnaUpdate(QNADto qnaDto);
	String ntcTchr(String id);
	int ntcInsert(NTCDto ntcDto);
	List<NTCDto> ntcList();
	NTCDto ntcUpdatePage(int no);
	int ntcUpdate(NTCDto ntcDto);


}
