


import java.util.ArrayList;



public interface BusinessLogic {
    
    public abstract boolean disponibilidade(String nome, String data);
    public abstract double reserva(String nome, String nomeEspaco, String dataInicio, String dataFim, int telefone, int numUtilizadores);
    public abstract ArrayList<Espaco> listar_espacos();
    public abstract ArrayList<Reserva> listar_reservas(String nome);
    
}
