
package br.com.fatecpg.cadastro;

import java.util.ArrayList;

public class Bandas {
    
    public String nome;
    public String genero;
    public String pais;
    public static ArrayList<Bandas> list;
    
     public static ArrayList<Bandas> getList(){
        if(list==null){
        list = new ArrayList<>();
        }
    return list;
    }
     
     public String getNome(){
         return nome;
     }
     
     public void setNome(){
         this.nome = nome;
     }
     
     public String getGenero(){
         return nome;
     }
     
     public void setGenero(){
         this.nome = nome;
     }
     
     public String getPais(){
         return nome;
     }
     
     public void setPais(){
         this.nome = nome;
     }
    
}
