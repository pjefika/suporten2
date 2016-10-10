package vraptor_suporten2.controller.routes;

import java.util.List;

import javax.faces.bean.RequestScoped;
import javax.inject.Inject;
import javax.validation.Valid;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.validator.SimpleMessage;
import br.com.caelum.vraptor.view.Results;
import vraptor_suporten2.dal.MotivoDAO;
import vraptor_suporten2.dal.SolucaoDAO;
import vraptor_suporten2.model.annotation.Admin;
import vraptor_suporten2.model.entities.Solucao;

@Controller
@RequestScoped
public class SolucaoController extends AbstractCrudController implements EntityCrudControllerInterface{

	@Inject
	private SolucaoDAO dao;
	
	@Inject
	private MotivoDAO motivoDao;

	public SolucaoController() {

	}

	@Admin
	public void create() {
		result.include("motivoList", motivoDao.listar());
	}

	@Admin
	@Path("/solucao")
	public List<Solucao> list() {
		return dao.listar();
	}

	@Admin
	public void add(@Valid Solucao s) {
		
		if(s.getMotivo().getId() == null){
			validation.add(new SimpleMessage("s.motivo.id", "Campo requerido!"));
		}
		validation.onErrorForwardTo(this).create();

		try {
			
			if((Solucao) dao.buscarPorNome(s) == null){
				
				if(s.getAtivo() == null){
					s.setAtivo(false);
				}
				
				dao.cadastrar(s);
				result.include("mensagem", s.getClass().getSimpleName() + " adicionada com sucesso!");
				result.use(Results.logic()).redirectTo(this.getClass()).list();
				
			}else{
				result.include("mensagemFalha", s.getClass().getSimpleName() + ": " + s.getNome() + " já existente!");
				result.forwardTo(this).create();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	@Admin
	public void delete(Integer id) {
		
		Solucao m = new Solucao();
		m.setId(id);
		Solucao solucao = (Solucao) dao.buscarPorId(m);
		
		if(solucao != null){
			
			try {
				dao.excluir(solucao);
				result.include("mensagem", solucao.getClass().getSimpleName() + " " + solucao.getNome() + " excluído.");
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
	@Path("/solucao/edit/{id}")
	public Solucao edit(Integer id) {	
				
		Solucao m = new Solucao();
		m.setId(id);
		
		Solucao s = (Solucao) dao.buscarPorId(m);
		
		result.include("motivoList", motivoDao.listar());
		
		if(s == null){
			result.include("mensagemFalha", m.getClass().getSimpleName() + " inexistente!");
		}
	
		return s;
	}
	
	
	@Admin
	public void update(@Valid Solucao s) {

		if(s.getMotivo().getId() == null){
			validation.add(new SimpleMessage("s.motivo.id", "Campo requerido!"));
		}
		validation.onErrorForwardTo(this).create();
		
		Solucao md = (Solucao) dao.buscarPorId(s);

		try {

			if(md != null && md.getId() == s.getId()){
				
				dao.editar(s);
				result.include("mensagem", "Alterações realizadas com sucesso!");
				result.use(Results.logic()).redirectTo(this.getClass()).list();
				
			}else{
				
				result.include("mensagemFalha", "Falha ao alterar " + s.getClass().getSimpleName() + ".");
				result.use(Results.logic()).forwardTo(this.getClass()).edit(s.getId());
				
			}
				
		} catch (Exception e) {
			result.include("mensagemFalha", "Falha ao alterar " + s.getClass().getSimpleName() + ".");
			result.use(Results.logic()).forwardTo(this.getClass()).edit(s.getId());
		}
	}	
	
}
