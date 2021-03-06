package com.project.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.dao.HomePDao;
import com.project.dto.NTCDto;
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
	public void qnaInsert(QNADto qnaDto) throws Exception {
		// TODO Auto-generated method stub
		
		qnaDto.setGpNum(1);
		
		int gpNum = 0;
		if(qnaDto.getNo() == 0) {
			
			gpNum = homePDao.qnaCnt();
			qnaDto.setGpNum(gpNum);
			
		}else {
			homePDao.qnaSeqNum(qnaDto);
			
			qnaDto.setSeqNum(qnaDto.getSeqNum()+1);
			qnaDto.setSeqLv(qnaDto.getSeqLv()+1);
			
		}
		
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		qnaDto.setDt(dateFormat.format(date));
		
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
	public List<QNADto> qnaSelectView() throws Exception {
		// TODO Auto-generated method stub
		
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
	public QNADto qnaUpdateView(int no) throws Exception {
		// TODO Auto-generated method stub
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
	public int qnaUpdate(QNADto qnaDto) throws Exception {
		// TODO Auto-generated method stub
		
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		qnaDto.setDt(dateFormat.format(date));
		return homePDao.qnaUpdate(qnaDto);
	}
	
	/**
	 * @Method Name  : ntcTchr
	 * @작성일	     : 2017. 11. 27. 
	 * @작성자 		 : 오주석
	 * @Method 설명  : 공지사항을 DB에 추가하기 위해 사용자 id를 가지고 직원 번호를 가져오기 위한 service
	 * @param id
	 * @return
	 */
	@Override
	public String ntcTchr(String id) throws Exception {
		// TODO Auto-generated method stub
		return homePDao.ntcTchr(id);
	}

	/**
	 * @Method Name : ntcInsert
	 * @작성일	    : 2017. 11. 27. 
	 * @작성자 		 : 오주석
	 * @Method 설명  : 공지사항을 DB에 추가하기 위한 service
	 * @param string
	 * @return
	 */
	@Override
	public int ntcInsert(String id, NTCDto ntcDto) throws Exception {
		// TODO Auto-generated method stub
		String empNo = homePDao.ntcTchr(id);
		ntcDto.setEmpNo(empNo);
		
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		ntcDto.setDt(dateFormat.format(date));
		return homePDao.ntcInsert(ntcDto);
	}

	/**
	 * @Method Name : ntcList
	 * @작성일	    : 2017. 11. 27. 
	 * @작성자 		 : 오주석 
	 * @Method 설명  : 공지사항 목록을 보여주기 위한 service
	 * @return
	 */
	@Override
	public List<NTCDto> ntcList() throws Exception {
		// TODO Auto-generated method stub
		
		return homePDao.ntcList();
	}

	@Override
	public NTCDto ntcUpdatePage(int no) throws Exception {
		// TODO Auto-generated method stub
		return homePDao.ntcUpdatePage(no);
	}

	@Override
	public int ntcUpdate(NTCDto ntcDto) throws Exception {
		// TODO Auto-generated method stub
		
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		ntcDto.setDt(dateFormat.format(date));
		return homePDao.ntcUpdate(ntcDto);
	}
}
