package com.vetweb.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name = "tbl_vacina")
@NamedQuery(name = "consultaValorPendenteEmVacinas",
query="SELECT SUM (vacina.preco) FROM Vacina vacina "
    	+ "JOIN vacina.ocorrenciasVacina ocorrenciaVacina "
    	+ "JOIN ocorrenciaVacina.prontuario prontuario "
    	+ "JOIN prontuario.animal animal "
    	+ "JOIN animal.proprietario cliente "
    	+ "WHERE cliente.pessoaId = :codigoCliente "
    	+ "AND ocorrenciaVacina.pago = false")
public class Vacina implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long vacinaId;
	
    private String nome;
    
    private String grupo;
    
    private boolean status;
    
    private String laboratorio;
    
    @OneToMany(mappedBy = "vacina")
    @JsonBackReference
    private List<OcorrenciaVacina> ocorrenciasVacina;
    
    private BigDecimal preco;

    public Vacina(String text) {
        this.nome = text;
    }

    public Vacina(Long vacinaId, String nome, String grupo, boolean status, String laboratorio) {
        this.vacinaId = vacinaId;
        this.nome = nome;
        this.grupo = grupo;
        this.status = status;
        this.laboratorio = laboratorio;
    }

    public Vacina() {
    }
    

    public Long getVacinaId() {
        return vacinaId;
    }

    public void setVacinaId(Long vacinaId) {
        this.vacinaId = vacinaId;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getGrupo() {
        return grupo;
    }

    public void setGrupo(String grupo) {
        this.grupo = grupo;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getLaboratorio() {
        return laboratorio;
    }

    public void setLaboratorio(String laboratorio) {
        this.laboratorio = laboratorio;
    }

	public BigDecimal getPreco() {
		return preco;
	}

	public void setPreco(BigDecimal preco) {
		this.preco = preco;
	}

	public List<OcorrenciaVacina> getOcorrenciasVacina() {
		return ocorrenciasVacina;
	}

	public void setOcorrenciasVacina(List<OcorrenciaVacina> ocorrenciasVacina) {
		this.ocorrenciasVacina = ocorrenciasVacina;
	}
	
}
