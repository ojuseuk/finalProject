package com.project.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.dao.HomePDao;
import com.project.dto.QNADto;

@Service
public class HomePServiceImp implements HomePService {
	
	@Autowired
	private HomePDao homePDao;

	/**
	 * @Method Name : qnaInsert
	 * @작성일	    : 2017. 11. 21. 
	 * @작성자 		 : 
	 * @Method 설명  :
	 * @param qnaDto
	 */
	@Override
	@Transactional
	public void qnaInsert(QNADto qnaDto) {
		// TODO Auto-generated method stub
		
		System.out.println("dao qnaInsert");
		System.out.println("no : " +qnaDto.getNo());
		qnaDto.setGpNum(1);
		
		System.out.println(qnaDto);
		int gpNum = 0;
		if(qnaDto.getNo() == 0) {
			
			gpNum = homePDao.qnaCnt();
			System.out.println(gpNum);
			
			qnaDto.setGpNum(gpNum);
			
		}else {
			homePDao.qnaSeqNum(qnaDto);
			
			qnaDto.setSeqNum(qnaDto.getSeqNum()+1);
			qnaDto.setSeqLv(qnaDto.getSeqLv()+1);
			
		}
		
		System.out.println(qnaDto);
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		qnaDto.setDt(dateFormat.format(date));
		System.out.println(qnaDto.getDt());
		
		homePDao.qnaInsert(qnaDto);
		
	}

	/**
	 * @Method Name : qnaSelectView
	 * @작성일	    : 2017. 11. 21. 
	 * @작성자 		 : 
	 * @Method 설명  :
	 * @return
	 */
	@Override
	public List<QNADto> qnaSelectView() {
		// TODO Auto-generated method stub
		
		System.out.println("service qnaSelectView");
		
		System.out.println(homePDao.qnaSelectView());
		
		return homePDao.qnaSelectView();
		
	}

	/**
	 * @Method Name : qnaUpdateView
	 * @작성일	    : 2017. 11. 21. 
	 * @작성자 		 : 
	 * @Method 설명  :
	 * @param no
	 */
	@Override
	public QNADto qnaUpdateView(int no) {
		// TODO Auto-generated method stub
		
		System.out.println("service qnaUpdateView");
		return homePDao.qnaUpdateView(no);
		
		
	}

	/**
	 * @Method Name : qnaUpdate
	 * @작성일	    : 2017. 11. 21. 
	 * @작성자 		 : 
	 * @Method 설명  :
	 * @param qnaDto
	 * @return
	 */
	@Override
	public int qnaUpdate(QNADto qnaDto) {
		// TODO Auto-generated method stub
		System.out.println("service qnaUpdate");
		
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		qnaDto.setDt(dateFormat.format(date));
		return homePDao.qnaUpdate(qnaDto);
	}
	
}
