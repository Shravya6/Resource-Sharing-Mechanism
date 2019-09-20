<%-- 
    Document   : t2reg1
    Created on : Jul 10, 2017, 12:00:51 PM
    Author     : java3
--%>

<%@page import="network.Mail"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.util.Random"%>
<%@page import="network.DbConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String id=request.getParameter("t2id");
    String name = request.getParameter("name");
    String pass = request.getParameter("pass");
    String pass1=request.getParameter("pass1");
    String email = request.getParameter("email");
    String tenant = "tenant2";
    String dob = request.getParameter("dob");
    String country = request.getParameter("country");
    String gender = request.getParameter("gender");
    String policy = request.getParameter("policy");
    System.err.println("Name==" + name + "\npass==" + pass + "\nemail==" + email + "\ntenant==" + tenant + "\ndob==" + dob + "\ncountry==" + country + "\ngender==" + gender);
    Connection conn = DbConnection.getConnection();
    Statement sto = conn.createStatement();
    try {
        if(pass.equals(pass1)){
 Random RANDOM = new SecureRandom();
            int PASSWORD_LENGTH = 4;
            String letters = "0123456789";
            String uid = "";
            for (int i = 0; i < PASSWORD_LENGTH; i++) {
                int index = (int) (RANDOM.nextDouble() * letters.length());
                uid += letters.substring(index, index + 1);
            }
            String msgg ="pk"+uid;
            System.out.println("msgg");
        int i = sto.executeUpdate("insert into t2(id,name, pass, mail, tenant, gen, dob, country, pkey, policy)values('"+ id +"','" + name + "','" + pass + "','" + email + "','" + tenant + "','" + gender + "','" + dob + "','" + country + "','"+msgg+"','"+policy+"')");
        if (i != 0) {

 Mail ma= new Mail();
            ma.secretMail(msgg,name,email);          
            String msg= "Public key "+msgg;
            System.out.println("success");
            System.out.println("success");
            %>
<script type="text/javascript">
           window.alert("Registered Successfully"); 
           window.location="t2log.jsp";
           </script>
           <%
        } }else {
            %>
             <script type="text/javascript">
           window.alert("Password and Re-enter password did not match. Kindly register again"); 
           window.location="t2reg.jsp";
           </script>
           
          <%
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>