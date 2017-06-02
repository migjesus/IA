
import java.io.Serializable;
import javax.faces.bean.ManagedBean;



@ManagedBean
public class PedidoReserva implements Serializable {
    private String nome;
    private String nomeEspaco;
    private String dataInicio;
    private String dataFim;
    private int telefone;
    private double custoEstimado;
    private int numUtilizadores;
    private DataManager dm;

    public PedidoReserva() {
       
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
    
    public double fazerReserva(){
        return dm.reserva(this.nome,this.nomeEspaco, this.dataInicio, this.dataFim, this.telefone, this.numUtilizadores);
    }
    
}
