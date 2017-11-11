package com.javasoft.web.repositories;

import org.springframework.data.repository.CrudRepository;

import com.javasoft.web.dao.Developer;

public interface DeveloperRepository extends CrudRepository<Developer, Long> {

}
