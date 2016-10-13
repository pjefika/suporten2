package vraptor_suporten2.controller.auth;

import java.io.Serializable;

import javax.enterprise.context.SessionScoped;
import javax.inject.Inject;
import javax.inject.Named;

import vraptor_suporten2.dal.webservice.Usuario;

@SessionScoped
@Named
public class SessionUsuarioEfika implements Serializable {

	private static final long serialVersionUID = -253139602953530465L;

	private Usuario usuario;

	public SessionUsuarioEfika() {
		usuario = new Usuario();
	}

	@Inject
	public SessionUsuarioEfika(Usuario usuario) {
		this.usuario = usuario;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
	public boolean isAdmin(){
		return this.usuario.getNivel() > 7;
	}
	
	public boolean isLogado(){
		return usuario.getLogin() != null;
		
	}
}
