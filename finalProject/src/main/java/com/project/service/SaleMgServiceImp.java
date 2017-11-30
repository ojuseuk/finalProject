package com.project.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.SaleMgDao;
import com.project.dto.SALEDto;
import com.project.dto.TCHRASSNDto;
import com.project.dto.TCHRDto;

@Service
public class SaleMgServiceImp implements SaleMgService {

	@Autowired
	private SaleMgDao saleMgDao;


	/**
	 * @Method Name  : insert
	 * @작성일       : 2017. 11. 8. 
	 * @작성자 		 : 오주석
	 * @Method 설명  :
	 * return type   : 
	 * @param date
	 * @param amount
	 * @param costItem
	 */
	@Override
	public void insert(String date, int amount) throws Exception {
		// TODO Auto-generated method stub
		String[] ymd = date.split("-");
		
		final String costItem="수강료 납부";
		SALEDto saleDto = new SALEDto(Integer.valueOf(ymd[0]), Integer.valueOf(ymd[1]), Integer.valueOf(ymd[2]), costItem, amount);
		saleDto.setNo(saleMgDao.saleNo(saleDto)+1);
		saleMgDao.insert(saleDto);
	}


	/**
	 * @Method Name : selectLtfee
	 * @작성일	    : 2017. 11. 9. 
	 * @작성자 		 : 
	 * @Method 설명  :
	 * @return
	 */
	@Override
	public Map<List<Map<String, String>>, List<Map<String, String>>> selectLtfee() throws Exception {
		// TODO Auto-generated method stub
		List<Map<String, String>> listTchr = saleMgDao.selectTchr();
		List<Map<String, String>> listSsn = saleMgDao.selectTchrassn();
		
		Map<List<Map<String, String>>, List<Map<String, String>>> map =new HashMap<>();
		map.put(listTchr, listSsn);

		return map;
	}



	/**
	 * @Method Name : mgSaleList
	 * @작성일	    : 2017. 11. 9. 
	 * @작성자 		 : 
	 * @Method 설명  :
	 * @param date1
	 * @param date2
	 * @return
	 */
	@Override
	public List<SALEDto> mgSaleList(String date1, String date2) throws Exception {
		// TODO Auto-generated method stub
		String[] ymd1 = date1.split("-");
		String[] ymd2 = date2.split("-");
		
		Map<String, String> map = new HashMap<>();
		map.put("year1", ymd1[0]);
		map.put("month1", ymd1[1]);
		map.put("day1", ymd1[2]);
		map.put("year2", ymd2[0]);
		map.put("month2", ymd2[1]);
		map.put("day2", ymd2[2]);
		
		List<SALEDto> list = saleMgDao.mgSaleList(map);
		
		return list;
		
	}


		
	/**
	 * @Method Name : ltfeeInsert
	 * @작성일	    : 2017. 11. 12. 
	 * @작성자 		 : 
	 * @Method 설명  :
	 * @param tchrId
	 * @param tchrSlr
	 * @param ssnId
	 * @param ssnSlr
	 */
	@Override
	public List<TCHRDto> ltfeeInsert(List<String> tchrId, List<String> tchrSlr, List<String> ssnId, List<String> ssnSlr, List<String> tchrNm, List<String> ssnNm) throws Exception {
		// TODO Auto-generated method stub
		
		TCHRDto tchr = null;
		List<TCHRDto> list=new ArrayList<>();
		
		for(int i=0;i<tchrId.size();i++) {
			tchr = new TCHRDto();
			tchr.setId(tchrId.get(i));
			tchr.setSlr(tchrSlr.get(i));
			tchr.setNm(tchrNm.get(i));
			list.add(tchr);
		}
		
		for(int i=0;i<ssnId.size();i++) {
			tchr = new TCHRDto();
			tchr.setId(ssnId.get(i));
			tchr.setSlr(ssnSlr.get(i));
			tchr.setNm(ssnNm.get(i));
			list.add(tchr);
		}
		
		int result = 0;
		for(int i=0; i<list.size(); i++) {
			result = saleMgDao.ltfeeInsertTest(list.get(i));
			tchr.setResult(result);
			
		}
		
//		saleMgDao.ltfeeInsert(list);
		
		return list;
	}


	@Override
	public List<SALEDto> mgSaleList2(int year, int month, int day) throws Exception {
		// TODO Auto-generated method stub
		SALEDto saleDto = new SALEDto();
		saleDto.setYear(year);
		saleDto.setMonth(month);
		saleDto.setDay(day);
		
		return saleMgDao.mgSaleList2(saleDto);
	}
	
}


