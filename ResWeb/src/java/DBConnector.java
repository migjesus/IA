

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;


public class DBConnector implements Servicos{
   

    /*private String PG_HOST;
    private String PG_DB;
    private String USER;
    private String PWD;*/

    private String PG_HOST="localhost";
    private String PG_DB="postgres";
    private String USER="postgres";
    private String PWD="miguel";
    
    Connection con = null;
    Statement stmt = null;
    
    public DBConnector(){
        
    }

    public DBConnector( String PG_HOST, String PG_DB, String USER, String PWD) {
        this.PG_HOST=PG_HOST;
        this.PG_DB=PG_DB;
        this.USER=USER;
        this.PWD=PWD;
    }

    public void connect() throws Exception {
        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection("jdbc:postgresql://" + PG_HOST + ":5432/" + PG_DB,
                    USER, PWD);

            stmt = con.createStatement();
            

        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("Problems setting the connection");
        }
    }

    public void disconnect() {    
        try {
            stmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Statement getStatement() {
        return stmt;
    }

   /* @Override
    public ArrayList<Espaco> listar_espacos(){
        ArrayList<Espaco> info = new ArrayList();  
 
        try {
            //estabelecer conexao com bd

            connect();
        } catch (Exception ex) {
            Logger.getLogger(DBConnector.class.getName()).log(Level.SEVERE, null, ex);
        }
       
      
        try {
            
            //query para selecionar tabela dos campos
             ResultSet rs = getStatement().executeQuery("SELECT * from campos");
            //escreve lista dos espaços e respetivos custos
             while (rs.next()) {
                String nome = rs.getString("nomeEspaco");
                int custo= rs.getInt("custo");
                Espaco espaco = new Espaco(nome,custo);
                
             }
             
               
         //fecha ligaçao com a bd
         
        disconnect();
               
          
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("Problems retrieving data from db...");
        }
        
         //fecha ligaçao com a bd
               disconnect();
  
         return info;
    }

    @Override
    public boolean disponibilidade(String nomeEspaco, String data){
        boolean result=false;
       //estabelecer conexao com bd
        try {
            connect();
        } catch (Exception ex) {
            Logger.getLogger(DBConnector.class.getName()).log(Level.SEVERE, null, ex);
        }

      
        try {
             //se esta query nao retornar nada entao significa que um espaço esta livre
             ResultSet rs = getStatement().executeQuery("SELECT id FROM reservas WHERE nomeEspaco='"+nomeEspaco+"' and dataInicio<='"+data+"' and dataFim>'"+data+"'");
             if(!rs.next()){
                 result=true;
             }
             
             
                //fecha ligaçao com a bd
               disconnect();
               
          
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("Problems retrieving data from db...");
        }
       return result;
    }

    @Override
    public double reserva(String nome, String nomeEspaco, String dataInicio, String dataFim, int telefone, int numUtilizadores) {
         double custoEstimado=0;
        if(disponibilidade(nomeEspaco,dataInicio)==false || disponibilidade(nomeEspaco,dataFim)==false){
            return 0;
        }
        else{
          
             try {
                 connect();//abrir conexao a bd
             } catch (Exception ex) {
                 Logger.getLogger(DBConnector.class.getName()).log(Level.SEVERE, null, ex);
             }
          

            try {

                //query para selecionar custo associado ao campo escolhido para calculo do custo estimado 
                ResultSet rs = getStatement().
                        executeQuery("SELECT custo FROM campos WHERE nomeEspaco='"+nomeEspaco+"'");
                int custo =0;
                if(rs.next()){
                    custo = rs.getInt(1);
                    System.err.println(custo);
                }       
                System.err.println(custo);
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
                Date date1 = format.parse(dataInicio);
                Date date2 = format.parse(dataFim);
                long difference = date2.getTime() - date1.getTime(); //intervalo de tempo em milisegundos 
                double diffHours = (double) difference / (60 * 60 * 1000) % 24; //conversao de milisegundos para horas
                custoEstimado = (double) custo*diffHours; // calculo custo estimado
                System.err.println(custoEstimado);
                getStatement().executeUpdate("insert into reservas(nome,nomeEspaco,dataInicio,dataFim,telefone,custoEstimado,numUtilizadores) "
                        + " values('"+nome+"','"+nomeEspaco+"','"+dataInicio+"','"+dataFim+"',"+telefone+","+custoEstimado+","+numUtilizadores+")");
                //fecha ligaçao com a bd
                disconnect();
                
                
            } catch (Exception e) {
                e.printStackTrace();
                System.err.println("Problems retrieving data from db...");
            }
            
            
            return custoEstimado;
        }
    }

    @Override
    public ArrayList<Reserva> listar_reservas(String nomeEspaco){
         ArrayList<Reserva> info = new ArrayList();  
 
        try {
            //estabelecer conexao com bd

            connect();
        } catch (Exception ex) {
            Logger.getLogger(DBConnector.class.getName()).log(Level.SEVERE, null, ex);
        }
       
      
        try {
            
            //query para selecionar tabela dos campos
             ResultSet rs = getStatement().executeQuery("SELECT nome, nomeEspaco, dataInicio, dataFim, telefone, custoEstimado, numUtilizadores"
                     + " FROM reservas WHERE nomeEspaco='"+nomeEspaco+"'");
            //escreve data inicio e data fim de todas as reservas associadas a um determinado campo
             while (rs.next()) {
                String dataInicio  = rs.getTimestamp("dataInicio").toString();
                String dataFim  = rs.getTimestamp("dataFim").toString();
                String nome = rs.getString("nome");
                int telefone = rs.getInt("telefone");
                double custoEstimado = rs.getDouble("custoEstimado");
                int numUtilizadores = rs.getInt("numUtilizadores");
                Reserva reserva = new Reserva(nome,nomeEspaco,dataInicio,dataFim,telefone,custoEstimado,numUtilizadores);
                info.add(reserva);
             }
             
                //fecha ligaçao com a bd
               disconnect();
               
          
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("Problems retrieving data from db...");
        }
        
    
         return info;
    }
    */
   

    public ArrayList<String> listar_espacos() {
    ArrayList<String> info = new ArrayList();  
 
        try {
            //estabelecer conexao com bd

            connect();
        } catch (Exception ex) {
            Logger.getLogger(DBConnector.class.getName()).log(Level.SEVERE, null, ex);
        }
       
        try {
            
            //query para selecionar tabela dos campos
             ResultSet rs = getStatement().executeQuery("SELECT * from campos");
            //escreve lista dos espaços e respetivos custos
             while (rs.next()) {
                String nome = rs.getString("nomeEspaco");
                String custo=Integer.toString(rs.getInt("custo"));
                info.add("Espaço: "+nome+" Custo: "+custo);
             }
             
               
         //fecha ligaçao com a bd
         
        disconnect();
               
          
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("Problems retrieving data from db...");
        }
        
         //fecha ligaçao com a bd
         disconnect();
  
         return info;
    }

   
 
    public boolean disponibilidade(String nomeEspaco,String data)  {
        boolean result=false;
       //estabelecer conexao com bd
        try {
            connect();
        } catch (Exception ex) {
            Logger.getLogger(DBConnector.class.getName()).log(Level.SEVERE, null, ex);
        }
       
      
        try {
             //se esta query nao retornar nada entao significa que um espaço esta livre
             ResultSet rs = getStatement().executeQuery("SELECT id FROM reservas WHERE nomeEspaco='"+nomeEspaco+"' and dataInicio<='"+data+"' and dataFim>'"+data+"'");
             if(!rs.next()){
                 result=true;
             }
             
             
                //fecha ligaçao com a bd
               disconnect();
               
          
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("Problems retrieving data from db...");
        }
       return result;
        
    }

    
    public double reserva(String nome,String nomeEspaco,String dataInicio, String dataFim, int telefone, int numUtilizadores)  {
           double custoEstimado=0;
        if(disponibilidade(nomeEspaco,dataInicio)==false || disponibilidade(nomeEspaco,dataFim)==false){
            return 0;
        }
        else{
         
               try {
                   connect();//abrir conexao a bd
               } catch (Exception ex) {
                   Logger.getLogger(DBConnector.class.getName()).log(Level.SEVERE, null, ex);
               }
            

            try {

                //query para selecionar custo associado ao campo escolhido para calculo do custo estimado 
                ResultSet rs = getStatement().
                        executeQuery("SELECT custo FROM campos WHERE nomeEspaco='"+nomeEspaco+"'");
                int custo =0;
                if(rs.next()){
                    custo = rs.getInt(1);
                    System.err.println(custo);
                }       
                System.err.println(custo);
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
                Date date1 = format.parse(dataInicio);
                Date date2 = format.parse(dataFim);
                long difference = date2.getTime() - date1.getTime(); //intervalo de tempo em milisegundos 
                double diffHours = (double) difference / (60 * 60 * 1000) % 24; //conversao de milisegundos para horas
                custoEstimado = (double) custo*diffHours; // calculo custo estimado
                System.err.println(custoEstimado);
                getStatement().executeUpdate("insert into reservas(nome,nomeEspaco,dataInicio,dataFim,telefone,custoEstimado,numUtilizadores) "
                        + " values('"+nome+"','"+nomeEspaco+"','"+dataInicio+"','"+dataFim+"',"+telefone+","+custoEstimado+","+numUtilizadores+")");
                //fecha ligaçao com a bd
                disconnect();
                
                
            } catch (Exception e) {
                e.printStackTrace();
                System.err.println("Problems retrieving data from db...");
            }
            
            
            return custoEstimado;
        }
        
    }
    

    
    public ArrayList<String> listar_reservas(String nomeEspaco)  {
        ArrayList<String> info = new ArrayList();  
 
        try {
            //estabelecer conexao com bd

            connect();
        } catch (Exception ex) {
            Logger.getLogger(DBConnector.class.getName()).log(Level.SEVERE, null, ex);
        }
       
      
        try {
            
            //query para selecionar tabela dos campos
             ResultSet rs = getStatement().executeQuery("SELECT dataInicio, dataFim FROM reservas WHERE nomeEspaco='"+nomeEspaco+"'");
            //escreve data inicio e data fim de todas as reservas associadas a um determinado campo
             while (rs.next()) {
                String dataInicio  = rs.getTimestamp("dataInicio").toString();
                String dataFim  = rs.getTimestamp("dataFim").toString();
                info.add("Espaço reservado de: "+dataInicio+" a "+dataFim);
             }
             
                //fecha ligaçao com a bd
               disconnect();
               
          
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("Problems retrieving data from db...");
        }
        
    
         return info;
    }
}

