package com.project.service;

import java.util.ArrayList;
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
	 * @Method Name : qzView
	 * @작성일	    : 2017. 11. 16. 
	 * @작성자 		 : 
	 * @Method 설명  :
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
	 * @Method Name : qzInsert
	 * @작성일	    : 2017. 11. 16. 
	 * @작성자 		 : 
	 * @Method 설명  :
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
	 * @Method Name : attnd
	 * @작성일	    : 2017. 11. 16. 
	 * @작성자 		 : 
	 * @Method 설명  :
	 * @param id
	 * @return
	 */
	@Override
	public List<Map<String, String>> attnd(String id) {
		// TODO Auto-generated method stub
		
		System.out.println("service attnd");
		
		List<Map<String, String>> list = tchrBsDao.attnd(id);
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
		
		System.out.println("service stSearch");
		List<String> list = tchrBsDao.stSearch(id);
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
	public Map<List<SBJTDto>, List<EXAMTPDto>> qzSelectView() {
		// TODO Auto-generated method stub
		
		System.out.println("service qzSelectView");
		List<SBJTDto> listTchr = tchrBsDao.qzSelectView();
		List<EXAMTPDto> listExam = tchrBsDao.qzExamSelect();
		
		Map<List<SBJTDto>, List<EXAMTPDto>> map = new HashMap<>();
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
	public void qzInsert(String examId, List<Integer> id) {
		// TODO Auto-generated method stub
		
		System.out.println(id.size());
		List<QZDto> list = new ArrayList<>();
		for(int i=0;i<id.size();i++) {
			list.add(new QZDto(examId, id.get(i), (i+1), 10));
		}
		
		tchrBsDao.qzInsert(list);
		
	}
	
}
