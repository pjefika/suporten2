package vraptor_suporten2.dal;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import vraptor_suporten2.model.entities.Solucao;

@Stateless
public class SolucaoDAO extends AbstractDAO{

	@PersistenceContext
	private EntityManager entityManager;

	@Inject
	private AtendimentoDAO atDao;

	public SolucaoDAO() {

	}

	@SuppressWarnings("unchecked")
	public List<Solucao> listar(){

		try {
			Query query = this.entityManager.createQuery("FROM Solucao s");
			return query.getResultList();
		} catch (Exception e) {
			return new ArrayList<Solucao>();
		}

	}

	public void excluir(Solucao s) throws Exception{

		/**
		 * Validação de Quebra de Constraint
		 */
		Solucao solucao = (Solucao) buscarPorId(s);

		if((atDao.listarPorSolucao(solucao)).size() == 0){
			super.excluir(solucao);
		}else{
			throw new Exception("Falha ao excluir " + s.getClass().getSimpleName() + ", existem Soluções associadas.");
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<Solucao> buscarListaPorNome(Solucao s){
		
		try {
			Query query = this.entityManager.createQuery("FROM Solucao s WHERE s.nome =:param1");
			query.setParameter("param1", s.getNome());
			return (List<Solucao>) query.getResultList();
		} catch (Exception e) {
			return null;
		}
	}

}
