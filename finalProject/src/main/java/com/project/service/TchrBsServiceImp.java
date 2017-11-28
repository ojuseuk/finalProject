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
	@Transactional
	public Map<List<TPCDto>, List<TCHRDto>> qzView() {
		// TODO Auto-generated method stub
		
		System.out.println("service qzView");
		List<TPCDto> listTcp = tchrBsDao.tchrBsTcp();
		
		List<TCHRDto> listTchr = tchrBsDao.tchrBsTchr();
		
		System.out.println(listTcp);
		System.out.println(listTchr);
		
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
	public int ttlqzInsert(TTLQZDto ttlqzDto) {
		// TODO Auto-generated method stub
		
		System.out.println("service qzInsert");
		
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
	public List<Map<String, String>> attnd(String id) {
		// TODO Auto-generated method stub
		
		System.out.println("service attnd");
		
		String tchrNo = tchrBsDao.attndTchrNo(id);
		
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		String today = dateFormat.format(date);
		Map<String, String> map = new HashMap<>();
		map.put("tchrNo", tchrNo);
		map.put("today", today);
		
		List<Map<String, String>> list = tchrBsDao.attnd(map);
		System.out.println(list);
		
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
	public List<Map<String, String>> attndClss(String clssId) {
		// TODO Auto-generated method stub
		
		System.out.println("service attndClss");
		
		List<Map<String, String>> list = tchrBsDao.attndClss(clssId);
		System.out.println(list);
		
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
	public Map<String, List<Map<String, String>>> srcIn() {
		// TODO Auto-generated method stub
	
		System.out.println("service arcIn");
		
		List<Map<String, String>> examTp = tchrBsDao.srcExamTp();
		List<Map<String, String>> sbjt = tchrBsDao.srcSbjt();
		List<Map<String, String>> stdt = tchrBsDao.srcStdt();
		
		System.out.println(examTp);
		System.out.println(sbjt);
		System.out.println(stdt);
		
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
	public void srcInsert(SCRDto scrDto) {
		// TODO Auto-generated method stub
		
		System.out.println("service srcInsert");
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
	public List<String> stSearch(String id) {
		// TODO Auto-generated method stub
		
		String tchrNo = tchrBsDao.attndTchrNo(id);
		
		System.out.println("service stSearch");
		List<String> list = tchrBsDao.stSearch(tchrNo);
		System.out.println(list);
		
		return list;
	}

	@Override
	public List<Map<String, Object>> stClssSearch(String clssId) {
		// TODO Auto-generated method stub
		System.out.println("serviced stClssSearch");
		List<Map<String, Object>> list = tchrBsDao.stClssSearch(clssId);
		System.out.println(list);
		
		return list;
	}

	@Override
	public Map<List<SBJTDto>, List<Map<String, String>>> qzSelectView() {
		// TODO Auto-generated method stub
		
		System.out.println("service qzSelectView");
		List<SBJTDto> listTchr = tchrBsDao.qzSelectView();
		List<Map<String, String>> listExam = tchrBsDao.qzExamSelect();
		
		Map<List<SBJTDto>, List<Map<String, String>>> map = new HashMap<>();
		map.put(listTchr, listExam);
		
		return map;
		
	}

	@Override
	public List<Map<String, Object>> qzSelect(String sbjtNm) {
		// TODO Auto-generated method stub
		System.out.println("servicde qzSelect");
		
		return tchrBsDao.qzSelect(sbjtNm);
		
	}

	@Override
	public List<TTLQZDto> qzUpdateView() {
		// TODO Auto-generated method stub
		return tchrBsDao.qzUpdateView();
	}

	@Override
	public TTLQZDto qzUpdateSearch(int id) {
		// TODO Auto-generated method stub
		
		return tchrBsDao.qzUpdateSearch(id);
	}

	@Override
	@Transactional
	public void qzInsert(EXAMTPDto examtpDto, List<Integer> id) {
		// TODO Auto-generated method stub
		
		System.out.println(id.size());
		
		String examId = tchrBsDao.examTpSelect();
		System.out.println(examId);
		String a = examId.substring(0, 1);
		String b = examId.substring(1, 5);
		int bb = Integer.parseInt(b);
		String suffix = String.format("%03d", (bb+1));
		System.out.println(a + "   " + suffix);
		String str = (a+suffix);
		System.out.println(str);
		examtpDto.setExamId(str);
//		tchrBsDao.examTpInsert(examtpDto);
//		
//		List<QZDto> list = new ArrayList<>();
//		for(int i=0;i<id.size();i++) {
//			list.add(new QZDto(examtpDto.getExamId(), id.get(i), (i+1), 10));
//		}
//		
//		tchrBsDao.qzInsert(list);
		
	}

	
}
