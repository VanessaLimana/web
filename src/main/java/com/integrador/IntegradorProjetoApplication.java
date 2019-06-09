package com.integrador;

import com.integrador.database.daos.AtendimentoDao;
import com.integrador.database.entities.AtendimentoEntity;
import com.integrador.database.entities.FuncionarioEntity;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.util.List;

@SpringBootApplication
public class IntegradorProjetoApplication {

	public static void main(String[] args) {
		SpringApplication.run(IntegradorProjetoApplication.class, args);
	}

}
