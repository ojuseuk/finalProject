package com.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.dto.CRSDto;
import com.project.dto.ClssInfoDto;
import com.project.service.SchLfService;

@Controller
public class SchLfController {

	@Autowired
	private SchLfService schLfService;
	
	@RequestMapping("viewResist")
	public String selectByCrs(Model model){
		model.addAttribute("sbjt", schLfService.selectBySbjt());
		model.addAttribute("crs", schLfService.selectByCrs());
		return "schLf/resistClssView";
	}
	
	@RequestMapping("selectCrsPerSbjt")
	public @ResponseBody List<CRSDto> selectCrsPerSbjt(@RequestParam("sbjtNm") String sbjtNm){
		if(sbjtNm.equals("과목선택")){
			return schLfService.selectByCrs();
		}
		return schLfService.selectCrsPerSbjt(sbjtNm);
	}
	
	@RequestMapping("selectClssPerCrs")
	public @ResponseBody List<ClssInfoDto> selectClssPerCrs(@RequestParam("crsId") String crsId){
		return schLfService.selectClssPerCrs(crsId);
	}
	
}
