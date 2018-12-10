package com.vetweb.jms;

import javax.annotation.PostConstruct;
import javax.jms.ConnectionFactory;
import javax.jms.JMSException;
import javax.jms.ObjectMessage;
import javax.jms.Session;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;
import org.springframework.stereotype.Component;

import com.vetweb.model.Prontuario;
import com.vetweb.model.pojo.OcorrenciaProntuario;
import com.vetweb.service.EmailService;

@Component
public class JMSNotificacaoOcorrenciaCliente {

	@Autowired
	private ConnectionFactory connectionFactory;
	
	@Autowired
	private EmailService emailService;
	
	private JmsTemplate jmsTemplate;
	
	private static final String QUEUE = "notifica_ocorrencia_cliente";
	
	private static final Logger LOGGER = Logger.getLogger(JMSNotificacaoOcorrenciaCliente.class);
	
	@PostConstruct
	public void construct() {
		this.jmsTemplate = new JmsTemplate(connectionFactory);
	}
	
	public void sendNotification(String queue, OcorrenciaProntuario ocorrenciaProntuario) {
		jmsTemplate.send(queue, new MessageCreator() {
			@Override
			public ObjectMessage createMessage(Session session) throws JMSException {
				return session.createObjectMessage(ocorrenciaProntuario);
			}
		});
	}
	
	public void receive() {
		ObjectMessage objectMessage = (ObjectMessage)jmsTemplate.receive(QUEUE);
		try {
			OcorrenciaProntuario ocorrenciaProntuario = (OcorrenciaProntuario)objectMessage.getObject();
			Prontuario prontuario = ocorrenciaProntuario.getProntuario();
			emailService.enviar(prontuario.getAnimal().getProprietario(),
	        		"Foi feita uma nova inclusao de " + ocorrenciaProntuario
	        		+ " ao prontuario do seu animal " + prontuario.getAnimal().getNome() + "",
	        		"Inclusão de " + ocorrenciaProntuario + "");			
		} catch (JMSException | ClassCastException e) {
			LOGGER.error("NÃO FOI POSSÍVEL REALIZAR A NOTIFICAÇÃO, VERIFIQUE SE HÁ E-MAILS NÃO ENVIADOS NA FILA E OS PARÂMETROS DE ENVIO. " + e);			
		}
	}

}