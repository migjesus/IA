

import java.io.Serializable;

public class Reserva implements Serializable {
    
    private String nome;
    private String nomeEspaco;
    private String dataInicio;
    private String dataFim;
    private int telefone;
    private double custoEstimado;
    private int numUtilizadores;

    public Reserva(String nome, String nomeEspaco, String dataInicio, String dataFim, int telefone, double custoEstimado, int numUtilizadores) {
        this.nome = nome;
        this.nomeEspaco = nomeEspaco;
        this.dataInicio = dataInicio;
        this.dataFim = dataFim;
        this.telefone = telefone;
        this.custoEstimado = custoEstimado;
        this.numUtilizadores = numUtilizadores;
    }
    

    public String getNome() {
        return nome;
    }

   
    public void setNome(String nome) {
        this.nome = nome;
    }


    public String getNomeEspaco() {
        return nomeEspaco;
    }

  
    public void setNomeEspaco(String nomeEspaco) {
        this.nomeEspaco = nomeEspaco;
    }

 
    public String getDataInicio() {
        return dataInicio;
    }

    
    public void setDataInicio(String dataInicio) {
        this.dataInicio = dataInicio;
    }


    public String getDataFim() {
        return dataFim;
    }

   
    public void setDataFim(String dataFim) {
        this.dataFim = dataFim;
    }

  
    public int getTelefone() {
        return telefone;
    }

  
    public void setTelefone(int telefone) {
        this.telefone = telefone;
    }

 
    public double getCustoEstimado() {
        return custoEstimado;
    }

   
    public void setCustoEstimado(double custoEstimado) {
        this.custoEstimado = custoEstimado;
    }

    public int getNumUtilizadores() {
        return numUtilizadores;
    }


    public void setNumUtilizadores(int numUtilizadores) {
        this.numUtilizadores = numUtilizadores;
    }
    
    
    
    
}
