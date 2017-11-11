package com.javasoft.web.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.javasoft.web.dao.Skill;

public interface SkillRepository extends CrudRepository<Skill, Long>{
public List<Skill>findByLabel(String label);
}
