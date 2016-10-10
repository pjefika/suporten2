package vraptor_suporten2.controller.routes;

import javax.faces.bean.RequestScoped;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;

@Controller
@RequestScoped
public class HomeController {
	
	public HomeController() {

	}
	
	@Path("/")
	public void index(){
		
	}
	
	public void restrito(){
	}
}
