
package br.com.fatecpg.cadastro;

import java.util.ArrayList;

public class Bandas {
    
    private String nome;
    private String genero;
    private String pais;
    private static ArrayList<Bandas> list;
    
     public static ArrayList<Bandas> getList(){
        if(list==null){
        list = new ArrayList<>();
        }
    return list;
    }
     
     public String getNome(){
         return nome;
     }
     
     public void setNome(String nome){
         this.nome = nome;
     }
     
     public String getGenero(){
         return genero;
     }
     
     public void setGenero(String genero){
         this.genero = genero;
     }
     
     public String getPais(){
         return pais;
     }
     
     public void setPais(String pais){
         this.pais = pais;
     }
    
}
