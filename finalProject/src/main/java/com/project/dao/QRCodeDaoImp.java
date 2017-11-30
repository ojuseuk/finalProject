package com.project.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.ATTNDDto;
import com.project.dto.STDTCLSSDto;

@Repository
public class QRCodeDaoImp implements QRCodeDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void qrCodeInsert(ATTNDDto attndDto) {
		// TODO Auto-generated method stub
		
		sqlSession.insert("qrCodeMapper.qrCodeInsert", attndDto);
	}

	@Override
	public HashMap<String, String> qrCodeSelect(Map<String, String> clssPhone) {
		// TODO Auto-generated method stub
		HashMap<String, String> map = sqlSession.selectOne("qrCodeMapper.qrCodeSelect", clssPhone);
		
		return map;
		
	}

}
