package com.project.service;

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
	public void insert(String date, int amount, String costItem) {
		// TODO Auto-generated method stub
		System.out.println("Service insert");
		String[] ymd = date.split("-");
		
		System.out.println(ymd[0]);
		System.out.println(ymd[1]);
		System.out.println(ymd[2]);
		SALEDto saleDto = new SALEDto(Integer.valueOf(ymd[0]), Integer.valueOf(ymd[1]), Integer.valueOf(ymd[2]), costItem, amount);
		saleDto.setNo(saleMgDao.saleNo(saleDto)+1);
		System.out.println("------------------");
		saleMgDao.insert(saleDto);
	}


	@Override
	public Map<List<TCHRDto>, List<TCHRASSNDto>> selectLtfee() {
		// TODO Auto-generated method stub
		System.out.println("service selectLtfee");
		List<TCHRDto> listTchr = saleMgDao.selectTchr();
		List<TCHRASSNDto> listSsn = saleMgDao.selectTchrassn();
		
		System.out.println(listTchr.toString());
		System.out.println("-----------------------");
		System.out.println(listSsn.toString());
		Map<List<TCHRDto>, List<TCHRASSNDto>> map =new HashMap<>();
		map.put(listTchr, listSsn);

		return map;
	}


	@Override
	public List<SALEDto> mgSaleList(String date1, String date2) {
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
		System.out.println(map.get("year1"));
		System.out.println(map.get("month1"));
		System.out.println(map.get("day1"));
		System.out.println(map.get("year2"));
		System.out.println(map.get("month2"));
		System.out.println(map.get("day2"));
		
		List<SALEDto> list = saleMgDao.mgSaleList(map);
		
		System.out.println(list.toString());
		
		return list;
		
	}
}

