package com.vetweb.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_pelagem")
public class Pelagem implements Serializable {
	
	private static final long serialVersionUID = 1L;

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long pelagemId;
    
	@Column(columnDefinition = "TEXT")
    private String descricao;
	
	private String cor;

    public Pelagem() {
    }

    public Pelagem(Long pelagemId, String descricao) {
        this.pelagemId = pelagemId;
        this.descricao = descricao;
    }

    public Long getPelagemId() {
        return pelagemId;
    }

    public void setPelagemId(Long pelagemId) {
        this.pelagemId = pelagemId;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

	public String getCor() {
		return cor;
	}

	public void setCor(String cor) {
		this.cor = cor;
	}
}
