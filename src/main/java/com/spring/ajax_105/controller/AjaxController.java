package com.spring.ajax_105.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AjaxController {

	private static final Logger logger = LoggerFactory.getLogger(AjaxController.class);
	
	@RequestMapping("simple.do")
	public String simple() {
		logger.info("[url ==> /simple.do]");
		
		return "basic/simple";
	}
	
	// news ------------------------------------------------------------
	// 1.
	@RequestMapping("responseNews.do")
	public String responseNews() {
		logger.info("[url ==> /news1.do]");
		return "news/responseNews";
	}
	
	// 5-1./news1.do
	@RequestMapping("news1.do")
	public String news1() {
		logger.info("[url ==> /news1.do]");
		return "news/news1";
	}
	
	// 5-2./news2.do
	@RequestMapping("news2.do")
	public String news2() {
		logger.info("[url ==> /news2.do]");
		return "news/news2";
	}
	
	// 5-3./news3.do
	@RequestMapping("news3.do")
	public String news3() {
		logger.info("[url ==> /news3.do]");
		return "news/news3";
	}
	
	// ---------------------------------------------------------------------
	// 1. bookInfo
	@RequestMapping("responseBook.do")
	public String responseBook() {
		logger.info("[url ==> /response.do");
		return "book/responseBook";
	}
	
	// 1-2. book
	@RequestMapping("bookInfo.do")
	public String bookInfo() {
		logger.info("[url ==> /bookInfo.do]");
		return "book/bookInfo";
	}
	
}