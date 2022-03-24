package com.spring.ajax_105.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface SearchService {
	public void searchList(HttpServletRequest req, Model model);
	
}