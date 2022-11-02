<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <title>Listado de cursos</title>
    </head>
    <body>
        <div id="main">             
            <%
                Class.forName("com.mysql.jdbc.Driver");
                Connection conexion = null;            
                String consulta ="SELECT nom_curs, desc_curs_largo, inscriptos FROM tb_curs WHERE id_curs=?";
                PreparedStatement consultaCurso = null;
                try {
                    conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/prueba1", "root", "");
                    consultaCurso = conexion.prepareStatement(consulta);
                    consultaCurso.setString(1, request.getParameter("curso"));
                    ResultSet listaCurso = consultaCurso.executeQuery();
                    listaCurso.next();
                    out.print("<h1> " + listaCurso.getString("nom_curs") + " </h1>");
                    out.print("<p> " + listaCurso.getString("desc_curs_largo") + " </p>");
                    int cant = Integer.parseInt(listaCurso.getString("inscriptos"));
                    if (cant < 15){
                        %>
                        <form>
                          <div class="form-group row">
                            <label class="col-4 col-form-label" for="apyn">NOMBRE</label> 
                            <div class="col-8">
                              <input id="apyn" name="apyn" type="text" class="form-control">
                            </div>
                          </div>
                          <div class="form-group row">
                            <label for="dni" class="col-4 col-form-label">DNI</label> 
                            <div class="col-8">
                              <input id="dni" name="dni" type="text" class="form-control">
                            </div>
                          </div> 
                          <div class="form-group row">
                            <div class="offset-4 col-8">
                              <button name="submit" type="submit" class="btn btn-primary">Submit</button>
                            </div>
                          </div>
                        </form>
                        <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("exepcion </br>");
                    out.println("detalle de la consulta: </br>");
                    out.println(consultaCurso + "</br>");
                    out.println(consulta + "</br>");
                    //.println(consultaCursos + "</br>");
                } finally {
                    try {
                    
                        consultaCurso.close();
                        conexion.close();
                    } catch (Exception e) {
                    }
                }
            %>
            </div>
    </body>
</html>