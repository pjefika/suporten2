package vraptor_suporten2.model.entities;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="SUPORTEN2_REDE")
public class Rede implements EntityCrudInterface, Comparable<Rede>{
	
	@Id
	@GeneratedValue
	private Integer id;
	
	@NotEmpty(message="Campo obrigatório!")
	private String nome;
	
	private Boolean ativo;
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy="rede", cascade=CascadeType.REFRESH)
	private List<MacroMotivo> macroMotivos;

	public Rede() {
	}
	
	public Rede(Integer id) {
		this.id = id;
	}
	
	public Rede(String nome) {
		this.nome = nome;
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
	
	public List<MacroMotivo> getMacroMotivos() {
		return macroMotivos;
	}
	
	public List<MacroMotivo> getMacroMotivosAtivos() {
		
		List<MacroMotivo> lista = new ArrayList<MacroMotivo>();
				
		for (MacroMotivo macro : this.macroMotivos) {
			if(macro.getAtivo() && !lista.contains(macro)){
				lista.add(macro);
			}
		}
		
		Collections.sort(lista);
		
		return lista;
	}

	public void setMacroMotivos(List<MacroMotivo> macroMotivos) {
		this.macroMotivos = macroMotivos;
	}

	@Override
	public int compareTo(Rede o) {
		return this.getNome().compareToIgnoreCase(o.getNome());
	}

}
