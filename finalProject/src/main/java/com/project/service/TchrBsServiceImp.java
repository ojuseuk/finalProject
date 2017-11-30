package com.project.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.dao.TchrBsDao;
import com.project.dto.EXAMTPDto;
import com.project.dto.QZDto;
import com.project.dto.SBJTDto;
import com.project.dto.SCRDto;
import com.project.dto.TCHRDto;
import com.project.dto.TPCDto;
import com.project.dto.TTLQZDto;

@Service
public class TchrBsServiceImp implements TchrBsService {

	@Autowired
	private TchrBsDao tchrBsDao;

	/**
	 * @Method Name  : qzView
	 * @작성일	     : 2017. 11. 16. 
	 * @작성자 		 : 오주석
	 * @Method 설명  : 문제를 생성 하기위한 페이지로 이동하는 함수 
	 * @return
	 */
	@Override
	public Map<List<TPCDto>, List<TCHRDto>> qzView() throws Exception {
		// TODO Auto-generated method stub
		
		List<TPCDto> listTcp = tchrBsDao.tchrBsTcp();
		
		List<TCHRDto> listTchr = tchrBsDao.tchrBsTchr();
		
		Map<List<TPCDto>, List<TCHRDto>> map = new HashMap<>();
		map.put(listTcp, listTchr);
		
		return map;
	}

	/**
	 * @Method Name  : qzInsert
	 * @작성일	     : 2017. 11. 16. 
	 * @작성자 		 : 오주석
	 * @Method 설명  : 문제를 생성해 주기 위한 함수
	 * @param ttlqzDto
	 * @return
	 */
	@Override
	public int ttlqzInsert(TTLQZDto ttlqzDto) throws Exception {
		// TODO Auto-generated method stub
		
		
		int num = tchrBsDao.ttlqzInsert(ttlqzDto);
		
		return num;
		
		
	}

	/**
	 * @Method Name  : attnd
	 * @작성일	     : 2017. 11. 16. 
	 * @작성자 		 : 오주석
	 * @Method 설명  : 강사가 자기반 학생 출석을 확인하는 페이지로 이동하는 함수
	 * @param id
	 * @return
	 */
	@Override
	public List<Map<String, String>> attnd(String id) throws Exception {
		// TODO Auto-generated method stub
		
		String tchrNo = tchrBsDao.attndTchrNo(id);
		
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		String today = dateFormat.format(date);
		Map<String, String> map = new HashMap<>();
		map.put("tchrNo", tchrNo);
		map.put("today", today);
		
		List<Map<String, String>> list = tchrBsDao.attnd(map);
		
		return list;
	}

	/**
	 * @Method Name : attndClss
	 * @작성일	    : 2017. 11. 16. 
	 * @작성자 		 : 
	 * @Method 설명  :
	 * @param clssId
	 * @return
	 */
	@Override
	public List<Map<String, String>> attndClss(String clssId) throws Exception {
		// TODO Auto-generated method stub
		
		List<Map<String, String>> list = tchrBsDao.attndClss(clssId);
		
		return list;
	}

	/**
	 * @Method Name : srcIn
	 * @작성일	    : 2017. 11. 16. 
	 * @작성자 		 : 
	 * @Method 설명  :
	 * @return
	 */
	@Override
	public Map<String, List<Map<String, String>>> srcIn() throws Exception {
		// TODO Auto-generated method stub
	
		List<Map<String, String>> examTp = tchrBsDao.srcExamTp();
		List<Map<String, String>> sbjt = tchrBsDao.srcSbjt();
		List<Map<String, String>> stdt = tchrBsDao.srcStdt();
		
		
		Map<String, List<Map<String, String>>> map = new HashMap<>();
		map.put("examTp", examTp);
		map.put("sbjt", sbjt);
		map.put("stdt", stdt);
		
		return map;
		
	}

	/**
	 * @Method Name : srcInsert
	 * @작성일	    : 2017. 11. 16. 
	 * @작성자 		 : 
	 * @Method 설명  :
	 * @param scrDto
	 */
	@Override
	public void srcInsert(SCRDto scrDto) throws Exception {
		// TODO Auto-generated method stub
		
		tchrBsDao.srcInsert(scrDto);
		
	}

	/**
	 * @Method Name : stSearch
	 * @작성일	    : 2017. 11. 16. 
	 * @작성자 		 : 
	 * @Method 설명  :
	 * @param id
	 * @return
	 */
	@Override
	public List<String> stSearch(String id) throws Exception {
		// TODO Auto-generated method stub
		
		String tchrNo = tchrBsDao.attndTchrNo(id);
		
		List<String> list = tchrBsDao.stSearch(tchrNo);
		
		return list;
	}

	@Override
	public List<Map<String, Object>> stClssSearch(String clssId) throws Exception {
		// TODO Auto-generated method stub
		List<Map<String, Object>> list = tchrBsDao.stClssSearch(clssId);
		
		return list;
	}

	@Override
	public Map<List<SBJTDto>, List<Map<String, String>>> qzSelectView() throws Exception {
		// TODO Auto-generated method stub
		
		List<SBJTDto> listTchr = tchrBsDao.qzSelectView();
		List<Map<String, String>> listExam = tchrBsDao.qzExamSelect();
		
		Map<List<SBJTDto>, List<Map<String, String>>> map = new HashMap<>();
		map.put(listTchr, listExam);
		
		return map;
		
	}

	@Override
	public List<Map<String, Object>> qzSelect(String sbjtNm) throws Exception {
		// TODO Auto-generated method stub
		
		return tchrBsDao.qzSelect(sbjtNm);
		
	}

	@Override
	public List<TTLQZDto> qzUpdateView() throws Exception {
		// TODO Auto-generated method stub
		return tchrBsDao.qzUpdateView();
	}

	@Override
	public TTLQZDto qzUpdateSearch(int id) throws Exception {
		// TODO Auto-generated method stub
		
		return tchrBsDao.qzUpdateSearch(id);
	}

	@Override
	@Transactional
	public void qzInsert(EXAMTPDto examtpDto, List<Integer> id) throws Exception {
		// TODO Auto-generated method stub
		
		String examId = tchrBsDao.examTpSelect();
		String str = null;
		if(examId == null) {
			str = "EX0001";
		}else {
			String a = examId.substring(0, 2);
			String b = examId.substring(2, 5);
			int bb = Integer.parseInt(b);
			String suffix = String.format("%03d", (bb+1));
			str = (a+suffix);
		}
		
		examtpDto.setExamId(str);
		String[] ymd = examtpDto.getExamDt().split("-");
		examtpDto.setExamDt(ymd[0]+ymd[1]+ymd[2]);
		tchrBsDao.examTpInsert(examtpDto);
		
		List<QZDto> list = new ArrayList<>();
		for(int i=0;i<id.size();i++) {
			list.add(new QZDto(examtpDto.getExamId(), id.get(i), (i+1), 10));
		}
		
		tchrBsDao.qzInsert(list);
		
	}

	
}
