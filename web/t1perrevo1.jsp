<%-- 
    Document   : t1perrevo1
    Created on : Jul 12, 2017, 6:41:18 PM
    Author     : java3
--%>

<%@page import="network.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String t2tenant=request.getParameter("t2tenant");
String fid=request.getParameter("fid");
String oid=request.getParameter("oid");
String uid=request.getParameter("uid");
 Connection con = null;
    Statement st = null;
    Statement st1 = null;
    ResultSet rs = null;
    Connection conn = DbConnection.getConnection();
    Statement sto = conn.createStatement();
    st = conn.createStatement();
    st1 = conn.createStatement();
    try {                       
            int i = sto.executeUpdate("update filereq set status1='Revoked' where fid='" + fid + "' And status='sent' And status1='GRANTED' And oid='"+oid+"' And t2id='"+uid+"'");
            if (i != 0) {                               
                System.out.println("success");
                %>
           <script type="text/javascript">
           window.alert("Revoked successfully"); 
           window.location="t1perrevo.jsp";
           </script>
          <%
                
            } else {
                System.out.println("failed");
            }
        
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>