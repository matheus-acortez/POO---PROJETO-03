<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.fatecpg.cadastro.Bandas"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="estilo.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Bandas</title>
    </head>
    <body>
        <div class="container">                                                                                         
        <%@include file="WEB-INF/jspf/header.jspf"%>
        <div class="card">
            <div class="card-header">
                <h4>Cadastro de Bandas</h4>
                <% 
                try{

                if((request.getParameter("cadastro")!=null)){
                    String nome= request.getParameter("nome");
                    String genero =request.getParameter("genero");
                    String pais =request.getParameter("pais");
                    Bandas c = new Bandas();
                    c.setNome(nome);
                    c.setGenero(genero); 
                    c.setPais(pais); 
                    Bandas.getList().add(c);
                    response.sendRedirect(request.getRequestURI());
                }
                else if(request.getParameter("remove")!=null){
                    int i=Integer.parseInt(request.getParameter("index"));
                    Bandas.getList().remove(i);}

                 else if (request.getParameter("salvar") != null) { 
                 int index = Integer.parseInt(request.getParameter("index"));
                    String nome= request.getParameter("nome");
                    String genero =request.getParameter("genero");
                    String pais =request.getParameter("pais");
                    Bandas c = new Bandas();
                    c.setNome(nome);
                    c.setGenero(genero); 
                    c.setPais(pais); 
                    Bandas.getList().set(index,c);

             }

                }catch(Exception ex){%>
                <div>O form está preenchido incorretamente</div>
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
                  <label for="paisLabel" class="col-sm-2 col-form-label">País</label>
                  <div class="col-sm-3">
                    <input type="text" name="pais" class="form-control" id="paisLabel" placeholder="País de origem">
                  </div>
                </div>
                <input class="btn btn-primary" name="cadastro" type="submit" value="Cadastrar">
            </form>
            
                <div class="row form-band">
                    <div class="col-sm-12 col-md-12">
                        <h4>Lista de bandas</h4>
                        <table class="table table-striped table-dark">
                        <thead>
                          <tr>
                            <th scope="col">Índice</th>
                            <th scope="col">Nome</th>
                            <th scope="col">Genêro</th>
                            <th scope="col">País</th>
                          </tr>
                        </thead>
                        <tbody>
                        </tbody>
                        <%if(request.getParameter("alterar") == null) {
                        for (int i=0; i<Bandas.getList().size(); i++){%>
                        <%Bandas c= Bandas.getList().get(i);
                        %>
                        <tr>
                            <td><%=i%></td>
                            <td><%=c.getNome()%></td>
                            <td><%=c.getGenero()%></td>
                            <td><%=c.getPais()%></td>
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
                            for (int i=0; i<Bandas.getList().size(); i++){
                              Bandas c = Bandas.getList().get(i);
                                if(i != Integer.parseInt(request.getParameter("index"))){%>
                                    <tr>
                                        <td><%=i%></td>
                                        <td><%=c.getNome()%></td>
                                        <td><%=c.getGenero()%></td>
                                        <td><%=c.getPais()%></td>            
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
                                        <td><%=i%></td>
                                        <td><input type="text" name="nome"  value="<%=c.getNome()%>"></td>
                                        <td><input type="text" name="genero" value="<%=c.getGenero()%>"></td>
                                        <td><input type="text" name="pais" value="<%=c.getPais()%>"></td>
                                        <input type="hidden" name="index" value="<%=i%>"/>
                                        <td><input type="submit" value="Salvar" name="salvar"</td>
                                        </form>
                                    </tr>

                                <%}}}%>
                        </tbody>
              
                        
                    </div>
                </div>
            </div>
        </div>
        </div>
    </body>
</html>
