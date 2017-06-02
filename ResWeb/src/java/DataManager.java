import java.io.Serializable;
import javax.faces.bean.ManagedBean;
import java.util.ArrayList;


public class DataManager implements Servicos,Serializable {
    private static DBConnector pc;
   

    public DataManager() {
        //pc = new DBConnector("alunos.di.uevora.pt","l36926","l36926","miguel");
        pc = new DBConnector();
    }

    
    public ArrayList<String> listar_espacos() {
        return pc.listar_espacos();
    }


    public boolean disponibilidade(String nomeEspaco, String data)  {
        return pc.disponibilidade(nomeEspaco, data);
    }

  
    public double reserva(String nome, String nomeEspaco, String dataInicio, String dataFim, int telefone, int numUtilizadores)  {
        return pc.reserva(nome, nomeEspaco, dataInicio, dataFim, telefone, numUtilizadores);
    }

 
   
    public ArrayList<String> listar_reservas(String nomeEspaco)  {
       return pc.listar_reservas(nomeEspaco);
    }
    
  
}
