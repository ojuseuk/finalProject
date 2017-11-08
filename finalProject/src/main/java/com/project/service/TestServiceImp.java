package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.TestDao;
import com.project.dto.TestDto;
import com.sun.scenario.effect.impl.sw.sse.SSEBlend_COLOR_BURNPeer;

@Service
public class TestServiceImp implements TestService {

	@Autowired
	private TestDao testdao;
	
	@Override
	public int test(TestDto testDto) {
		// TODO Auto-generated method stub
		
		System.out.println("service : " + testDto.toString());
		
		return testdao.test(testDto);
		
		
	}

}
