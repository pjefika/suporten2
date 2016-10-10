package vraptor_suporten2.controller.intercepter;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

import br.com.caelum.vraptor.AroundCall;
import br.com.caelum.vraptor.Intercepts;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.interceptor.AcceptsWithAnnotations;
import br.com.caelum.vraptor.interceptor.SimpleInterceptorStack;
import vraptor_suporten2.controller.auth.SessionUsuarioEfika;
import vraptor_suporten2.controller.auth.UsuarioController;
import vraptor_suporten2.model.annotation.Logado;


@Intercepts
@RequestScoped
@AcceptsWithAnnotations(Logado.class)
public class LogadoInterceper {

	@Inject
	private Result result;

	@Inject
	private SessionUsuarioEfika session;

    /**
     * @deprecated CDI eyes only
     */
    protected LogadoInterceper() {
    	
    }
    
    @Inject
    public LogadoInterceper(SessionUsuarioEfika session){
    	this.session = session;
    }

    @AroundCall
	public void around(SimpleInterceptorStack stack){
    	
    	try {
        	if(!session.getUsuario().getLogin().isEmpty()){
        		stack.next();
        	}else{
            	result.forwardTo(UsuarioController.class).create();
        	}
		} catch (Exception e) {
        	result.forwardTo(UsuarioController.class).create();
		}
	}
	
}
