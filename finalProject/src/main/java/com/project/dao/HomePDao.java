package com.project.dao;

import java.util.List;

import com.project.dto.NTCDto;
import com.project.dto.QNADto;

public interface HomePDao {

	void qnaInsert(QNADto qnaDto) throws Exception;
	int qnaCnt() throws Exception;
	int qnaSeqNum(QNADto qnaDto) throws Exception;
	List<QNADto> qnaSelectView() throws Exception;
	QNADto qnaUpdateView(int no) throws Exception;
	int qnaUpdate(QNADto qnaDto) throws Exception;
	String ntcTchr(String id) throws Exception;
	int ntcInsert(NTCDto ntcDto) throws Exception;
	List<NTCDto> ntcList() throws Exception;
	NTCDto ntcUpdatePage(int no) throws Exception;
	int ntcUpdate(NTCDto ntcDto) throws Exception;


}
