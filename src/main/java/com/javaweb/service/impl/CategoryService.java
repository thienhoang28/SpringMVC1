package com.javaweb.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaweb.entity.CategoryEntity;
import com.javaweb.repository.ICategoryRepository;
import com.javaweb.service.ICategoryService;

@Service
public class CategoryService implements ICategoryService {

	@Autowired
	private ICategoryRepository categoryRepository;
	
	
	@Override
	public Map<String, String> readAll() {
		Map<String, String> results = new HashMap<>();
		List<CategoryEntity> entities = categoryRepository.findAll();
		for(CategoryEntity item : entities) {
			results.put(item.getCode(), item.getName());
		}
		return results;
	}

}
