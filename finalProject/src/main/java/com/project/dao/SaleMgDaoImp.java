package com.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.SALEDto;
import com.project.dto.TCHRASSNDto;
import com.project.dto.TCHRDto;

@Repository
public class SaleMgDaoImp implements SaleMgDao {

	@Autowired
	private SqlSession sqlSession;

	/**
	 * @Method Name  : insert
	 * @작성일       : 2017. 11. 8. 
	 * @작성자 		 : 오주석
	 * @Method 설명  :
	 * return type   : 
	 * @param saleDto
	 */
	@Override
	public void insert(SALEDto saleDto) {
		// TODO Auto-generated method stub
		System.out.println("dao Insert");
		sqlSession.insert("saleMgMapper.saleInsert", saleDto);
	}

	/**
	 * @Method Name  : saleNo
	 * @작성일       : 2017. 11. 8. 
	 * @작성자 		 : 오주석
	 * @Method 설명  :
	 * return type   : 
	 * @param saleDto
	 * @return
	 */
	@Override
	public int saleNo(SALEDto saleDto) {
		// TODO Auto-generated method stub
		
		System.out.println("dao saleNo");
		return sqlSession.selectOne("saleMgMapper.saleSelectNo", saleDto);
		
	}

	@Override
	public List<TCHRDto> selectTchr() {
		// TODO Auto-generated method stub
		System.out.println("dao selectTchr");
	
		System.out.println(sqlSession.selectList("saleMgMapper.selectTchr"));
		return sqlSession.selectList("saleMgMapper.selectTchr");
	}

	@Override
	public List<TCHRASSNDto> selectTchrassn() {
		// TODO Auto-generated method stub
		System.out.println("dao selectTchrassn");
	
		System.out.println(sqlSession.selectList("saleMgMapper.selectTchrassn"));
		return sqlSession.selectList("saleMgMapper.selectTchrassn");
	}

	@Override
	public List<SALEDto> mgSaleList(Map<String, String> map) {
		// TODO Auto-generated method stub
	
		return sqlSession.selectList("saleMgMapper.mgSaleLsit", map);
	}

}
