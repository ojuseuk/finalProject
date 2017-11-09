package com.project.dao;

import java.util.List;
import java.util.Map;

import com.project.dto.STDTDto;

public interface SchLfDao {
	public Map<String, STDTDto> selectByAttnd();
	public List<String> selectBySTDT();
}
