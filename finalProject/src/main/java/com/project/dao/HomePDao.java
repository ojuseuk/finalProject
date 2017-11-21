package com.project.dao;

import java.util.List;

import com.project.dto.QNADto;

public interface HomePDao {

	void qnaInsert(QNADto qnaDto);
	int qnaCnt();
	int qnaSeqNum(QNADto qnaDto);
	List<QNADto> qnaSelectView();


}
