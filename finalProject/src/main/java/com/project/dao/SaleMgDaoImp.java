package com.project.dao;

import java.sql.SQLException;
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
	 * @Method Name : insert
	 * @작성일 : 2017. 11. 8.
	 * @작성자 : 오주석
	 * @Method 설명 : return type :
	 * @param saleDto
	 */
	@Override
	public void insert(SALEDto saleDto) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("saleMgMapper.saleInsert", saleDto);
	}

	/**
	 * @Method Name : saleNo
	 * @작성일 : 2017. 11. 8.
	 * @작성자 : 오주석
	 * @Method 설명 : return type :
	 * @param saleDto
	 * @return
	 */
	@Override
	public int saleNo(SALEDto saleDto) throws Exception {
		// TODO Auto-generated method stub

		return sqlSession.selectOne("saleMgMapper.saleSelectNo", saleDto);

	}

	/**
	 * @Method Name : selectTchr
	 * @작성일 : 2017. 11. 12.
	 * @작성자 :
	 * @Method 설명 :
	 * @return
	 */
	@Override
	public List<Map<String, String>> selectTchr() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("saleMgMapper.selectTchr");
	}

	/**
	 * @Method Name : selectTchrassn
	 * @작성일 : 2017. 11. 12.
	 * @작성자 :
	 * @Method 설명 :
	 * @return
	 */
	@Override
	public List<Map<String, String>> selectTchrassn() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("saleMgMapper.selectTchrassn");
	}

	/**
	 * @Method Name : mgSaleList
	 * @작성일 : 2017. 11. 12.
	 * @작성자 :
	 * @Method 설명 :
	 * @param map
	 * @return
	 */
	@Override
	public List<SALEDto> mgSaleList(Map<String, String> map) throws Exception {
		// TODO Auto-generated method stub

		return sqlSession.selectList("saleMgMapper.mgSaleLsit", map);
	}

	/**
	 * @Method Name : ltfeeInsert
	 * @작성일 : 2017. 11. 12.
	 * @작성자 :
	 * @Method 설명 :
	 * @param list
	 */
	@Override
	public void ltfeeInsert(List<TCHRDto> list) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(sqlSession.selectList("saleMgMapper.ltfeeInsert", list));
	}

	/**
	 * @Method Name : ltfeeInsertTest
	 * @작성일	    : 2017. 11. 13. 
	 * @작성자 		 : 
	 * @Method 설명  :
	 * @param tchrDto
	 * @return
	 */
	@Override
	public int ltfeeInsertTest(TCHRDto tchrDto) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.selectOne("saleMgMapper.ltfeeInsertTest", tchrDto);
		return tchrDto.getResult();
	}

	@Override
	public List<SALEDto> mgSaleList2(SALEDto saleDto) throws Exception {
		// TODO Auto-generated method stub
		
		return sqlSession.selectList("saleMgMapper.mgSaleList2", saleDto);
	}

}
