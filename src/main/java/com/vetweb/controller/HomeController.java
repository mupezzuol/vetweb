package com.vetweb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.vetweb.dao.AnimalDAO;
import com.vetweb.dao.ConfigDAO;
import com.vetweb.dao.ProprietarioDAO;
import com.vetweb.dao.RelatorioDAO;

@Controller
@SessionAttributes({ "urlClinica" })
public class HomeController {

	@Autowired
	private ProprietarioDAO proprietarioDAO;

	@Autowired
	private AnimalDAO animalDAO;

	@Autowired
	private ConfigDAO configDAO;

	@Autowired
	private RelatorioDAO relatorioDAO;

	@RequestMapping("/")
	public ModelAndView index() {
		ModelAndView modelAndView = new ModelAndView("index");
		modelAndView.addObject("quantidadeClientes", proprietarioDAO.buscarQuantidade());
		modelAndView.addObject("quantidadeAnimais", animalDAO.buscarQuantidade());
		modelAndView.addObject("urlClinica", !configDAO.buscarClinica().isPresent() ? "/config/cadastroClinica"
				: "/config/detalhesClinica/" + configDAO.buscarClinica().get().getRazaoSocial());
		modelAndView.addObject("totalPendente", relatorioDAO.buscarTotalAReceber());
		modelAndView.addObject("clientesDevedores", proprietarioDAO.buscarClientesInativos().stream().count());
		return modelAndView;
	}

	@RequestMapping("/login")
	public String login() {
		return "login/login";
	}

	@RequestMapping("/fail")
	public String failLogin() {
		return "exception/401";
	}
	
	//Tratando o ERRO 404
	@RequestMapping(value = "/error/404", method = RequestMethod.GET)
	public ModelAndView addresses() {
		return new ModelAndView("exception/404");
	}

}
