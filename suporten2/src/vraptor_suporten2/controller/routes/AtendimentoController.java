package vraptor_suporten2.controller.routes;

import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.faces.bean.RequestScoped;
import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.validator.SimpleMessage;
import br.com.caelum.vraptor.view.Results;
import vraptor_suporten2.controller.auth.SessionUsuarioEfika;
import vraptor_suporten2.dal.AtendimentoDAO;
import vraptor_suporten2.dal.RedeDAO;
import vraptor_suporten2.model.annotation.Admin;
import vraptor_suporten2.model.annotation.Logado;
import vraptor_suporten2.model.entities.Atendimento;

@Controller
@RequestScoped
public class AtendimentoController extends AbstractCrudController {
    
    @Inject
    private AtendimentoDAO dao;
    
    @Inject
    private RedeDAO redeDao;
    
    @Inject
    private SessionUsuarioEfika session;
    
    @Inject
    private Atendimento atn;
    
    public AtendimentoController() {
        
    }
    
    public AtendimentoController(Atendimento atn) {
        this.atn = atn;
    }
    
    @Admin
    public List<Atendimento> list() {
        return dao.listar();
    }
    
    @Logado
    @Path("/atendimento/")
    public void create() {
        result.include("atendimento", this.atn);
        result.include("redeList", redeDao.listar());
    }
    
    @Logado
    public void add(Atendimento a) {
        
        a.setLoginRegistro(session.getUsuario().getLogin());
        a.setDataRegistro(new Date());
        
        this.atn = a;
        
        if (a.getLoginOperador() == null) {
            validation.add(new SimpleMessage("a.loginOperador", "Campo requerido!"));
        } else {

//			Pattern pattern;
//			Matcher matcher;
//
//			pattern = Pattern.compile("(\\w{1})\\d{7}");
//			matcher = pattern.matcher(a.getLoginOperador());
//
//			if(!matcher.matches()){
//				validation.add(new SimpleMessage("a.loginOperador", "Utilize o formato: G0042204/A0042204!"));
//			}
        }
        
        if (a.getTipoAtividade() == null) {            
            validation.add(new SimpleMessage("a.tipoAtividade", "Campo requerido!"));            
        }
        
        if (a.getTerminal() == null) {
            validation.add(new SimpleMessage("a.terminal", "Campo requerido!"));
        }        
        
        if (a.getSolucao().getId() == null) {
            validation.add(new SimpleMessage("a.solucao.id", "Campo requerido!"));
        }        
        
        validation.onErrorForwardTo(AtendimentoController.class).create();
        
        try {
            dao.cadastrar(a);
            this.atn = null;
            result.include("mensagem", a.getClass().getSimpleName() + " cadastrado com sucesso!");
            result.use(Results.logic()).redirectTo(this.getClass()).create();
        } catch (Exception e) {
            result.include("mensagemFalha", "Falha ao cadastrar " + a.getClass().getSimpleName() + "!");
            result.use(Results.logic()).redirectTo(this.getClass()).create();
        }
    }
}
