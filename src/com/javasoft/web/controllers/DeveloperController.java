package com.javasoft.web.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.javasoft.web.dao.Developer;
import com.javasoft.web.repositories.DeveloperRepository;
import com.javasoft.web.repositories.SkillRepository;

@Controller
public class DeveloperController {
	DeveloperRepository repository;
	SkillRepository skillRepository;
	@RequestMapping("/")
	public String showHome(Model model){
		model.addAttribute("name", "<b>Tiffany</b>");
		return "home";
	}
	@RequestMapping("/developer/{id}")
public String developer(@PathVariable Long id, Model model){
model.addAttribute("developer", repository.findById(id));
	model.addAttribute("skills", skillRepository.findAll());
	return "developer";
}
	@RequestMapping(value="/developers", method=RequestMethod.POST)
	public String developersList(Model model){
		model.addAttribute("developers", repository.findAll());
		
		return "developers";
	}
	@RequestMapping(value="/developers", method=RequestMethod.POST)
	public String developersAdd(@RequestParam String email, @RequestParam String firstName,@RequestParam String lastName, Model model){
		Developer newDeveloper= new Developer();
		newDeveloper.setEmail(email);
		newDeveloper.setFirstName(firstName);
		newDeveloper.setLastName(lastName);
		repository.save(newDeveloper);
	return "redirect:/developer/"+newDeveloper.getId();
		
	}
	@RequestMapping(value="/developer/{id}/skills", method=RequestMethod.POST)
	public String developerAddSkill(@PathVariable Long id, @RequestParam Long skillId, Model model){
		
		return "redirect:/developers";
	}
	
	
}
