package com.javasoft.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javasoft.web.dao.Developer;
import com.javasoft.web.dao.DeveloperDao;

@Service("developerService")
public class DeveloperService {
	private DeveloperDao developerDao;
	
	@Autowired
	public void setDeveloperDao(DeveloperDao developerDao){
		this.developerDao=developerDao;
	}
	
	public List<Developer>getCurrent(){
		return developerDao.getDevelopers();
	}
	public void create(Developer developer){
		developerDao.create(developer);
	}
	

}
