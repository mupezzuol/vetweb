package com.vetweb.service;

import org.apache.commons.mail.Email;
import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vetweb.dao.ProprietarioDAO;
import com.vetweb.model.Pessoa;
import com.vetweb.model.Proprietario;

@Service
public class EmailService {
	
	@Autowired
	private ProprietarioDAO proprietarioDAO;
	
	private static final Logger LOGGER = Logger.getLogger(EmailService.class);
	
	public void enviar(Pessoa destinatario, String msg, String subject) {
		try {
			Proprietario prop = proprietarioDAO.buscarPorNome(destinatario.getNome());
			if (prop.isAceitaNotificacoes()) {
				Email email = new SimpleEmail();
				email.setHostName("smtp.gmail.com");
				email.setSmtpPort(465);
				email.setAuthenticator(new DefaultAuthenticator("tecnologiaamr@gmail.com", "amr@2018"));
				email.setSSLOnConnect(true);
				email.setFrom("tecnologiaamr@gmail.com");
				email.setSubject(subject);
				email.setMsg(msg);
				email.addTo(destinatario.getContato().getEmail());
				email.send();
				LOGGER.info("E-mail enviado para o cliente "+prop.getNome()+" com sucesso!");
			}else {
				LOGGER.info("Cliente "+prop.getNome()+" NÃO aceita notificação por e-mail!");
			}
		} catch (EmailException emailException) {
			emailException.printStackTrace();
		}
	}
	
}
