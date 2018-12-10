package com.vetweb.scheduled;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Set;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.vetweb.dao.AtendimentoDAO;
import com.vetweb.dao.ProntuarioDAO;
import com.vetweb.dao.ProprietarioDAO;
import com.vetweb.model.OcorrenciaAtendimento;
import com.vetweb.model.Pessoa;
import com.vetweb.model.Proprietario;
import com.vetweb.service.EmailService;

@Component
@Transactional
@EnableScheduling
public class Scheduler {
	
	@Autowired
	private ProprietarioDAO proprietarioDAO;
	
	@Autowired
	private AtendimentoDAO atendimentoDAO;
	
	@Autowired
	private ProntuarioDAO prontuarioDAO; 
	
	@Autowired
	private EmailService emailService;
	
	private static final Logger LOGGER = Logger.getLogger(Scheduler.class);
	
	private static final long MINUTO = 60000;
	
	
    @Scheduled(fixedDelay = MINUTO/4)
    public void verificarClientesEmDebitoDesativar() {
    	LOGGER.info("EXECUTANDO JOB - VERIFICANDO CLIENTES DEVEDORES - DESATIVACAO");
    	List<Proprietario> proprietariosComDebito = proprietarioDAO.buscarClientesEmDebito();
    	proprietariosComDebito
    		.stream()
    		.filter(prop -> prop.isAtivo())
    		.filter(prop -> prop.getAnimais().size() > 0)
    		.peek(prop -> LOGGER.info("INATIVANDO CLIENTE " + prop.getNome()))
    		.forEach(prop ->  {
    			prop.setAtivo(false); 
    			proprietarioDAO.salvar(prop);
    			StringBuilder mensagemRetorno = new StringBuilder();
		    	//Mensagem do e-mail
		    	mensagemRetorno.append("Olá Sr(a) "+prop.getNome()+", tudo bom? "
		    			+ "Nós da clínica VetWeb gostariamos de avisar você possui pendências em nossa clínica, portanto seu usuário está temporariamente BLOQUEADO,"
		    			+ " por gentileza comparecer a nossa clínica.");
		    	emailService.enviar(prop, mensagemRetorno.toString(), "Usuário Bloqueado - Vetweb");
    		});
    	LOGGER.info("FIM DO JOB - VERIFICANDO CLIENTES DEVEDORES - DESATIVACAO");
    }
    
    @Scheduled(fixedDelay = MINUTO/4)
    public void verificarClientesEmDebitoAtivar() {
    	LOGGER.info("EXECUTANDO JOB - VERIFICANDO CLIENTES DEVEDORES - ATIVACAO");
    	Set<Proprietario> proprietariosInativosAdimplentes = proprietarioDAO.buscarClientesInativosAdimplentes();
    	proprietariosInativosAdimplentes
    		.stream()
    		.peek(prop -> LOGGER.info("REATIVANDO CLIENTE " + prop.getNome()))
    		.forEach(prop -> {
    			prop.setAtivo(true); 
    			proprietarioDAO.salvar(prop); 
    			StringBuilder mensagemRetorno = new StringBuilder();
		    	//Mensagem do e-mail
		    	mensagemRetorno.append("Olá Sr(a) "+prop.getNome()+", tudo bom? "
		    			+ "Nós da clínica VetWeb gostariamos de avisar você que o seu usuário foi ATIVADO com sucesso!");
		    	emailService.enviar(prop, mensagemRetorno.toString(), "Usuário Ativado - Vetweb");
    		});
    	LOGGER.info("FIM DO JOB - VERIFICANDO CLIENTES DEVEDORES - ATIVACAO");
    }
    
    
    @Scheduled(fixedDelay = MINUTO)
    public void verificacaoRetornoAtendimento() {
    	LOGGER.info("EXECUTANDO JOB - VERIFICANDO RETORNO DE ATENDIMENTO");
    	
    		atendimentoDAO
    		.listarTodos()
    		.stream()
    		.filter(ate -> 
    			LocalDate.of(ate.getData().getYear(), ate.getData().getMonthValue(), ate.getData().getDayOfMonth())
    			.plus(ate.getTipoDeAtendimento().getFrequencia())
    			.isEqual(LocalDate.now()))
    		.forEach(ate -> this.notificaRetornoAtendimento(ate));
    	LOGGER.info("FIM DO JOB - VERIFICANDO RETORNO DE ATENDIMENTO");
    }
    
    @SuppressWarnings("static-access")
	private void notificaRetornoAtendimento(OcorrenciaAtendimento atendimento) {
    	Pessoa pessoaDestinatario = prontuarioDAO.buscarProntuarioDoAtendimento(atendimento).getAnimal().getProprietario();
    	LocalDateTime dataAtend = atendimento.getData();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
        String dataAtendimento = dataAtend.format(formatter);
         
    	LOGGER.info("ENVIANDO E-MAIL PARA O PROPRIETÁRIO: "+ pessoaDestinatario);
    	
    	//Mensagem do e-mail
    	StringBuilder mensagemRetorno = new StringBuilder();
    	mensagemRetorno.append("Olá Sr(a) "+pessoaDestinatario+", tudo bom? "
    			+ "Nós da clínica VetWeb gostariamos de avisar que o retorno do seu atendimento "
    			+ atendimento.getTipoDeAtendimento().getNome()+" realizado em " +dataAtendimento+
    				" está marcado para data de HOJE. Por gentileza comparecer na clínica ou telefonar para reagendar seu atendimento.");
    	emailService.enviar(pessoaDestinatario, mensagemRetorno.toString(), "Retorno do Atendimento - "+atendimento.getTipoDeAtendimento().getNome()+" - Vetweb");
    	LOGGER.info("E-MAIL ENVIADO COM SUCESSO");
    }
    
}
