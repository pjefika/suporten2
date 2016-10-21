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
import vraptor_suporten2.dal.RedeDAO;
import vraptor_suporten2.model.annotation.Admin;
import vraptor_suporten2.model.entities.Motivo;

@Controller
@RequestScoped
public class MotivoController extends AbstractCrudController implements EntityCrudControllerInterface{

	@Inject
	private MotivoDAO dao;


	
	@Inject
	private RedeDAO redeDao;

	public MotivoController() {

	}

	@Override
	@Admin
	public void create() {
		result.include("redeList", redeDao.listar());
	}

	@Admin
	public void add(@Valid Motivo m) {
		
		System.out.println(m);
		
		
		
		if(m.getMacroMotivo().getId() == null){
			validation.add(new SimpleMessage("m.macroMotivo.id", "Campo requerido!"));
		}

		validation.onErrorForwardTo(this).create();

		try {
			
			List<Motivo> lelist = dao.buscarListaPorNome(m);
			
			for (Motivo motivo : lelist) {
				
				if(motivo.getMacroMotivo().getId() == m.getMacroMotivo().getId()){
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


	@Override
	@Admin
	public void delete(Integer id) {

		Motivo m = new Motivo();
		m.setId(id);
		Motivo motivo = (Motivo) dao.buscarPorId(m);

		if(motivo != null){
			
			try {
				dao.excluir(motivo);
				result.include("mensagem", m.getClass().getSimpleName() + " " + m.getNome() + " excluído.");
			} catch (Exception e) {
				result.include("mensagemFalha", e.getMessage());
			}finally {
				result.use(Results.logic()).redirectTo(this.getClass()).list();
			}

		}else{
			result.include("mensagemFalha", m.getClass().getSimpleName() + " inexistente!");
		}
	}

	@Path("/motivo")
	@Admin
	public List<Motivo> list() {
		return dao.listar();
	}

	@SuppressWarnings("unused")
	@Admin
	@Path("/motivo/edit/{id}")
	public Motivo edit(Integer id) {		

		Motivo m = new Motivo();
		
		m.setId(id);
		
		result.include("redeList", redeDao.listar());
		
		
		Motivo macro = (Motivo) dao.buscarPorId(m);
		
				
		result.include("macroMotivoList", macro.getMacroMotivo().getRede().getMacroMotivos());

		if(macro == null){
			result.include("mensagemFalha", m.getClass().getSimpleName() + " inexistente!");
		}

		return macro;
	}


	@Admin
	public void update(@Valid Motivo m) {

		if(m.getMacroMotivo().getId() == null){
			validation.add(new SimpleMessage("m.macroMotivo.id", "Campo requerido!"));
		}

		validation.onErrorForwardTo(this).create();

		Motivo md = (Motivo) dao.buscarPorId(m);

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
