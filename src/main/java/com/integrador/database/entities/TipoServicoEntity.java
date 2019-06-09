package com.integrador.database.entities;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "tiposervico")
public class TipoServicoEntity {

    @Id
    private long id;
    private String descricaoServ;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getDescricaoServ() {
        return descricaoServ;
    }

    public void setDescricaoServ(String descricaoServ) {
        this.descricaoServ = descricaoServ;
    }
}
