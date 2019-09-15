package br.com.fatecpg.cadastro;

import java.util.ArrayList;
import java.net.URL;

public class Discos {
    
    private String nome;
    private String genero;
    private String artista;
    private String ano;
    private static ArrayList<Discos> list;
    
     public static ArrayList<Discos> getList(){
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
     
     public String getArtista(){
         return artista;
     }
     
     public void setArtista(String artista){
         this.artista = artista;
     }
     
     public String getAno(){
         return ano;
     }
     
     public void setAno(String ano){
         this.ano = ano;
     }
    
}
