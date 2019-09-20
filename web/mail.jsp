

<%@ page import ="java.sql.*" %>
<%@page import="network.Mail"%>
<%
{
   String url = "jdbc:mysql://localhost:3306/ctac";
        String user = "root";
        String password = "root";
        //int id=Integer.parseInt(request.getQueryString());
        //System.out.println("id get successfully"+id);
            Connection conn = DriverManager.getConnection(url, user, password);
           String id=request.getParameter("id");
            String title=request.getParameter("title");
            System.out.println(title);
            String sql = "Select *  from request where id = '" + id + "' and title='"+title+"' ";
            PreparedStatement statement = conn.prepareStatement(sql);
            ResultSet result = statement.executeQuery();
            if(result.next()) {
       
             String name =result.getString("name");
            String email =result.getString("email");
            session.setAttribute( "Email", email );
            String msg =result.getString("secret_key");
             session.setAttribute( "Key", msg );  
session.setAttribute("Title",title);
           
            Mail.secretMail(msg,name,email);
           
           response.sendRedirect("activate.jsp");
     }else{
           response.sendRedirect("userrequest.jsp");
     }
     }
%>

