package com.project.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.NTCDto;
import com.project.dto.QNADto;

@Repository
public class HomePDaoImp implements HomePDao {

	@Autowired
	private SqlSession sqlSession;

	/**
	 * @Method Name : qnaInsert
	 * @작성일	    : 2017. 11. 27. 
	 * @작성자 		 : 
	 * @Method 설명  :
	 * @param qnaDto
	 */
	@Override
	public void qnaInsert(QNADto qnaDto) {
		// TODO Auto-generated method stub
		
		sqlSession.insert("homePMapper.qnaInsert", qnaDto);
		
	}

	/**
	 * @Method Name : qnaCnt
	 * @작성일	    : 2017. 11. 27. 
	 * @작성자 		 : 
	 * @Method 설명  :
	 * @return
	 * @throws SQLException
	 */
	@Override
	public int qnaCnt() throws SQLException {
		// TODO Auto-generated method stub
		int max = 0;
		Object object = sqlSession.selectOne("homePMapper.qnaCnt");
		System.out.println("object: " + object);
		if(object == null) {
			max = 1;
		}else {
			max = Integer.parseInt(object.toString()) +1;
		}
		System.out.println("dao :" + max);
		return max;
	}

	/**
	 * @Method Name : qnaSeqNum
	 * @작성일	    : 2017. 11. 27. 
	 * @작성자 		 : 
	 * @Method 설명  :
	 * @param qnaDto
	 * @return
	 * @throws SQLException
	 */
	@Override
	public int qnaSeqNum(QNADto qnaDto) throws SQLException {
		// TODO Auto-generated method stub
		
		return sqlSession.update("homePMapper.qnaSeqNum", qnaDto);
		
	}

	/**
	 * @Method Name : qnaSelectView
	 * @작성일	    : 2017. 11. 27. 
	 * @작성자 		 : 
	 * @Method 설명  :
	 * @return
	 * @throws SQLException
	 */
	@Override
	public List<QNADto> qnaSelectView() throws SQLException {
		// TODO Auto-generated method stub
		
		return sqlSession.selectList("homePMapper.qnaSelectView");
		
	}

	/**
	 * @Method Name : qnaUpdateView
	 * @작성일	    : 2017. 11. 27. 
	 * @작성자 		 : 
	 * @Method 설명  :
	 * @param no
	 * @return
	 * @throws SQLException
	 */
	@Override
	public QNADto qnaUpdateView(int no) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("homePMapper.qnaUpdateView", no);
	}

	/**
	 * @Method Name : qnaUpdate
	 * @작성일	    : 2017. 11. 27. 
	 * @작성자 		 : 
	 * @Method 설명  :
	 * @param qnaDto
	 * @return
	 * @throws SQLException
	 */
	@Override
	public int qnaUpdate(QNADto qnaDto) throws SQLException {
		// TODO Auto-generated method stub
		System.out.println("dao qnaUpdate");
		
		return sqlSession.update("homePMapper.qnaUpdate", qnaDto);
	}
	
	/**
	 * @Method Name : ntcTchr
	 * @작성일	    : 2017. 11. 27. 
	 * @작성자 		 : 오주석 
	 * @Method 설명  : 사용자 id로 직원 번호를 가져오기 위한 dao
	 * @param id
	 * @return
	 */
	@Override
	public String ntcTchr(String id) throws SQLException {
		// TODO Auto-generated method stub
		
		System.out.println("dao ntcTchr");
		
		return sqlSession.selectOne("homePMapper.ntcTchr", id);
	}

	/**
	 * @Method Name : ntcInsert
	 * @작성일	    : 2017. 11. 27. 
	 * @작성자 		 : 오주석
	 * @Method 설명  : 공지사항을 DB에 추가하기 위한 dao
	 * @param empNo
	 * @return
	 */
	@Override
	public int ntcInsert(NTCDto ntcDto) throws SQLException {
		// TODO Auto-generated method stub
		System.out.println("dao ntcInsert");
		return sqlSession.insert("homePMapper.ntcInsert", ntcDto);
	}

	/**
	 * @Method Name : ntcList
	 * @작성일	    : 2017. 11. 27. 
	 * @작성자 		 : 
	 * @Method 설명  :
	 * @return
	 */
	@Override
	public List<NTCDto> ntcList() throws SQLException {
		// TODO Auto-generated method stub
		System.out.println("dao ntcList()");
		return sqlSession.selectList("homePMapper.ntcList");
	}

	/**
	 * @Method Name : ntcUpdatePage
	 * @작성일	    : 2017. 11. 27. 
	 * @작성자 		 : 
	 * @Method 설명  :
	 * @param no
	 * @return
	 */
	@Override
	public NTCDto ntcUpdatePage(int no) throws SQLException {
		// TODO Auto-generated method stub
		System.out.println("dao ntcUpdatePage");
		return sqlSession.selectOne("homePMapper.ntcUpdatePage", no);
	}

	/**
	 * @Method Name : ntcUpdate
	 * @작성일	    : 2017. 11. 27. 
	 * @작성자 		 : 
	 * @Method 설명  :
	 * @param ntcDto
	 * @return
	 */
	@Override
	public int ntcUpdate(NTCDto ntcDto) throws SQLException {
		// TODO Auto-generated method stub
		System.out.println("dao ntcUpdate");
		System.out.println(ntcDto);
		return sqlSession.selectOne("homePMapper.ntcUpdate", ntcDto);
	}
}
