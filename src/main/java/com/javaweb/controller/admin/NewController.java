package com.javaweb.controller.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.javaweb.dto.NewDTO;
import com.javaweb.service.ICategoryService;
import com.javaweb.service.INewService;
import com.javaweb.util.MessageUtil;

@Controller(value = "newCtrlOfAdmin")
public class NewController {
	
	@Autowired
	private INewService newService;
	
	@Autowired
	private ICategoryService categoryService;
	
	@Autowired
	private MessageUtil messageUtil;
	
	@RequestMapping(value = "/admin-new/list", method = RequestMethod.GET)
	public ModelAndView showlist(@RequestParam("page") int page, @RequestParam("limit") int limit, HttpServletRequest request) {
		NewDTO mdel = new NewDTO();
		mdel.setPage(page);
		mdel.setLimit(limit);
		ModelAndView mav = new ModelAndView("admin/new/list");            //chi dinh view se hien thi, folder goc mac dinh la WEB-INF/views																
		Pageable pageable = new PageRequest(page-1, limit);					//khai bao trong dispatcher-servlet
		mdel.setListResult(newService.readAll(pageable));
		mdel.setTotalItem(newService.getTotalItem());
		mdel.setTotalPage((int) Math.ceil((double) mdel.getTotalItem() / mdel.getLimit()));
		if(request.getParameter("message") != null) {
			Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}
		mav.addObject("model", mdel);
		return mav;														
	}
	
	@RequestMapping(value = "/admin-new/edit", method = RequestMethod.GET)
	public ModelAndView editnew(@RequestParam(value = "id", required = false) Long id, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/new/edit");
		NewDTO mdel = new NewDTO();
		if(id != null) {
			mdel = newService.findById(id);
		}
		if(request.getParameter("message") != null) {
			Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}
		mav.addObject("categories", categoryService.readAll());
		mav.addObject("model", mdel);
		return mav;
	}
	

	
}
