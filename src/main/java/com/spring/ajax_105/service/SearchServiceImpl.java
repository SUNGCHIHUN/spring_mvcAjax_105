package com.spring.ajax_105.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.ajax_105.dao.SearchDAO;
import com.spring.ajax_105.dto.SearchDTO;

@Service
public class SearchServiceImpl implements SearchService {
	
	@Autowired
	SearchDAO dao;
	
	@Override // 검색결과 조회
	public void searchList(HttpServletRequest req, Model model) {
		
		// 1. 화면으로부터 값을 입력받는다.
		String keyword = req.getParameter("keyword");
		
		// 2. DAO를 생성하여 검색결과를 DB에서 받아온다.
		List<SearchDTO> slist = dao.searchList(keyword);
		
		// 3. 검색결과를 request 객체에 저장한다.
		model.addAttribute("slist", slist);
	}
}