package vraptor_suporten2.model.entities;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "SuporteN2_Atendimento")
public class Atendimento {

    @Id
    @GeneratedValue
    private Integer id;

    @ManyToOne(fetch = FetchType.EAGER)
    @NotNull(message = "Campo obrigatório")
    private Solucao solucao;
    
    //@Pattern(regexp = "(\\w{1})\\d{7}", message = "Utilize o formato: G0042204/A0042204")
    @NotEmpty(message = "Campo obrigatório")
    private String loginOperador;

    private String loginGuru;

    @NotNull(message = "Campo obrigatório")
    private String tipoAtividade;

    @NotEmpty(message = "Campo obrigatório")
    private String loginRegistro;

    @NotEmpty(message = "Campo obrigatório")
    private String terminal;

    @Lob
    private String observacao;

    @NotNull
    private Date dataRegistro;

    public Atendimento() {
        solucao = new Solucao();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Solucao getSolucao() {
        return solucao;
    }

    public void setSolucao(Solucao solucao) {
        this.solucao = solucao;
    }

    public String getLoginOperador() {
        return loginOperador;
    }

    public void setLoginOperador(String loginOperador) {
        this.loginOperador = loginOperador;
    }

    public String getLoginRegistro() {
        return loginRegistro;
    }

    public void setLoginRegistro(String loginRegistro) {
        this.loginRegistro = loginRegistro;
    }

    public String getTerminal() {
        return terminal;
    }

    public void setTerminal(String terminal) {
        this.terminal = terminal;
    }

    public String getObservacao() {
        return observacao;
    }

    public void setObservacao(String observacao) {
        this.observacao = observacao;
    }

    public Date getDataRegistro() {
        return dataRegistro;
    }

    public void setDataRegistro(Date dataRegistro) {
        this.dataRegistro = dataRegistro;
    }

    public String getLoginGuru() {
        return loginGuru;
    }

    public void setLoginGuru(String loginGuru) {
        this.loginGuru = loginGuru;
    }

    public String getTipoAtividade() {
        return tipoAtividade;
    }

    public void setTipoAtividade(String tipoAtividade) {
        this.tipoAtividade = tipoAtividade;
    }
    
}
