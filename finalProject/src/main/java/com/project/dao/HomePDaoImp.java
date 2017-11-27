package com.project.dao;

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

	@Override
	public void qnaInsert(QNADto qnaDto) {
		// TODO Auto-generated method stub
		
		sqlSession.insert("homePMapper.qnaInsert", qnaDto);
		
	}

	@Override
	public int qnaCnt() {
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

	@Override
	public int qnaSeqNum(QNADto qnaDto) {
		// TODO Auto-generated method stub
		
		return sqlSession.update("homePMapper.qnaSeqNum", qnaDto);
		
	}

	@Override
	public List<QNADto> qnaSelectView() {
		// TODO Auto-generated method stub
		
		return sqlSession.selectList("homePMapper.qnaSelectView");
		
	}

	@Override
	public QNADto qnaUpdateView(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("homePMapper.qnaUpdateView", no);
	}

	@Override
	public int qnaUpdate(QNADto qnaDto) {
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
	public String ntcTchr(String id) {
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
	public int ntcInsert(NTCDto ntcDto) {
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
	public List<NTCDto> ntcList() {
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
	public NTCDto ntcUpdatePage(int no) {
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
	public int ntcUpdate(NTCDto ntcDto) {
		// TODO Auto-generated method stub
		System.out.println("dao ntcUpdate");
		System.out.println(ntcDto);
		return sqlSession.selectOne("homePMapper.ntcUpdate", ntcDto);
	}
}
