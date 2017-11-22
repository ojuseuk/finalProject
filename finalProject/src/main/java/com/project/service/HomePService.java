package com.project.service;

import java.util.List;

import com.project.dto.QNADto;

public interface HomePService {

	void qnaInsert(QNADto qnaDto);
	List<QNADto> qnaSelectView();
	QNADto qnaUpdateView(int no);
	int qnaUpdate(QNADto qnaDto);

}
