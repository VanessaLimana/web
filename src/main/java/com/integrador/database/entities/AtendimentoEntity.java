package com.integrador.database.entities;

import javax.persistence.*;


@Entity
@Table(name = "atendimentos")
public class AtendimentoEntity {

    @Id
    private long id;

    private String dia;
    private String horarioInicial;
    private String observacao;
    private String horarioFinal;

    @ManyToOne(fetch = FetchType.EAGER) @JoinColumn(name = "funcionariochave")
    private FuncionarioEntity funcionario;

    @ManyToOne(fetch = FetchType.EAGER) @JoinColumn(name = "clientechave")
    private ClienteEntity cliente;

    @ManyToOne(fetch = FetchType.EAGER) @JoinColumn(name = "tiposervicochave")
    private TipoServicoEntity tipoServico;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getDia() {
        return dia;
    }

    public void setDia(String dia) {
        this.dia = dia;
    }

    public String getHorarioInicial() {
        return horarioInicial;
    }

    public void setHorarioInicial(String horarioInicial) {
        this.horarioInicial = horarioInicial;
    }

    public String getObservacao() {
        return observacao;
    }

    public void setObservacao(String observacao) {
        this.observacao = observacao;
    }

    public String getHorarioFinal() {
        return horarioFinal;
    }

    public void setHorarioFinal(String horarioFinal) {
        this.horarioFinal = horarioFinal;
    }

    public FuncionarioEntity getFuncionario() {
        return funcionario;
    }

    public void setFuncionario(FuncionarioEntity funcionario) {
        this.funcionario = funcionario;
    }

    public ClienteEntity getCliente() {
        return cliente;
    }

    public void setCliente(ClienteEntity cliente) {
        this.cliente = cliente;
    }

    public TipoServicoEntity getTipoServico() {
        return tipoServico;
    }

    public void setTipoServico(TipoServicoEntity tipoServico) {
        this.tipoServico = tipoServico;
    }
}
