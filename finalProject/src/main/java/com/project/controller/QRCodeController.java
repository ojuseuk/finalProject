package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.service.QRCodeService;

@Controller
public class QRCodeController {
	
	@Autowired
	private QRCodeService qrCodeService;
	
	@RequestMapping(value="/qrCode", method=RequestMethod.GET)
	public void qrCode(@RequestParam("phone") String phone, @RequestParam("attnd") String attnd, @RequestParam("clss") String clss) {
		
		System.out.println("Controller qrCode");
		System.out.println(phone);
		System.out.println(attnd);
		System.out.println(clss);
		
		qrCodeService.qrCodeInsert(phone, attnd, clss);
	}
	
}
