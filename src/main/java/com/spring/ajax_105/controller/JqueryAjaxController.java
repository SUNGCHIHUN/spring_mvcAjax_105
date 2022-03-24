package com.spring.ajax_105.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.ajax_105.dto.ProductDTO;
import com.spring.ajax_105.service.SearchService;

@Controller
public class JqueryAjaxController {
	
	private static Logger logger = LoggerFactory.getLogger(JqueryAjaxController.class);
	
	@Autowired
	private SearchService service;
	
	// dataType이 text인 경우
	@RequestMapping("basic1.ja")
	public String basic1() {
		logger.info("url ==> basic1.ja");
		return "json/basic1";
	}

	@RequestMapping("basic1_next.ja")
	public String basic1_next() {
		logger.info("url ==> basic1_next.ja");
		return "json/basic1_next";
	}
	@RequestMapping("basic2.ja")
	public String basic2() {
		logger.info("url ==> basic2.ja");
		return "json/basic2";
	}
	
	@RequestMapping("basic2_next.ja")
	public String basic2_next() {
		logger.info("url ==> basic2_next.ja");
		return "json/basic2_next";
	}

	@RequestMapping("basic3.ja")
	public String basic3() {
		logger.info("url ==> basic3.ja");
		return "json/basic3";
	}
	
	@RequestMapping("basic4.ja")
	public String basic4() {
		logger.info("url ==> basic4.ja");
		
		return "json/basic4";
	}

	@RequestMapping("basic5.ja")
	public String basic5_next() {
		logger.info("url ==> basic5.ja");
		return "json/basic5";
	}
	
	// JSON Converter = json-simple + jackson-databind
	// json-simple 1.1.1
	// jackson-databind 두개의 라이브러리를 pom.xml을 통해 다운
	// import org.sjon.simple.JSONObject;
	// import org.sjon.simple.parser.JSONParser;
	// import org.sjon.simple.parser.ParseException;
	@RequestMapping("basic5_next.ja")
	public String basic5(HttpServletRequest req,  Model model) {
		logger.info("url ==> basic5_next.ja");

		String jsonInfo = req.getParameter("jsonInfo");
		
		JSONParser jsonParser = new JSONParser();

		try {
			JSONObject jsonObject = (JSONObject)jsonParser.parse(jsonInfo);
			System.out.println("-- 회원정보 --");
			
			System.out.println("이름 : " + jsonObject.get("name"));
			System.out.println("이름 : " + jsonObject.get("tel"));
			System.out.println("이름 : " + jsonObject.get("address"));
			System.out.println("이름 : " + jsonObject.get("email"));
			
			req.setAttribute("name", (String)jsonObject.get("name"));
			req.setAttribute("tel", (String)jsonObject.get("tel"));
			req.setAttribute("address", (String)jsonObject.get("address"));
			req.setAttribute("email", (String)jsonObject.get("email"));
			
		} catch(ParseException e) {
			e.printStackTrace();
		}

		return "json/basic5_next";
	}
	
	// 검색 --------------------------------------------------------------------
	
	@RequestMapping("search.ja")
	public String search() {
		logger.info("url ==> search.ja");
		return "query/search";
	}
	
	@RequestMapping("search_next.ja")
	public String search_next(HttpServletRequest req, Model model) {
		logger.info("url ==> search_next.ja");
		service.searchList(req, model);
		return "query/search_next";
	}
	
	// --------------------------------------------------------------------------
	/*
	 * url이 아닌 데이터값을 넘길때는 @ResponseBody를 추가한다.
	 * pom.xml에 jackson-databind(2.9이상)가 필수적으로 등록되어 있어야 한다.
	 * 라이브러리가 추가되어 있지 않을 경우와 
	 * 스프링버전, 자바버전 기본 설정을 안한 경우 => HTTP status 406 - Not Acceptable
	 */
	
	@RequestMapping("product.ja")
	public @ResponseBody ProductDTO product() {
		logger.info("url ==> product.ja");
		ProductDTO dto = new ProductDTO(1, "LG Gram", 2000000);
		return dto; // 출력 결과는 json 타입으로 보내진다.
		// {"product_no" : 1, "product_name" : "LG Gram", "product_price" : 2000000}
	}
	
	@RequestMapping("basic6.ja")
	public String basic6() {
		logger.info("url ==> basic6.ja");
		return "json/basic6";
	}
	
	@RequestMapping(value="basic6_next.ja", produces = "application/text; charset=utf8")
	public @ResponseBody String basic6_next(@RequestBody Map<String, Object> map) {
		logger.info("url ==> basic6_next.ja");
		
		String id = map.get("id").toString();  // hong
		String password = map.get("password").toString(); // password
		String name = map.get("name").toString(); // name

		System.out.println("id : " + id);
		System.out.println("password : " + password);
		System.out.println("name : " + name);
		
		return id + ", " + password + ", " + name;		
	}
	
	@RequestMapping("basic7.ja")
	public String basic7() {
		logger.info("url ==> basic7");
		return "json/basic7";
	}
	
	@RequestMapping(value="basic7_next.ja", produces = "application/text; charset=UTF-8")
	public @ResponseBody String basic7_next(HttpServletRequest req) {
		logger.info("url ==> basic7_next.ja");
		
		String mode = req.getParameter("mode"); // happy
		mode += " 홍길동";
		
		System.out.println("mode : " + mode); // happy hong-gildong
		
		return mode;
	}
}