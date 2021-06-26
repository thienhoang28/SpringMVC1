package com.javaweb.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.javaweb.dto.NewDTO;

public interface INewService {
//	List<NewModel> readNewByCategoryId(Long categoryId);
//	NewModel addNew(NewModel newmodel);
//	NewModel updateNew(NewModel updatNew);
//	void deleteNew(long[] ids);
	List<NewDTO> readAll(Pageable pageable);
	int getTotalItem();
	NewDTO findById(Long id);
	NewDTO save(NewDTO dto);
	void delete(long[] ids);
	
}
