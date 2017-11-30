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
	public List<TPCDto> tchrBsTcp() throws SQLException {
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
	public List<TCHRDto> tchrBsTchr() throws SQLException {
		// TODO Auto-generated method stub
		
		System.out.println("dao tchrBsTchr");
		
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
	public int ttlqzInsert(TTLQZDto ttlqzDto) throws SQLException {
		// TODO Auto-generated method stub
		
		System.out.println("dao ttlqzInsert");
		
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
	public List<Map<String, String>> attnd(Map<String, String>map) throws SQLException {
		// TODO Auto-generated method stub
		
		System.out.println("dao attnd");
		System.out.println(map);
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
	public List<Map<String, String>> attndClss(String clssId) throws SQLException {
		// TODO Auto-generated method stub
		
		System.out.println("dao attndClss");
		System.out.println(clssId);
		List<Map<String, String>> list2 = sqlSession.selectList("test.attndClss", clssId);
		System.out.println(list2);
		System.out.println(sqlSession.selectList("test.attndClss", clssId));
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
	public List<Map<String, String>> srcExamTp() throws SQLException {
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
	public List<Map<String, String>> srcSbjt() throws SQLException {
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
	public List<Map<String, String>> srcStdt() throws SQLException {
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
	public void srcInsert(SCRDto scrDto) throws SQLException {
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
	public List<String> stSearch(String tchrNo) throws SQLException {
		// TODO Auto-generated method stub
		
		System.out.println("dao stSearch");
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
	public List<Map<String, Object>> stClssSearch(String clssId) throws SQLException {
		// TODO Auto-generated method stub
		System.out.println("dao stClssSearch");
		
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
	public List<SBJTDto> qzSelectView() throws SQLException {
		// TODO Auto-generated method stub
		System.out.println("dao qzSelectView");
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
	public List<Map<String, Object>> qzSelect(String sbjtNm) throws SQLException {
		// TODO Auto-generated method stub
		System.out.println("dao qzSelect");
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
	public List<TTLQZDto> qzUpdateView() throws SQLException {
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
	public TTLQZDto qzUpdateSearch(int id) throws SQLException {
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
	public List<Map<String, String>> qzExamSelect() throws SQLException {
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
	public void qzInsert(List<QZDto> list) throws SQLException {
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
	public String attndTchrNo(String id) throws SQLException {
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
	public int examTpInsert(EXAMTPDto examtpDto) throws SQLException {
		// TODO Auto-generated method stub
		
		System.out.println("dao examTpInsert");
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
	public String examTpSelect() throws SQLException {
		System.out.println("dao examTpSelect");
		String str = sqlSession.selectOne("test.examTpSelect", "abc");
		System.out.println("-----------------------");
		return str;
	}
	
	
}
