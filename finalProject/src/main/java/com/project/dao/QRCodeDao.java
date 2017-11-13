package com.project.dao;

import java.util.HashMap;
import java.util.Map;

import com.project.dto.ATTNDDto;

public interface QRCodeDao {

	void qrCodeInsert(ATTNDDto attndDto);
	HashMap<String, String> qrCodeSelect(Map<String, String> clssPhone);

}
