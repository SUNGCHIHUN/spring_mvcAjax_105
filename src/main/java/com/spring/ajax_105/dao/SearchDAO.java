package com.spring.ajax_105.dao;

import java.util.List;

import com.spring.ajax_105.dto.SearchDTO;

public interface SearchDAO {
	List<SearchDTO> searchList(String keyword);
	
}