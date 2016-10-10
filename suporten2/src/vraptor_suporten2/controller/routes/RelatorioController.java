package vraptor_suporten2.controller.routes;

import javax.faces.bean.RequestScoped;
import javax.inject.Inject;
import javax.validation.Valid;

import br.com.caelum.vraptor.Controller;
import vraptor_suporten2.dal.AtendimentoDAO;
import vraptor_suporten2.model.annotation.Admin;
import vraptor_suporten2.model.viewmodel.Relatorio;

@Controller
@RequestScoped
public class RelatorioController extends AbstractCrudController{

                @Inject
                private AtendimentoDAO dao;

                public RelatorioController() {

                }

                @Admin
                public void create() {
                }

                @Admin
                public void add(@Valid Relatorio r){
                               
                               validation.onErrorForwardTo(this.getClass()).create();
                               
                               result.include("atendimentos", dao.listar(r));
                }
}

