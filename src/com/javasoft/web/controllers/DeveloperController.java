package com.javasoft.web.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.javasoft.web.dao.Developer;
import com.javasoft.web.service.DeveloperService;

@Controller
public class DeveloperController {
	private DeveloperService developerService;

	@Autowired
	public void setDeveloperService(DeveloperService developerService) {
		this.developerService = developerService;
	}

	@RequestMapping("/")
	public String showHome(Model model) {

		return "home";
	}

	@RequestMapping("/developer/{id}")
	public String developer(@PathVariable Long id, Model model) {
		// model.addAttribute("developer", repository.fi(id));
		// model.addAttribute("skills", skillRepository.findAll());
		return "developer";
	}

	@RequestMapping(value = "/developers", method = RequestMethod.GET)
	public String developersList(Model model) {
		List<Developer> developers = developerService.getCurrent();
		model.addAttribute("developers", developers);
		return "developers";
	}

	@RequestMapping(value = "/developers", method = RequestMethod.POST)
	public String developersAdd(@RequestParam(required=false,name="email")  String email, 
			@RequestParam(required=false,name="firstName")  String firstName, @RequestParam(required=false,name="lastName")  String lastName, Developer developer, BindingResult result) {
		if (result.hasErrors()) {
			return "developers";
		}

		System.out.println("This is the developer: " + developer.getEmail());
		developerService.create(developer);
		return "redirect:/developer/" + developer.getId();
	}

	@RequestMapping(value = "/developer/{id}/skills", method = RequestMethod.POST)
	public String developersAddSkill(@PathVariable Long id, @RequestParam Long skillId, Model model) {
		// Skill skill = skillRepository.findOne(skillId);
		// Developer developer = repository.findOne(id);

		return "redirect:/developers";
	}

}
