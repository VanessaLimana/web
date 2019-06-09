package com.integrador.database.daos;

import com.integrador.database.core.HibernateUtils;
import com.integrador.database.entities.AtendimentoEntity;
import com.integrador.database.entities.FuncionarioEntity;
import org.hibernate.Session;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;

public class AtendimentoDao {

    public List<AtendimentoEntity> findAllAtendimentos() {
        try(Session session = HibernateUtils.openSession()) {
            CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
            CriteriaQuery<AtendimentoEntity> criteriaQuery = criteriaBuilder.createQuery(AtendimentoEntity.class);
            Root<AtendimentoEntity> root = criteriaQuery.from(AtendimentoEntity.class);
            criteriaQuery.select(root);
            return session.createQuery(criteriaQuery).getResultList();
        }
    }

}
