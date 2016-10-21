package vraptor_suporten2.controller.routes;

import java.util.List;

import javax.faces.bean.RequestScoped;
import javax.inject.Inject;
import javax.validation.Valid;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.validator.SimpleMessage;
import br.com.caelum.vraptor.view.Results;
import vraptor_suporten2.dal.MacroMotivoDAO;
import vraptor_suporten2.dal.RedeDAO;
import vraptor_suporten2.model.annotation.Admin;
import vraptor_suporten2.model.entities.MacroMotivo;

@Controller
@RequestScoped
public class MacroMotivoController extends AbstractCrudController implements EntityCrudControllerInterface{

	@Inject
	private MacroMotivoDAO dao;
	
	@Inject
	private RedeDAO redeDao;

	public MacroMotivoController() {

	}

	@Admin
	public void create() {
		result.include("redeList", redeDao.listar());
	}

	@Path("/macroMotivo")
	@Admin
	public List<MacroMotivo> list() {
		return dao.listar();
	}
	
	@Admin
	@Path("/macromotivo/edit/{id}")
	public MacroMotivo edit(Integer id) {		
		
		MacroMotivo m = new MacroMotivo();
		m.setId(id);
		
		MacroMotivo macro = (MacroMotivo) dao.buscarPorId(m);
		
		result.include("redeList", redeDao.listar());
		
		if(macro == null){
			result.include("mensagemFalha", m.getClass().getSimpleName() + " inexistente!");
		}
	
		return macro;
	}
	
	@Admin
	public void delete(Integer id) {		
		
		MacroMotivo m = new MacroMotivo();
		m.setId(id);
		MacroMotivo macro = (MacroMotivo) dao.buscarPorId(m);
		
		if(macro != null){
			
			try {
				dao.excluir(macro);
				result.include("mensagem", macro.getClass().getSimpleName() + " " + macro.getNome() + " excluído.");
			} catch (Exception e) {
				result.include("mensagemFalha", e.getMessage());
			}finally {
				result.use(Results.logic()).redirectTo(this.getClass()).list();
			}
			
		}else{
			result.include("mensagemFalha", m.getClass().getSimpleName() + " inexistente!");
		}
	}	

	@Admin
	public void add(@Valid MacroMotivo m) {
		
		if(m.getRede().getId() == null){
			validation.add(new SimpleMessage("m.rede.id", "Campo requerido!"));
		}
		
		validation.onErrorForwardTo(this).create();

		try {
			
			List<MacroMotivo> lelist = dao.buscarListaPorNome(m);
				
			for (MacroMotivo macroMotivo : lelist) {
				if(macroMotivo.getRede().getId() == m.getRede().getId()){
					result.include("mensagemFalha", m.getClass().getSimpleName() + ": " + m.getNome() + " já existente!");
					result.forwardTo(this).create();
					return;
				}
			}
			
			if(m.getAtivo() == null){
				m.setAtivo(false);
			}
			
			dao.cadastrar(m);
			result.include("mensagem", m.getClass().getSimpleName() + " adicionado com sucesso!");
			result.use(Results.logic()).redirectTo(this.getClass()).list();
				
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Admin
	public void update(@Valid MacroMotivo m) {

		if(m.getRede().getId() == null){
			validation.add(new SimpleMessage("m.rede.id", "Campo requerido!"));
		}
		
		validation.onErrorForwardTo(this).create();
		
		MacroMotivo md = (MacroMotivo) dao.buscarPorId(m);

		try {

			if(md != null && md.getId() == m.getId()){
				
				dao.editar(m);
				result.include("mensagem", "Alterações realizadas com sucesso!");
				result.use(Results.logic()).redirectTo(this.getClass()).list();
				
			}else{
				
				result.include("mensagemFalha", "Falha ao alterar " + m.getClass().getSimpleName() + ".");
				result.use(Results.logic()).forwardTo(this.getClass()).edit(m.getId());
				
			}
				
		} catch (Exception e) {
			result.include("mensagemFalha", "Falha ao alterar " + m.getClass().getSimpleName() + ".");
			result.use(Results.logic()).forwardTo(this.getClass()).edit(m.getId());
		}
	}	
}
