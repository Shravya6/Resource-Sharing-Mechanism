<%-- 
    Document   : loginaction
    Created on : Feb 23, 2016, 3:43:53 PM
    Author     : java4
--%>

<%@page import="java.util.UUID"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Random"%>

<%
Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ctac","root","root");
    Statement st = null;
    String id=request.getParameter("duid");
      String name = request.getParameter("name");
       String pass = request.getParameter("pass");
       String pass1=request.getParameter("pass1");
        String Eamil = request.getParameter("email");
         String dob = request.getParameter("dob");
          String gen = request.getParameter("gen");
         String role = "datauser";
        String State = request.getParameter("state");
       String Country = request.getParameter("country");
     
                 st = con.createStatement();
                 if(pass.equals(pass1)){
            int is = st.executeUpdate("insert into user(id,name, pass, email, dob, gen, role, state, country) values ('"+ id +"','" + name + "','" + pass + "','" + Eamil + "','" + dob + "','" + gen + "','" + role + "','" + State + "','" + Country + "')");                                           
                if (is != 0) {
                %>
<script type="text/javascript">
           window.alert("Registered Successfully"); 
           window.location="datauserlog.jsp";
           </script>
           <%
                }} else {
                     %>
             <script type="text/javascript">
           window.alert("Password and Re-enter password did not match. Kindly register again"); 
           window.location="datauserreg.jsp";
           </script>
           
          <%
                 }   

%>