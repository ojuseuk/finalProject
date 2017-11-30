package com.project.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.QRCodeDao;
import com.project.dao.SaleMgDao;
import com.project.dto.ATTNDDto;

@Service
public class QRCodeServiceImp implements QRCodeService {
	
	@Autowired
	private QRCodeDao qrCodeDao;

	/**
	 * @Method Name : qrCodeInsert
	 * @작성일	    : 2017. 11. 13. 
	 * @작성자 		 : 
	 * @Method 설명  :
	 * @param phone
	 */
	@Override
	public void qrCodeInsert(String phone, String attnd, String clss) {
		// TODO Auto-generated method stub
		System.out.println("service qrCodeInsert");
		System.out.println(phone);
		
		Map<String, String> clssPhone = new HashMap<>();
		clssPhone.put("phone", phone);
		clssPhone.put("clss", clss);
		
		HashMap<String, String> map = qrCodeDao.qrCodeSelect(clssPhone);
		Date today = new Date();
		
		DateFormat date = new SimpleDateFormat("yyyyMMdd");
		DateFormat time = new SimpleDateFormat("HHmmss");
		
		System.out.println("날짜 변환 후(S): " + date.format(today));
		System.out.println("시간 변환 후(S): " + time.format(today));

		String timeStr = time.format(today);
		
		//A.compareTo(B)
		// A 가 더크면 양수
		// B 가 더크면 음수
		// A랑 B가 같으면 0
		String attndTp=null;
		if("입실".equals(attnd)) {
			attndTp = "at001";
			if(timeStr.compareTo(map.get("STRTTM")) > 0) {
				attndTp = "at002";
			}
		}else {
			attndTp = "at004";
			if(timeStr.compareTo(map.get("ENDTM")) < 0) {
				attndTp = "at003";
			}
		}
		
		System.out.println(attndTp);
		System.out.println(map.get("STDTNO"));
		System.out.println(map.get("STRTTM"));
		System.out.println(clss);
		ATTNDDto attndDto = new ATTNDDto(date.format(today), time.format(today), attndTp, clss, map.get("STDTNO"));
		System.out.println(attndDto);
		
		qrCodeDao.qrCodeInsert(attndDto);
		
		
	}
	
}

