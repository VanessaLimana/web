package com.integrador.controllers;

import com.integrador.database.daos.AtendimentoDao;
import com.integrador.database.entities.AtendimentoEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/atendimento")
public class AtendimentoController {

    @GetMapping("/dados")
    public ResponseEntity<List<AtendimentoEntity>> dados() {
        List<AtendimentoEntity> atendimentos = new AtendimentoDao().findAllAtendimentos();
        return ResponseEntity.ok(atendimentos);
    }

}
/*
http://localhost:8080/atendimento/dados*/
