package com.project.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.EMPDto;
import com.project.dto.TCHRASSNDto;
import com.project.dto.TCHRDto;
import com.project.dto.USRDto;

@Repository
public class EmpMgDaoImp implements EmpMgDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List empSelectAll() {
		List list = sqlSession.selectList("empMgMapper.empSelectAll");
		return list;
	}

	@Override
	public String empInsert(EMPDto emp) {
		// TODO Auto-generated method stub
		int result = 0;
		String resultMsg = "";
		result = sqlSession.insert("empMgMapper.empInsert", emp);
		if(result > 0) {
			resultMsg = "직원 정보가 정상적으로 등록되었습니다.";
		} else {
			resultMsg = "직원 정보 등록에 실패하였습니다.";
		}
		return resultMsg;
	}

	@Override
	public EMPDto empSelect(String empNo) {
		// TODO Auto-generated method stub
		EMPDto emp = sqlSession.selectOne("empMgMapper.empSelectOne", empNo);
		return emp;
	}

	@Override
	public EMPDto empSelectById(String id) {
		// TODO Auto-generated method stub
		EMPDto emp =  sqlSession.selectOne("empMgMapper.empSelectById",id);
		return emp;
	}
	
	@Override
	public USRDto usrSelect(String id) {
		// TODO Auto-generated method stub
		USRDto usr =  sqlSession.selectOne("empMgMapper.usrSelectOne",id);
		return usr;
	}

	@Override
	public List tchrSelectAll() {
		List list = sqlSession.selectList("empMgMapper.tchrSelectAll");
		return list;
	}

	@Override
	public String tchrInsert(TCHRDto tchr) {
		int result = 0;
		String resultMsg = "";
		result = sqlSession.insert("empMgMapper.tchrInsert", tchr);
		if(result > 0) {
			resultMsg = "강사정보가 정상적으로 등록되었습니다.";
		} else {
			resultMsg = "강사정보가 정상적으로 등록되었습니다.";
		}
		return resultMsg;
	}

	@Override
	public String usrUpdateToTchr(String id) {
		// TODO Auto-generated method stub
		int result = 0;
		String resultMsg = "";
		result = sqlSession.update("empMgMapper.usrUpdateToTchr", id);
		if(result > 0) {
			resultMsg = "사용자 유형이 강사로 변경되었습니다.";
		} else {
			resultMsg = "사용자 유형 변경에 실패하였습니다.";
		}
		return resultMsg;		
	}

	@Override
	public String usrUpdateToStaff(String id) {
		int result = 0;
		String resultMsg = "";
		result = sqlSession.update("empMgMapper.usrUpdateToStaff", id);
		if(result > 0) {
			resultMsg = "사용자 유형이 직원으로 변경되었습니다.";
		} else {
			resultMsg = "사용자 유형 변경에 실패하였습니다.";
		}
		System.out.println("EMP DAO DB 리턴값 : " + result);
		return resultMsg;			
	}

	@Override
	public String empUpdate(EMPDto emp) {
		// TODO Auto-generated method stub
		System.out.println("DAO Update : " + emp);
		int result = 0;
		String resultMsg = "";
		result = sqlSession.update("empMgMapper.empUpdate", emp);
		if(result > 0) {
			resultMsg = "직원의 정보가 정상적으로 변경되었습니다.";
		} else {
			resultMsg = "직원 정보의 변경에 실패하였습니다.";
		}
		System.out.println("EMP DAO DB 리턴값 : " + result);
		return resultMsg;	
	}

	@Override
	public String empRetire(EMPDto emp) {
		// TODO Auto-generated method stub
		System.out.println("empRetire : " + emp);
		int result = 0;
		String resultMsg = "";
		result = sqlSession.update("empMgMapper.empRetire", emp);
		if(result > 0) {
			resultMsg = "직원을 정상적으로 퇴직 처리하였습니다.";
		} else {
			resultMsg = "직원의 퇴직처리를 실패하였습니다.";
		}
		System.out.println("EMP DAO DB 리턴값 : " + result);
		return resultMsg;	
	}

	@Override
	public TCHRDto tchrSelectById(String id) {
		// TODO Auto-generated method stub
		TCHRDto tchr =  sqlSession.selectOne("empMgMapper.tchrSelectById",id);
		return tchr;
	}

	@Override
	public TCHRDto tchrSelect(String tchrNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("empMgMapper.tchrSelect",tchrNo);
	}

	@Override
	public String tchrUpdate(TCHRDto tchr) {
		// TODO Auto-generated method stub
		System.out.println("DAO update 전 : " + tchr);
		int result = 0;
		String resultMsg = "";
		result =  sqlSession.update("empMgMapper.tchrUpdate", tchr);
		System.out.println("tchrUpdate 실행결과 : " + result); 	
		if(result > 0) {
			resultMsg = "강사의 정보가 정상적으로 수정되었습니다.";
		} else {
			resultMsg = "강사 정보의 수정 작업에 실패하였습니다.";
		}
		System.out.println(resultMsg); // @@@ 
		return resultMsg;
	}

	@Override
	public List tchrSelectBySbjtNm(String sbjtNm) {
		// TODO Auto-generated method stub
		System.out.println(sbjtNm);
		TCHRASSNDto tchrassnDto = new TCHRASSNDto();
		tchrassnDto.setSbjtNm(sbjtNm);
		System.out.println("tchrSelectBySbjtNm DAO : " + sqlSession.selectList("empMgMapper.tchrSelectBySbjtNm", tchrassnDto)); 
		return sqlSession.selectList("empMgMapper.tchrSelectBySbjtNm", tchrassnDto);
	}

	@Override
	public String assnTchr(TCHRASSNDto tchrAssn) {
		// TODO Auto-generated method stub
		int result = 0;
		String resultMsg = "";
		result = sqlSession.insert("empMgMapper.assnTchr", tchrAssn);
		System.out.println("assnTchr 실행결과 : " + result); 	// @@@  1 행 insert/update 시 1 리턴 
		if(result > 0) {
			resultMsg = "강사 배정 작업이 정상적으로 수행되었습니다.";
		} else {
			resultMsg = "강사 배정 작업에 실패하였습니다.";
		}
		System.out.println(resultMsg); // @@@ 
		return resultMsg;
	}

	@Override
	public List tchrAssnSelect(String clssId) {
		// TODO Auto-generated method stub
		
		System.out.println("tchrAssnSelect DAO : " + sqlSession.selectList("empMgMapper.tchrAssnSelect", clssId));
		return sqlSession.selectList("empMgMapper.tchrAssnSelect", clssId);
//		return sqlSession.selectOne("empMgMapper.tchrAssnSelect", clssId);
	}

	
}
