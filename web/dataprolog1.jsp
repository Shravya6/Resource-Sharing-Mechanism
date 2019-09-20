<%-- 
    Document   : loginaction
    Created on : Feb 23, 2016, 3:43:53 PM
    Author     : java4
--%>

<%@page import="java.util.UUID"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Random"%>

<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ctac","root","root");
    
    Statement st = null;
   ResultSet rs = null;

    
      String id = request.getParameter("name");
       String pass = request.getParameter("pass");
	   String role = "dataowner";
  

        st = con.createStatement();
      
                    rs = st.executeQuery("select * from provider where id='" + id + "' AND pass='" + pass + "'");
                    if (rs.next()) {
                        session.setAttribute("dpname",rs.getString("id"));
                        session.setAttribute("sssname", rs.getString("name"));
                        session.setAttribute("dpname",rs.getString("id"));
                        response.sendRedirect("dphome.jsp?msg=success");
                    } else {
                        %>
           <script type="text/javascript">
           window.alert("Incorrect username or password"); 
           window.location="dataprolog.jsp";
           </script>
          <%
                    }
               
%>