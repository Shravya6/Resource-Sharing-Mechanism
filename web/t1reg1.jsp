<%-- 
    Document   : ureg1
    Created on : Jul 7, 2017, 4:42:07 PM
    Author     : java3
--%>

<%@page import="network.DbConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String id=request.getParameter("t1id");
    System.out.println(id);
    String name = request.getParameter("name");
    String pass = request.getParameter("pass");
    String pass1=request.getParameter("pass1");
    String email = request.getParameter("email");
    String tenant = "tenant1";
    String dob = request.getParameter("dob");
    String country = request.getParameter("country");
    String gender = request.getParameter("gender");
    System.err.println("Id==" + id + "\nName==" + name + "\npass==" + pass + "\nemail==" + email + "\ntenant==" + tenant + "\ndob==" + dob + "\ncountry==" + country + "\ngender==" + gender);
    Connection conn = DbConnection.getConnection();
    Statement sto = conn.createStatement();
  try{  
if(pass.equals(pass1)){
    System.out.println(id);
        int i = sto.executeUpdate("insert into t1(id,name, pass, mail, tenant, gen, dob, country)values('"+ id +"','" + name + "','" + pass + "','" + email + "','" + tenant + "','" + gender + "','" + dob + "','" + country + "')");
        if (i != 0) {


            System.out.println("success");
            %>
<script type="text/javascript">
           window.alert("Registered Successfully"); 
           window.location="t1log.jsp";
           </script>
           <%
        } }else {
            %>
             <script type="text/javascript">
           window.alert("Password and Re-enter password did not match. Kindly register again"); 
           window.location="t1reg.jsp";
           </script>
           
          <%
        }}
 catch (Exception ex) {
        ex.printStackTrace();
    }
    
    %>

