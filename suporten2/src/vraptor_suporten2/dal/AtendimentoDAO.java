package vraptor_suporten2.dal;

import java.util.ArrayList;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.Query;

import vraptor_suporten2.model.entities.Atendimento;
import vraptor_suporten2.model.entities.Solucao;

@Stateless
public class AtendimentoDAO extends AbstractDAO{

	public AtendimentoDAO() {

	}

	@SuppressWarnings("unchecked")
	public List<Atendimento> listar(){

		try {
			Query query = this.entityManager.createQuery("FROM Atendimento s");
			return query.getResultList();
		} catch (Exception e) {
			return new ArrayList<Atendimento>();
		}

	}
	
	
	@SuppressWarnings("unchecked")
	public List<Atendimento> listarPorSolucao(Solucao s){

		try {
			Query query = this.entityManager.createQuery("FROM Atendimento s WHERE s.solucao =:param1");
			query.setParameter("param1", s);
			return query.getResultList();
		} catch (Exception e) {
			return new ArrayList<Atendimento>();
		}

	}	
	
	
}
