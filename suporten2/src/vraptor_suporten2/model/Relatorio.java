package vraptor_suporten2.model;

import java.util.Date;
import java.util.List;

import vraptor_suporten2.model.entities.Atendimento;

public class Relatorio {
	
	private Date dataInicio;
	
	private Date dataFinal;
	
	private List<Atendimento> atendimentos;
	
	public Relatorio() {

	}

	public Date getDataInicio() {
		return dataInicio;
	}

	public void setDataInicio(Date dataInicio) {
		this.dataInicio = dataInicio;
	}

	public Date getDataFinal() {
		return dataFinal;
	}

	public void setDataFinal(Date dataFinal) {
		this.dataFinal = dataFinal;
	}

	public List<Atendimento> getAtendimentos() {
		return atendimentos;
	}

	public void setAtendimentos(List<Atendimento> atendimentos) {
		this.atendimentos = atendimentos;
	}
}
