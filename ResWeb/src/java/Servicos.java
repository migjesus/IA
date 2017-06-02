


import java.util.ArrayList;

public interface Servicos {

    public ArrayList<String> listar_espacos();
    
    public boolean disponibilidade(String nomeEspaco, String data) ;
    
    public double reserva(String nome,String nomeEspaco,
            String dataInicio, String dataFim, int telefone, int numUtilizadores);
    
    public ArrayList<String> listar_reservas(String nomeEspaco);
}
