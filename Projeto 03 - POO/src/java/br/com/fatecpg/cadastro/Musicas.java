
package br.com.fatecpg.cadastro;

import java.util.ArrayList;
import java.net.URL;

public class Musicas {
    
    private String nome;
    private String genero;
    private String banda;
    private static ArrayList<Musicas> list;
    
    public static ArrayList<Musicas> getList() {
        if(list==null){
        list = new ArrayList<>();
        }
    return list;
    }
    
     public String getNome() {
        return nome;
    }
     
    public void setNome(String nome) {
        this.nome = nome;
    }
    
    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }
    
     public String getBanda() {
        return banda;
    }

    public void setBanda(String banda) {
        this.banda = banda;
    }
    
   
    

   

    

    
   
    
}
