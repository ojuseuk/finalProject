package com.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.SCRDto;
import com.project.dto.TCHRDto;
import com.project.dto.TPCDto;
import com.project.dto.TTLQZDto;

@Repository
public class TchrBsDaoImp implements TchrBsDao {

	@Autowired
	private SqlSession sqlSession;

	/**
	 * @Method Name : tchrBsTcp
	 * @작성일	    : 2017. 11. 16. 
	 * @작성자 		 : 
	 * @Method 설명  :
	 * @return
	 */
	@Override
	public List<TPCDto> tchrBsTcp() {
		// TODO Auto-generated method stub
		
		System.out.println("dao tchrBsTcp");
		
		return sqlSession.selectList("tchrBsMapper.tchrBsTcp");
	}

	/**
	 * @Method Name : tchrBsTchr
	 * @작성일	    : 2017. 11. 16. 
	 * @작성자 		 : 
	 * @Method 설명  :
	 * @return
	 */
	@Override
	public List<TCHRDto> tchrBsTchr() {
		// TODO Auto-generated method stub
		
		System.out.println("dao tchrBsTchr");
		
		return sqlSession.selectList("tchrBsMapper.tchrBsTchr");
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
	public int qzInsert(TTLQZDto ttlqzDto) {
		// TODO Auto-generated method stub
		
		System.out.println("dao qzInsert");
		
		return sqlSession.insert("tchrBsMapper.qzInsert", ttlqzDto);
		
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
		
		System.out.println("dao attnd");
		
		return sqlSession.selectList("tchrBsMapper.attnd", id);
		
		
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
		
		System.out.println("dao attndClss");
		
		return sqlSession.selectList("tchrBsMapper.attndClss", clssId);
		
	}

	/**
	 * @Method Name : srcExamTp
	 * @작성일	    : 2017. 11. 16. 
	 * @작성자 		 : 
	 * @Method 설명  :
	 * @return
	 */
	@Override
	public List<Map<String, String>> srcExamTp() {
		// TODO Auto-generated method stub
		System.out.println("dao srcExmTp");
		
		return sqlSession.selectList("tchrBsMapper.srcExmTp");
	}

	/**
	 * @Method Name : srcSbjt
	 * @작성일	    : 2017. 11. 16. 
	 * @작성자 		 : 
	 * @Method 설명  :
	 * @return
	 */
	@Override
	public List<Map<String, String>> srcSbjt() {
		// TODO Auto-generated method stub
		
		System.out.println("dao srcSbjt");
		
		return sqlSession.selectList("tchrBsMapper.srcSbjt");
		
	}

	/**
	 * @Method Name : srcStdt
	 * @작성일	    : 2017. 11. 16. 
	 * @작성자 		 : 
	 * @Method 설명  :
	 * @return
	 */
	@Override
	public List<Map<String, String>> srcStdt() {
		// TODO Auto-generated method stub
		
		System.out.println("dao srcStdt");

		return sqlSession.selectList("tchrBsMapper.srcStdt");
		
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
		
		System.out.println("dao srcInsert");
		
		sqlSession.insert("tchrBsMapper.srcInsert", scrDto);
		
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
		
		System.out.println("dao stSearch");
		return sqlSession.selectList("tchrBsMapper.stSearch", id);
		
	}

	/**
	 * @Method Name : stClssSearch
	 * @작성일	    : 2017. 11. 16. 
	 * @작성자 		 : 
	 * @Method 설명  :
	 * @param clssId
	 */
	@Override
	public List<Map<String, Object>> stClssSearch(String clssId) {
		// TODO Auto-generated method stub
		System.out.println("dao stClssSearch");
		
		List<Map<String, Object>> list = sqlSession.selectList("tchrBsMapper.stClssSearch", clssId);
		return list;
	}
	
}
