<%-- 
    Document   : forward
    Created on : Jul 11, 2017, 4:58:44 PM
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
            int i = sto.executeUpdate("update filereq set status='Forward' where fid='" + fid + "' And status='Requested' And oid='"+oid+"' And t2id='"+uid+"'");
            if (i != 0) {                               
                System.out.println("success");
                %>
           <script type="text/javascript">
           window.alert("Forwarded Successfully"); 
           window.location="t1vt2request.jsp";
           </script>
          <%
                
            } else {
                System.out.println("failed");
            }
        
    } catch (Exception ex) {
        ex.printStackTrace();
    }



%>