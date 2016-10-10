package vraptor_suporten2.dal;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.Query;

import vraptor_suporten2.model.entities.Motivo;

@Stateless
public class MotivoDAO extends AbstractDAO{

	public MotivoDAO() {

	}

	@SuppressWarnings("unchecked")
	public List<Motivo> listar(){

		try {
			Query query = this.entityManager.createQuery("FROM Motivo m");
			return query.getResultList();
		} catch (Exception e) {
			return new ArrayList<Motivo>();
		}

	}
	
	public void excluir(Motivo m) throws Exception{
		
		/**
		 * Validação de Quebra de Constraint
		 */
		Motivo motivo = (Motivo) buscarPorId(m);
		
		if(motivo.getSolucaos().size() == 0){
			super.excluir(m);
		}else{
			throw new Exception("Falha ao excluir " + m.getClass().getSimpleName() + ", existem Soluções associadas.");
		}
	}

}
