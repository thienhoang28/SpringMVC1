package com.javaweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.javaweb.service.IHomeService;

@Service
public class HomeServiceImpl implements IHomeService{

	@Override
	public List<String> loadMenu() {
		List<String> menus = new ArrayList<>();
		menus.add("Blog Java web");
		menus.add("Huong dan hoc java web");
		menus.add("Lien he");
		menus.add("Thanh toan");
		return menus;
	}
	
}
