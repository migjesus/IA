


import java.io.Serializable;


public class Espaco implements Serializable {
    
    private String nome;
    private int custo;
    
    
    Espaco(String nome, int custo){
        this.nome = nome;
        this.custo = custo;
    }
    
    public String getNome (){
        return nome;
    }
    
    public void setNome (String nome){
        nome= this.nome;
    }

    public int getCusto() {
        return custo;
    }

    public void setCusto(int custo) {
        this.custo = custo;
    }
}
