package com.project.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.EXAMTPDto;
import com.project.dto.QZDto;
import com.project.dto.SBJTDto;
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
	public List<TPCDto> tchrBsTcp() throws Exception {
		// TODO Auto-generated method stub
		
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
	public List<TCHRDto> tchrBsTchr() throws Exception {
		// TODO Auto-generated method stub
		
		return sqlSession.selectList("tchrBsMapper.tchrBsTchr");
	}

	/**
	 * @Method Name : ttlqzInsert
	 * @작성일	    : 2017. 11. 16. 
	 * @작성자 		 : 
	 * @Method 설명  :
	 * @param ttlqzDto
	 * @return
	 */
	@Override
	public int ttlqzInsert(TTLQZDto ttlqzDto) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert("tchrBsMapper.ttlqzInsert", ttlqzDto);
		
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
	public List<Map<String, String>> attnd(Map<String, String>map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("tchrBsMapper.attnd", map);
		
		
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
	public List<Map<String, String>> srcExamTp() throws Exception {
		// TODO Auto-generated method stub
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
	public List<Map<String, String>> srcSbjt() throws Exception {
		// TODO Auto-generated method stub
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
	public List<Map<String, String>> srcStdt() throws Exception {
		// TODO Auto-generated method stub
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
	public void srcInsert(SCRDto scrDto) throws Exception {
		// TODO Auto-generated method stub
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
	public List<String> stSearch(String tchrNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("tchrBsMapper.stSearch", tchrNo);
		
	}

	/**
	 * @Method Name : stClssSearch
	 * @작성일	    : 2017. 11. 16. 
	 * @작성자 		 : 
	 * @Method 설명  :
	 * @param clssId
	 */
	@Override
	public List<Map<String, Object>> stClssSearch(String clssId) throws Exception {
		// TODO Auto-generated method stub
		List<Map<String, Object>> list = sqlSession.selectList("tchrBsMapper.stClssSearch", clssId);
		return list;
	}

	/**
	 * @Method Name : qzSelectView
	 * @작성일	    : 2017. 11. 18. 
	 * @작성자 		 : 
	 * @Method 설명  :
	 * @return
	 */
	@Override
	public List<SBJTDto> qzSelectView() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("tchrBsMapper.qzSelectView");
	}

	/**
	 * @Method Name : qzSelect
	 * @작성일	    : 2017. 11. 18. 
	 * @작성자 		 : 
	 * @Method 설명  :
	 * @param sbjtNm
	 * @return
	 */
	@Override
	public List<Map<String, Object>> qzSelect(String sbjtNm) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("tchrBsMapper.qzSelect", sbjtNm);
	}

	/**
	 * @Method Name : qzUpdateView
	 * @작성일	    : 2017. 11. 18. 
	 * @작성자 		 : 
	 * @Method 설명  :
	 * @return
	 */
	@Override
	public List<TTLQZDto> qzUpdateView() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("tchrBsMapper.qzUpdateView");
	}

	/**
	 * @Method Name : qzUpdateSearch
	 * @작성일	    : 2017. 11. 18. 
	 * @작성자 		 : 
	 * @Method 설명  :
	 * @param id
	 * @return
	 */
	@Override
	public TTLQZDto qzUpdateSearch(int id) throws Exception {
		return sqlSession.selectOne("tchrBsMapper.qzUpdateSearch", id);
	}

	/**
	 * @Method Name : qzExamSelect
	 * @작성일	    : 2017. 11. 18. 
	 * @작성자 		 : 
	 * @Method 설명  :
	 * @return
	 */
	@Override
	public List<Map<String, String>> qzExamSelect() throws Exception {
		// TODO Auto-generated method stub
		
		return sqlSession.selectList("tchrBsMapper.qzExamSelect");
		
	}

	/**
	 * @Method Name : qzInsert
	 * @작성일	    : 2017. 11. 20. 
	 * @작성자 		 : 
	 * @Method 설명  :
	 * @param list
	 */
	@Override
	public void qzInsert(List<QZDto> list) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("dao qzInsert");
		System.out.println(list.get(0).getExamId());
		int a = sqlSession.insert("tchrBsMapper.qzInsert", list);
		System.out.println(a);
	}

	/**
	 * @Method Name  : attndTchrNo
	 * @작성일	     : 2017. 11. 23. 
	 * @작성자 		 : 오주석
	 * @Method 설명  : 아이디를 가지고 강사 번호를 가져오기 위한 함수
	 * @param id
	 */
	@Override
	public String attndTchrNo(String id) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("dao attndTchrNo");
		return sqlSession.selectOne("tchrBsMapper.attndTchrNo", id);
	}

	/**
	 * @Method Name : examTpInsert
	 * @작성일	    : 2017. 11. 27. 
	 * @작성자 		 : 
	 * @Method 설명  :
	 * @param examtpDto
	 * @return
	 */
	@Override
	public int examTpInsert(EXAMTPDto examtpDto) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert("test.examTpInsert", examtpDto);
		
	}

	/**
	 * @Method Name : examTpSelect
	 * @작성일	    : 2017. 11. 27. 
	 * @작성자 		 : 
	 * @Method 설명  :
	 * @return
	 */
	@Override
	public String examTpSelect() throws Exception {
		String str = sqlSession.selectOne("test.examTpSelect", "abc");
		return str;
	}
	
	
}
