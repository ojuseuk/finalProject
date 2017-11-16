package com.project.controller;

import java.util.ArrayList;
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
	
	@RequestMapping("viewRegist")
	public String selectByCrs(Model model){
		model.addAttribute("sbjt", schLfService.selectBySbjt());
		model.addAttribute("crs", schLfService.selectByCrs());
		return "schLf/registClssView";
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
	
	@RequestMapping("applyClss")
	public String applyClss(@RequestParam("clssNm") List<String> clssNm, @RequestParam("nm") List<String> nm, 
			@RequestParam("strtDt") List<String> strtDt, @RequestParam("endDt") List<String> endDt, 
			@RequestParam("stdtclssttn") List<String> stdtclssttn, Model model){
		int fee = 0;
		List<ClssInfoDto> list = new ArrayList<>();
		for (int i = 0; i < clssNm.size(); i++) {
			list.add(new ClssInfoDto(nm.get(i), clssNm.get(i), strtDt.get(i), endDt.get(i), stdtclssttn.get(i)));
			fee += Integer.parseInt(stdtclssttn.get(i));
		}
		model.addAttribute("list", list);
		model.addAttribute("fee", fee);
		return "schLf/registListView";
	}
	
}
