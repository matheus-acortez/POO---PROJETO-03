<%@page import="java.net.URL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.fatecpg.cadastro.Musicas"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="estilo.css">
        <title>Cadastro de Músicas</title>
    </head>
    <body>
        <div class="container">                                                                                         
            <%@include file="WEB-INF/jspf/header.jspf"%>
            <div class="card">
            <div class="card-header">
                 <h4>Cadastro de Músicas</h4>
                <% 
                try{

                if((request.getParameter("cadastro")!=null)){
                    String nome= request.getParameter("nome");
                    String genero =request.getParameter("genero");
                    String album =request.getParameter("album");
                    String banda =request.getParameter("banda");
                    String ano  =request.getParameter("ano");
                    Musicas c = new Musicas();
                    c.setNome(nome);
                    c.setGenero(genero);
                    c.setAlbum(album);
                    c.setBanda(banda); 
                    c.setAno(ano);
                    Musicas.getList().add(c);
                    response.sendRedirect(request.getRequestURI());
            
                }
                else if(request.getParameter("remove")!=null){
                    int i=Integer.parseInt(request.getParameter("index"));
                    Musicas.getList().remove(i);}

                 else if (request.getParameter("salvar") != null) { 
                    int index = Integer.parseInt(request.getParameter("index"));
                    String nome= request.getParameter("nome");
                    String genero =request.getParameter("genero");
                    String album =request.getParameter("album");
                    String banda =request.getParameter("banda");
                    String ano =request.getParameter("ano");
                    Musicas c = new Musicas();
                    c.setNome(nome);
                    c.setGenero(genero); 
                    c.setAlbum(album);
                    c.setBanda(banda);
                    c.setAno(ano);
                    Musicas.getList().set(index,c);
             }

                }catch(Exception ex){%>
                <div>O formulário não foi preenchido corretamente. Tente novamente</div>
            <%}%>
            </div>
            <div class="card-body">
                <form class="">
                <div class="form-group row">
                  <label for="nomeLabel" class="col-sm-2 col-form-label">Nome</label>
                  <div class="col-sm-3">
                    <input type="text" name="nome" class="form-control" id="nomeLabel" placeholder="Nome da banda">
                  </div>
                </div>
                <div class="form-group row">
                  <label for="generoLabel" class="col-sm-2 col-form-label">Gênero</label>
                  <div class="col-sm-3">
                    <input type="text" name="genero" class="form-control" id="generoLabel" placeholder="Gênero Musical">
                  </div>
                </div>
                <div class="form-group row">
                  <label for="albumLabel" class="col-sm-2 col-form-label">Álbum</label>
                  <div class="col-sm-3">
                    <input type="text" name="album" class="form-control" id="paisLabel" placeholder="Nome do album">
                  </div>
                </div>
                <div class="form-group row">
                  <label for="bandaLabel" class="col-sm-2 col-form-label">Banda ou Artista</label>
                  <div class="col-sm-3">
                    <input type="text" name="banda" class="form-control" id="paisLabel" placeholder="Nome da banda ou artista">
                  </div>
                </div>
                  <div class="form-group row">
                  <label for="anoLabel" class="col-sm-2 col-form-label">Ano</label>
                  <div class="col-sm-3">
                    <input type="text" name="ano" class="form-control" id="paisLabel" placeholder="Data de Lançamento">
                  </div>
                </div>
                <input class="btn btn-primary" name="cadastro" type="submit" value="Cadastrar">
            </form>
            
                <div class="row form-band">
                    <div class="col-sm-12 col-md-12">
                        <h4>Lista de músicas</h4>
                        <table class="table table-striped table-dark">
                        <thead>
                          <tr>
                            <th scope="col">Índice</th>
                            <th scope="col">Nome</th>
                            <th scope="col">Genêro</th>
                            <th scope="col">Álbum</th>
                            <th scope="col">Banda ou Artista</th>
                            <th scope="col">Ano de Lançamento</th>
                          </tr>
                        </thead>
                        <tbody>
                        </tbody>
                        <%if(request.getParameter("alterar") == null) {
                        for (int i=0; i<Musicas.getList().size(); i++){%>
                         <%Musicas c= Musicas.getList().get(i);%> 
                        <tr>
                            <td><%=i+1%></td>
                            <td><%=c.getNome()%></td>
                            <td><%=c.getGenero()%></td>
                            <td><%=c.getAlbum()%></td>
                            <td><%=c.getBanda()%></td>
                            <td><%=c.getAno()%></td>
                        <td>
                        <form>
                            <input type="hidden" name="index" value="<%=i%>"/>
                            <input type="submit" name="remove" value="Excluir"/>
                        </form>
                        </td>
                        <td>
                            <form>
                                <input type="hidden" name="index" value="<%=i%>"/>
                                <input type="submit" name="alterar" value="Alterar"/>
                            </form> 
                        </td>
                        </tr>

                        <!-- Se 'alterar' for diferente de 'null' entra em um laço p/ a exibição dos cadastros que deseja alterar -->
                        <%}}
                        else {
                            for (int i=0; i<Musicas.getList().size(); i++){
                                 Musicas c = Musicas.getList().get(i); 
                                if(i != Integer.parseInt(request.getParameter("index"))){%>
                                    <!-- Aqui é somente a exibição dos valores, retornando o valor atual do atributo. -->
                                    <tr>
                                        <td><%=i+1%></td>
                                        <td><%=c.getNome()%></td>
                                        <td><%=c.getGenero()%></td>
                                        <td><%=c.getAlbum()%></td>
                                        <td><%=c.getBanda()%></td>  
                                        <td><%=c.getAno()%></td>
                                    <td>
                                        <form>
                                            <input type="hidden" name="index" value="<%=i%>"/>
                                            <input type="submit" name="remover" value="Excluir"/>
                                        </form>
                                    </td>
                                    <td>
                                        <form>
                                            <input type="hidden" name="index" value="<%=i%>"/>
                                            <input type="submit" name="alterar" value="Alterar"/>
                                        </form>
                                    </td>
                                    </tr>
                                    <%}else {%>

                                    <!-- Form do 'alterar' -->
                                    <tr>
                                        <form>
                                        <td><%=i+1%></td>
                                        <td><input type="text" name="nome"  value="<%=c.getNome()%>"></td>
                                        <td><input type="text" name="genero" value="<%=c.getGenero()%>"></td>
                                        <td><input type="text" name="album" value="<%=c.getAlbum()%>"></td>
                                        <td><input type="text" name="banda" value="<%=c.getBanda()%>"></td>
                                        <td><input type="text" name="ano" value="<%=c.getAno()%>"></td>
                                        <input type="hidden" name="index" value="<%=i%>"/>
                                        <td><input type="submit" value="Salvar" name="salvar"</td>
                                        </form>
                                    </tr>

                                <%}}}%>
                        </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        </div>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <%@include file="WEB-INF/jspf/footer.jspf"%>
    </body>
</html>
