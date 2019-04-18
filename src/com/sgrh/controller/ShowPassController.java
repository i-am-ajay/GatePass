package com.sgrh.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ShowPassController {
	@GetMapping("/pass/${pass_no}")
	public String showGatePass(@PathVariable int passNo) {
		return "show_pass";
	}
}
