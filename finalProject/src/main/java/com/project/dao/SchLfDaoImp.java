package com.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.STDTDto;

@Repository
public class SchLfDaoImp implements SchLfDao{

	@Autowired
	private SqlSession sqlSession;


	
}
