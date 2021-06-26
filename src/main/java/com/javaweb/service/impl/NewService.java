package com.javaweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.javaweb.converter.NewConverter;
import com.javaweb.dto.NewDTO;
import com.javaweb.entity.CategoryEntity;
import com.javaweb.entity.NewEntity;
import com.javaweb.repository.ICategoryRepository;
import com.javaweb.repository.INewRepository;
import com.javaweb.service.INewService;

@Service
public class NewService implements INewService{
	
	@Autowired
	private INewRepository newRepository;
	
	@Autowired
	private ICategoryRepository categoryRepository;
	
	@Autowired
	private NewConverter newConverter;
	

	@Override
	public List<NewDTO> readAll(Pageable pageable) {
		List<NewDTO> newlist = new ArrayList<>();
		List<NewEntity> newentities = newRepository.findAll(pageable).getContent();
		for(NewEntity item : newentities) {
			NewDTO ndt = newConverter.toDto(item);
			newlist.add(ndt);
		}
		return newlist;
	}

	@Override
	public int getTotalItem() {
		return (int)newRepository.count();
	}

	@Override
	public NewDTO findById(Long id) {
		NewEntity entity = newRepository.findOne(id);
		return newConverter.toDto(entity);
	}

	@Override
	@Transactional
	public NewDTO save(NewDTO dto) {
		CategoryEntity category = categoryRepository.findOneByCode(dto.getCategoryCode());
		NewEntity newEntity = new NewEntity();
		if(dto.getId() != null) {
			NewEntity oldNew = newRepository.findOne(dto.getId());
			oldNew.setCategory(category);
			newEntity = newConverter.toEntity(oldNew, dto);
		}
		else {
			newEntity = newConverter.toEntity(dto);
			newEntity.setCategory(category);
		}
		return newConverter.toDto(newRepository.save(newEntity));
	}

	@Override
	@Transactional
	public void delete(long[] ids) {
		for(long id : ids) {
			newRepository.delete(id);
		}
	}

	

	

}
