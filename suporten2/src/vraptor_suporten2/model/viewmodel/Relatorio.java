package vraptor_suporten2.model.viewmodel;

import java.util.Date;

import javax.validation.constraints.NotNull;

public class Relatorio {
	
	@NotNull(message="Campo requerido!")
	private Date dataInicio;
	
	@NotNull(message="Campo requerido!")
	private Date dataFinal;
		
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
}
