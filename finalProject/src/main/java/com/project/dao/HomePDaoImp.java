package com.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	
}
