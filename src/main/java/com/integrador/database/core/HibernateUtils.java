package com.integrador.database.core;

import com.integrador.database.entities.AtendimentoEntity;
import com.integrador.database.entities.ClienteEntity;
import com.integrador.database.entities.FuncionarioEntity;
import com.integrador.database.entities.TipoServicoEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public abstract class HibernateUtils {
	
	private static SessionFactory sessionFactory;
	private static Logger logger = LoggerFactory.getLogger(HibernateUtils.class);
	
	static {
		logger.info("Starting database configuration...");
		Configuration configuration = getConfiguration();
		
		logger.info("Applying configuration properties...");
		StandardServiceRegistryBuilder serviceRegistryBuilder = new StandardServiceRegistryBuilder().applySettings(configuration.getProperties());
		
		logger.info("Building session factory...");
		sessionFactory = configuration.buildSessionFactory(serviceRegistryBuilder.build());
	}
	
	public static Session openSession() {
		return getSessionFactory().openSession();
	}
	
	/**
	 * This method IS to be called by the container holding this application and NOT directly.
	 * @return a session factory to manage all the database's sessions
	 */
	public static SessionFactory getSessionFactory() {
		return sessionFactory;		
	}
	
	public static Configuration getConfiguration() {
		Configuration configuration = new Configuration();
		configuration
			.addAnnotatedClass(FuncionarioEntity.class)
				.addAnnotatedClass(ClienteEntity.class)
				.addAnnotatedClass(AtendimentoEntity.class)
				.addAnnotatedClass(TipoServicoEntity.class)
			.configure();
		
		return configuration;
	}

}
