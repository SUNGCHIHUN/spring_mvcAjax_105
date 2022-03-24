package com.spring.ajax_105.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.ajax_105.dto.SearchDTO;

@Repository
public class SearchDAOImpl implements SearchDAO {

	@Autowired
	SqlSession sqlSession;
	
	@Override // 게시글 조회
	public List<SearchDTO> searchList(String keyword) {
		System.out.println("searchList() - dao");
		return sqlSession.getMapper(SearchDAO.class).searchList(keyword);
	}
}