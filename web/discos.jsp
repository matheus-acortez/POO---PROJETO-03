<%@page import="java.net.URL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.fatecpg.cadastro.Discos"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="estilo.css">
        <title>Cadastro de Discos</title>
    </head>
    <body>
       <div class="container">                                                                                         
        <%@include file="WEB-INF/jspf/header.jspf"%>
        <div class="card">
            <div class="card-header">
                <h4>Cadastro de Discos</h4>
                <% 
                try{

                if((request.getParameter("cadastro")!=null)){
                    String nome= request.getParameter("nome");
                    String genero =request.getParameter("genero");
                    String artista =request.getParameter("artista");
                    String ano =request.getParameter("ano");
                    Discos c = new Discos();
                    c.setNome(nome);
                    c.setGenero(genero); 
                    c.setArtista(artista); 
                    c.setAno(ano);
                    Discos.getList().add(c);
                    response.sendRedirect(request.getRequestURI());
            
                }
                else if(request.getParameter("remove")!=null){
                    int i=Integer.parseInt(request.getParameter("index"));
                    Discos.getList().remove(i);}

                 else if (request.getParameter("salvar") != null) { 
                    int index = Integer.parseInt(request.getParameter("index"));
                    String nome= request.getParameter("nome");
                    String genero =request.getParameter("genero");
                    String artista = request.getParameter("artista");
                    String ano = request.getParameter("ano");                  
                    Discos c = new Discos();
                    c.setNome(nome);
                    c.setGenero(genero);
                    c.setArtista(artista); 
                    c.setAno(ano); 
                    Discos.getList().set(index,c);
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
            <input type="text" name="nome" class="form-control" id="nomeLabel" placeholder="Nome do Disco">
          </div>
        </div>
        <div class="form-group row">
          <label for="generoLabel" class="col-sm-2 col-form-label">Gênero</label>
          <div class="col-sm-3">
            <input type="text" name="genero" class="form-control" id="generoLabel" placeholder="Gênero Musical">
          </div>
        </div>
        <div class="form-group row">
          <label for="artistaLabel" class="col-sm-2 col-form-label">Artista</label>
          <div class="col-sm-3">
            <input type="text" name="artista" class="form-control" id="artistaLabel" placeholder="Nome do Artista">
          </div>
        </div>
        <div class="form-group row">
            <label for="anoLabel" class="col-sm-2 col-form-label">Ano</label>
            <div class="col-sm-3">
              <input type="text" name="ano" class="form-control" id="anoLabel" placeholder="Ano de Lançamento">
            </div>
          </div>
        <input class="btn btn-primary" name="cadastro" type="submit" value="Cadastrar">
    </form>
    
        <div class="row form-band">
            <div class="col-sm-12 col-md-12">
                <h4>Lista de Discos</h4>
                <table class="table table-striped table-dark">
                <thead>
                  <tr>
                    <th scope="col">Índice</th>
                    <th scope="col">Nome</th>
                    <th scope="col">Genêro</th>
                    <th scope="col">Artista</th>
                    <th scope="col">Ano</th>
                  </tr>
                </thead>
                <tbody>
                </tbody>
                <%if(request.getParameter("alterar") == null) {
                for (int i=0; i<Discos.getList().size(); i++){%>
                <%Discos c= Discos.getList().get(i);
                %>
                <tr>
                    <td><%=i+1%></td>
                    <td><%=c.getNome()%></td>
                    <td><%=c.getGenero()%></td>
                    <td><%=c.getArtista()%></td>
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
                    for (int i=0; i<Discos.getList().size(); i++){
                      Discos c = Discos.getList().get(i);
                        if(i != Integer.parseInt(request.getParameter("index"))){%>
                            <!-- Aqui é somente a exibição dos valores, retornando o valor atual do atributo. -->
                            <tr>
                                <td><%=i+1%></td>
                                <td><%=c.getNome()%></td>
                                <td><%=c.getGenero()%></td>
                                <td><%=c.getArtista()%></td>
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
                                <td><input type="text" name="artista" value="<%=c.getArtista()%>"></td>
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
<%@include file="WEB-INF/jspf/footer.jspf"%>
</body>
</html>

   