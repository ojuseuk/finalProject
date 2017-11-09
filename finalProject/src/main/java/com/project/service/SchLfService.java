package com.project.service;

import java.util.List;
import java.util.Map;

import com.project.dto.STDTDto;

public interface SchLfService {
	public Map<String, STDTDto> selectByAttnd();
	public List<String> selectBySTDT();
}
