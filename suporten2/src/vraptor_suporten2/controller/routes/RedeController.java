package vraptor_suporten2.controller.routes;

import java.util.List;

import javax.faces.bean.RequestScoped;
import javax.inject.Inject;
import javax.validation.Valid;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.view.Results;
import vraptor_suporten2.dal.RedeDAO;
import vraptor_suporten2.model.annotation.Admin;
import vraptor_suporten2.model.entities.Rede;

@Controller
@RequestScoped
public class RedeController extends AbstractCrudController implements EntityCrudControllerInterface{

	@Inject
	private RedeDAO dao;

	public RedeController() {

	}

	@Admin
	public void create() {

	}
	
	@Admin
	@Path("/rede/edit/{id}")
	public Rede edit(Integer id) {		
		
		Rede r = new Rede();
		r.setId(id);
		
		Rede rede = (Rede) dao.buscarPorId(r);
		
		if(rede == null){
			result.include("mensagemFalha", r.getClass().getSimpleName() + " inexistente!");
		}
		
		return rede;
	}
	
	@Admin
	public void delete(Integer id) {		
		
		Rede r = new Rede();
		r.setId(id);
		
		Rede rede = (Rede) dao.buscarPorId(r);
		
		if(rede != null){
			
			try {
				dao.excluir(r);
				result.include("mensagem", r.getClass().getSimpleName() + " " + rede.getNome() + " excluída.");
			} catch (Exception e) {
				result.include("mensagemFalha", e.getMessage());
			}finally {
				result.use(Results.logic()).redirectTo(this.getClass()).list();
			}
			
		}else{
			result.include("mensagemFalha", r.getClass().getSimpleName() + " inexistente!");
		}
	}	
	

	@Path("/rede")
	@Admin
	public List<Rede> list() {
		return dao.listar();
	}

	@Admin
	public void add(@Valid Rede r) {

		validation.onErrorForwardTo(this).create();

		try {

			if(dao.buscarPorNome(r) == null){
				
				if(r.getAtivo() == null){
					r.setAtivo(false);
				}
				
				dao.cadastrar(r);
				result.include("mensagem", r.getClass().getSimpleName() + " adicionada com sucesso!");
				result.use(Results.logic()).redirectTo(this.getClass()).list();
				
			}else{
				
				result.include("mensagemFalha", r.getClass().getSimpleName() + ": " + r.getNome() + " já existente!");
				result.forwardTo(this).create();
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Admin
	public void update(@Valid Rede r) {

		validation.onErrorForwardTo(this).edit(r.getId());
		
		Rede rd = (Rede) dao.buscarPorId(r);

		try {

			if(rd != null && rd.getId() == r.getId()){
				
				dao.editar(r);
				result.include("mensagem", r.getClass().getSimpleName() + " alterada com sucesso!");
				result.use(Results.logic()).redirectTo(this.getClass()).list();
				
			}else{
				
				result.include("mensagemFalha", "Falha ao alterar " + r.getClass().getSimpleName() + ".");
				result.use(Results.logic()).forwardTo(this.getClass()).edit(r.getId());
				
			}
				
		} catch (Exception e) {
			result.include("mensagemFalha", "Falha ao alterar " + r.getClass().getSimpleName() + ".");
			result.use(Results.logic()).forwardTo(this.getClass()).edit(r.getId());
		}
	}	
	
}
