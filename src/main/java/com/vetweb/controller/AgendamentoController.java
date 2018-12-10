package com.vetweb.controller;

import static com.vetweb.model.pojo.TipoOcorrenciaProntuario.ATENDIMENTO;
import static com.vetweb.model.pojo.TipoOcorrenciaProntuario.EXAME;
import static com.vetweb.model.pojo.TipoOcorrenciaProntuario.VACINA;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.transaction.Transactional;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.vetweb.dao.AgendamentoDAO;
import com.vetweb.dao.AnimalDAO;
import com.vetweb.dao.AtendimentoDAO;
import com.vetweb.dao.ExameDAO;
import com.vetweb.dao.ProntuarioDAO;
import com.vetweb.dao.ProprietarioDAO;
import com.vetweb.model.Agendamento;
import com.vetweb.model.Animal;
import com.vetweb.model.Exame;
import com.vetweb.model.OcorrenciaFactory;
import com.vetweb.model.Prontuario;
import com.vetweb.model.Proprietario;
import com.vetweb.model.TipoDeAtendimento;
import com.vetweb.model.Vacina;
import com.vetweb.model.pojo.EventFullCalendar;
import com.vetweb.model.pojo.OcorrenciaProntuario;
import com.vetweb.model.pojo.TipoOcorrenciaProntuario;

@Controller
@Transactional
@RequestMapping("/agendamento")
public class AgendamentoController {
	
	private static final Logger LOGGER = Logger.getLogger(AgendamentoController.class);
	
	@Autowired
	private AtendimentoDAO atendimentoDAO;
	
	@Autowired
	private ProntuarioDAO prontuarioDAO;
	
	@Autowired
	private ProprietarioDAO proprietarioDAO;
	
	@Autowired
	private AnimalDAO animalDAO;
	
	@Autowired
	private AgendamentoDAO agendamentoDAO;
	
	@Autowired
	private OcorrenciaFactory ocorrenciaFactory;
	
	@Autowired
	private ExameDAO exameDAO;
	
	@GetMapping
	public ModelAndView agenda() {
		ModelAndView modelAndView = new ModelAndView("agendamento/agendamento");
		addDependenciasParaNovoEvento(modelAndView);
		return modelAndView;
	}

	private void addDependenciasParaNovoEvento(ModelAndView modelAndView) {
		List<Proprietario> clientesParaSelecionar = proprietarioDAO.listarTodos();
		modelAndView.addObject("todosOsClientes", clientesParaSelecionar);
		List<TipoDeAtendimento> tiposDeAtendimentoDisponiveis = atendimentoDAO.buscarTiposDeAtendimento().stream().filter(ta -> ta.isStatus()).collect(Collectors.toList());
		modelAndView.addObject("tiposDeAtendimento", tiposDeAtendimentoDisponiveis);
		List<Vacina> vacinasDisponiveis = prontuarioDAO.buscarVacinas().stream().filter(vac -> vac.isStatus()).collect(Collectors.toList());
		modelAndView.addObject("todasAsVacinas", vacinasDisponiveis);
		List<Exame> examesDisponiveis = exameDAO.listarTodos().stream().filter(ex -> ex.isAtivo()).collect(Collectors.toList());
		modelAndView.addObject("exames", examesDisponiveis);
	}
	
	@ResponseBody
	@RequestMapping("/eventos")
	public List<EventFullCalendar> todosOsEventos(@RequestParam(value = "start", required = false) String start, @RequestParam(value = "end", required = false) String end) {
		LOGGER.debug("Recebendo data inicial " + start + " e final " + end + " para exibição dos eventos");
		if (start == null) {
			start = LocalDateTime.MIN.format(DateTimeFormatter.ISO_DATE);
		}
		if (end == null) {
			end = LocalDateTime.MAX.format(DateTimeFormatter.ISO_DATE);
		}
		LocalDate dataInicialFiltro = LocalDate.parse(start, DateTimeFormatter.ISO_DATE);
		LocalDate dataFinalFiltro = LocalDate.parse(end, DateTimeFormatter.ISO_DATE);
		List<EventFullCalendar> events = new ArrayList<>();
		List<Agendamento> agendamentos = agendamentoDAO.listarTodos();
		addEvents(dataInicialFiltro, dataFinalFiltro, events);
		addScheduledEvents(events, agendamentos);
		return events;
	}

	private void addScheduledEvents(List<EventFullCalendar> events, List<Agendamento> agendamentos) {
		agendamentos
			.stream()
			.filter(ag -> ag.getDataHoraFinal().isAfter(LocalDateTime.now()))
			.forEach(ag -> {
				EventFullCalendar event = new EventFullCalendar();
				event.setId(String.valueOf(ag.getOcorrencia().getOcorrenciaId()));
				event.setTitle(ag.getOcorrencia().getDescricao());
				event.setStart(DateTimeFormatter.ISO_DATE_TIME.format(ag.getDataHoraInicial()));
				event.setEnd(DateTimeFormatter.ISO_DATE_TIME.format(ag.getDataHoraFinal()));
				event.setType(ag.getOcorrencia().getTipo().name());
				event.setColor("#ccffcc");
				events.add(event);
			});
	}
	
	private boolean isScheduled(Long ocorrenciaId) {
		return agendamentoDAO.buscarPorIdOcorrencia(ocorrenciaId) != null;
	}

	private void addEvents(LocalDate dataInicialFiltro, LocalDate dataFinalFiltro,
			List<EventFullCalendar> events) {
		DateTimeFormatter formatter = DateTimeFormatter.ISO_DATE_TIME;
		prontuarioDAO
			.buscarTodasOcorrenciasVacina()
			.stream()
			.filter(ocorrenciaVacina -> !isScheduled(ocorrenciaVacina.getOcorrenciaId()))
			.filter(ocorrenciaVacina -> aplicarFiltroDeData(dataInicialFiltro, dataFinalFiltro, ocorrenciaVacina))
			.filter(ocorrenciaVacina -> {
				return possuiAgendamentoVigente(ocorrenciaVacina);
			})
			.forEach(ocorrenciaVacina -> {
				EventFullCalendar event = new EventFullCalendar();
				event.setId(String.valueOf(ocorrenciaVacina.getOcorrenciaId()));
				event.setTitle(ocorrenciaVacina.getDescricao());
				event.setStart(formatter.format(ocorrenciaVacina.getData()));
				event.setEnd(formatter.format(ocorrenciaVacina.getData().plusMinutes(30)));
				event.setType(ocorrenciaVacina.getTipo().name());
				event.setColor("#fff0b3");
				events.add(event);
			});
		atendimentoDAO
			.listarTodos()
			.stream()
			.filter(atendimento -> !isScheduled(atendimento.getOcorrenciaId()))
			.filter(atendimento -> aplicarFiltroDeData(dataInicialFiltro, dataFinalFiltro, atendimento))
			.filter(atendimento -> {
				return possuiAgendamentoVigente(atendimento);
			})
			.forEach(atendimento -> {
				EventFullCalendar event = new EventFullCalendar();
				event.setId(String.valueOf(atendimento.getOcorrenciaId()));
				event.setTitle(atendimento.getTipoDeAtendimento().getNome());
				event.setStart(formatter.format(atendimento.getData()));
				event.setEnd(formatter.format(atendimento.getData().plus(atendimento.getTipoDeAtendimento().getDuracao())));
				event.setType(atendimento.getTipo().name());
				event.setColor("#ccf5ff");
				events.add(event); 
			});
		prontuarioDAO
			.buscarTodasOcorrenciasExame()
			.stream()
			.filter(ocorrenciaExame -> !isScheduled(ocorrenciaExame.getOcorrenciaId()))
			.filter(ocorrenciaExame -> aplicarFiltroDeData(dataInicialFiltro, dataFinalFiltro, ocorrenciaExame))
			.filter(ocorrenciaExame -> {
				return possuiAgendamentoVigente(ocorrenciaExame);
			})
			.forEach(ocorrenciaExame -> {
				EventFullCalendar eventFullCalendar = new EventFullCalendar();
				eventFullCalendar.setId(String.valueOf(ocorrenciaExame.getOcorrenciaId()));
				eventFullCalendar.setTitle(ocorrenciaExame.getExame().getDescricao());
				eventFullCalendar.setStart(formatter.format(ocorrenciaExame.getData()));
				eventFullCalendar.setEnd(formatter.format(ocorrenciaExame.getData().plus(ocorrenciaExame.getExame().getDuracao())));
				eventFullCalendar.setType(ocorrenciaExame.getTipo().name());
				eventFullCalendar.setColor("#BFBFBF");
				events.add(eventFullCalendar);
			});
	}

	private boolean possuiAgendamentoVigente(OcorrenciaProntuario ocorrenciaProntuario) {
		long qtdAgendamentosVigentes = ocorrenciaProntuario.getAgendamentos().stream().filter(ag -> ag.getDataHoraFinal().isAfter(LocalDateTime.now())).count();
		return qtdAgendamentosVigentes == 0;
	}

	private boolean aplicarFiltroDeData(LocalDate dataInicialFiltro, LocalDate dataFinalFiltro,
			OcorrenciaProntuario ocorrenciaProntuario) {
		LocalDate dataDoAtendimento = LocalDate
				.of(ocorrenciaProntuario.getData().getYear(), 
						ocorrenciaProntuario.getData().getMonthValue(), 
						ocorrenciaProntuario.getData().getDayOfMonth());
		return (dataDoAtendimento.isEqual(dataInicialFiltro) || dataDoAtendimento.isAfter(dataInicialFiltro))
				&&
				(dataDoAtendimento.isEqual(dataFinalFiltro) || dataDoAtendimento.isBefore(dataFinalFiltro));
	}
	
	@GetMapping("/ocorrencia/{type}/{id}")
	public ModelAndView buscarOcorrencia(@PathVariable("type") String tpOcorrencia, @PathVariable("id") Long idOcorrencia) {
		OcorrenciaProntuario ocorrencia = ocorrenciaFactory.getOcorrencia(tpOcorrencia, idOcorrencia);
		ModelAndView modelAndView = new ModelAndView("forward:/prontuario/prontuarioDoAnimal/" + ocorrencia.getProntuario().getAnimal().getAnimalId());
		return modelAndView;
	}
	
	private void verificaSePossuiAgenda(LocalDateTime dataHoraInicial, LocalDateTime dataHoraFinal) {
		if (agendamentoDAO.possuiAgendaPara(dataHoraInicial, dataHoraFinal)) {
			throw new RuntimeException("AGENDA OCUPADA, REMARQUE A OCORRÊNCIA OU SELECIONE OUTRO HORÁRIO.");
		}
	}		
	
	@PostMapping("/ocorrencia")
	public ModelAndView adicionarOcorrencia(@RequestParam("slcProprietarios") String codigoCliente, 
			@RequestParam("slcAnimal") String animalSelecionado, 
			@RequestParam("tipoOcorrencia") String tipoDeOcorrencia, 
			@RequestParam(value = "slcVacina", required = false) String vacinaSelecionada,
			@RequestParam(value = "slcAtendimento", required = false) String atendimentoSelecionado, 
			@RequestParam(value = "slcExame", required = false) String exameSelecionado, 
			@RequestParam("dataHoraInicial") String dataEHoraInicial, 
			@RequestParam("dataHoraFinal") String dataEHoraFinal,
			RedirectAttributes redirectAttributes) {
		Animal animal = animalDAO.buscarPorId(Long.parseLong(animalSelecionado));
		Prontuario prontuario = animal.getProntuario();
		ModelAndView modelAndView = new ModelAndView("redirect:/prontuario/prontuarioDoAnimal/" + prontuario.getAnimal().getAnimalId());
		LocalDateTime dataHoraInicio = LocalDateTime.parse(dataEHoraInicial, DateTimeFormatter.ISO_DATE_TIME);
		LocalDateTime dataHoraFim = LocalDateTime.parse(dataEHoraFinal, DateTimeFormatter.ISO_DATE_TIME);
		try {
			verificaSePossuiAgenda(dataHoraInicio, dataHoraFim);
		} catch (RuntimeException exception) {
        	redirectAttributes.addFlashAttribute("agendaOcupada"
        			, "DATA/HORÁRIO SELECIONADOS ESTÃO OCUPADOS POR OUTRA OCORRÊNCIA, REMARQUE OU SELECIONE UM OUTRO MOMENTO.");
        	return modelAndView;
		}
		TipoOcorrenciaProntuario tipoOcorrencia = TipoOcorrenciaProntuario.valueOf(tipoDeOcorrencia);
		Agendamento agendamento = new Agendamento();
		String opcaoDescritivo = tipoOcorrencia == VACINA? vacinaSelecionada : tipoOcorrencia == ATENDIMENTO? 
				atendimentoSelecionado : tipoOcorrencia == EXAME? exameSelecionado : null;
		try {
			OcorrenciaProntuario ocorrenciaProntuario = ocorrenciaFactory.criarOcorrencia(opcaoDescritivo, dataHoraInicio, tipoOcorrencia, prontuario);
			agendamento.setOcorrencia(ocorrenciaProntuario);
			agendamento.setDataHoraInicial(dataHoraInicio);
			agendamento.setDataHoraFinal(dataHoraFim);
			agendamento.setTipo(tipoOcorrencia);
			agendamentoDAO.salvar(agendamento);
		} catch (Exception exception) {
			modelAndView = new ModelAndView("redirect:/clientes/financeiro/" + animal.getProprietario().getPessoaId());
		}
		return modelAndView;
	}

}