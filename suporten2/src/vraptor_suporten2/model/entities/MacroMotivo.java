package vraptor_suporten2.model.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="SuporteN2_MacroMotivo")
public class MacroMotivo implements EntityCrudInterface{
	
	@Id
	@GeneratedValue
	private Integer id;
	
	@NotEmpty(message="Campo requerido!")
	private String nome;
	
	private Boolean ativo;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@NotNull(message="Campo requerido!")
	private Rede rede;
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy="macroMotivo", cascade=CascadeType.REFRESH)
	private List<Motivo> motivos;
	
	public MacroMotivo() {
		rede = new Rede();
	}
	
	public MacroMotivo(Integer id) {
		this.id = id;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Boolean getAtivo() {
		return ativo;
	}

	public void setAtivo(Boolean ativo) {
		this.ativo = ativo;
	}

	public Rede getRede() {
		return rede;
	}

	public void setRede(Rede rede) {
		this.rede = rede;
	}

	public List<Motivo> getMotivos() {
		return motivos;
	}
	
	public List<Motivo> getMotivosAtivos() {
		
		List<Motivo> lista = new ArrayList<Motivo>();
				
		for (Motivo motivo : this.motivos) {
			if(motivo.getAtivo()){
				lista.add(motivo);
			}
		}
		
		return lista;
	}
	
	public void setMotivos(List<Motivo> motivos) {
		this.motivos = motivos;
	}

}
