package com.javaweb.api.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.javaweb.dto.NewDTO;
import com.javaweb.service.INewService;

@RestController(value = "newAPIOAdmin")
public class NewAPI {
	
	@Autowired
	private INewService newService;

	@PostMapping("/api-admin-new")
	public NewDTO createNew(@RequestBody NewDTO newDTO) {
		return newService.save(newDTO);
	}
	
	@PutMapping("/api-admin-new")
	public NewDTO updateNew(@RequestBody NewDTO updateNew) {
		return newService.save(updateNew);
	}
	
	@DeleteMapping("/api-admin-new")
	public void deleteNew(@RequestBody long[] ids) {
		newService.delete(ids);
	}
}
