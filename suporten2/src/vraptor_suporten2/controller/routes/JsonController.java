package vraptor_suporten2.controller.routes;

import java.util.List;

import javax.faces.bean.RequestScoped;
import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.view.Results;
import vraptor_suporten2.dal.AtendimentoDAO;
import vraptor_suporten2.dal.MacroMotivoDAO;
import vraptor_suporten2.dal.MotivoDAO;
import vraptor_suporten2.dal.RedeDAO;
import vraptor_suporten2.model.entities.Atendimento;
import vraptor_suporten2.model.entities.MacroMotivo;
import vraptor_suporten2.model.entities.Motivo;
import vraptor_suporten2.model.entities.Rede;

@Controller
@RequestScoped
public class JsonController extends AbstractCrudController{
	
	@Inject
	private RedeDAO redeDao;
	
	@Inject
	private MacroMotivoDAO macroDao;
	
	@Inject
	private MotivoDAO motivoDao;
	
	@Inject
	private AtendimentoDAO atendimentoDao;
	
	public JsonController() {
	}
	
	@Path("/json/macromotivos/{id}")
    public void loadJsonMacro(Integer id) {
		
		Rede r = (Rede) redeDao.buscarPorId(new Rede(id));
		
		if(r != null){
			result.use(Results.json()).from(r.getMacroMotivosAtivos()).serialize();
		}
    }
	
	@Path("/json/motivos/{id}")
    public void loadJsonMotivo(Integer id) {
		
		MacroMotivo m = (MacroMotivo) macroDao.buscarPorId(new MacroMotivo(id));
		
		if(m != null){
			result.use(Results.json()).from(m.getMotivosAtivos()).serialize();
		}
    }
	
	@Path("/json/solucaos/{id}")
    public void loadJsonSolucao(Integer id) {
		
		Motivo m = (Motivo) motivoDao.buscarPorId(new Motivo(id));
		
		if(m != null){
			result.use(Results.json()).from(m.getSolucaoAtivos()).serialize();
		}
    }
	

	@Path("/json/atendimentos/{terminal}")
	public void loadJsonAtendimento(String terminal) {
		
		Atendimento atendimento = new Atendimento();
		atendimento.setTerminal(terminal);
		List<Atendimento> at = atendimentoDao.listarPorTerminalComLimite(atendimento, 5);
		
		if(at != null){
			result.use(Results.json()).from(at).include("solucao").include("solucao.motivo").include("solucao.motivo.macroMotivo").include("solucao.motivo.macroMotivo.rede").serialize();
		}
    }
}
