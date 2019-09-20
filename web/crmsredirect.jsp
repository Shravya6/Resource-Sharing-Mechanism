<%-- 
    Document   : crmsredirect
    Created on : Jul 11, 2017, 6:26:50 PM
    Author     : java3
--%>

<%@page import="network.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String t2tenant=request.getParameter("t2tenant");
String fid=request.getParameter("fid");
String oid=request.getParameter("oid");
String uid=request.getParameter("t2id");
String filename=request.getParameter("filename");
 Connection con = null;
    Statement st = null;
    Statement st1 = null;
    ResultSet rs = null;
    Connection conn = DbConnection.getConnection();
    Statement sto = conn.createStatement();
    st = conn.createStatement();
    st1 = conn.createStatement();
    try {                       
            int i = sto.executeUpdate("update filereq set status='Redirected' where fid='" + fid + "' And status='Forward' And oid='"+oid+"' And t2id='"+uid+"'");
           System.out.println("Redirect Attributes=="+t2tenant+fid+oid+uid+filename);
            if (i != 0) {                               
                System.out.println("success");
                %>
           <script type="text/javascript">
           window.alert("Redirected Successfully"); 
           window.location="crmsvrequest.jsp";
           </script>
          <%
                
            } else {
                System.out.println("failed");
            }
        
    } catch (Exception ex) {
        ex.printStackTrace();
    }

%>