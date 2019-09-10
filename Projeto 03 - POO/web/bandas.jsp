<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <input class="btn btn-primary" type="submit" value="Cadastrar">
            </form>
            
                <div class="row form-band">
                    <div class="col-sm-12 col-md-12">
                        <h4>Lista de bandas</h4>
                        <table class="table table-striped table-dark">
                        <thead>
                          <tr>
                            <th scope="col">Nome</th>
                            <th scope="col">Gênero</th>
                            <th scope="col">País</th>
                          </tr>
                        </thead>
                        <tbody>
                        </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        </div>
    <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
