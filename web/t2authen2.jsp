<%-- 
    Document   : t2authen1
    Created on : Jul 12, 2017, 11:57:28 AM
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
String t2tenant=(String)session.getAttribute("t2tenants");
String oid=(String)session.getAttribute("oids");
String fid=(String)session.getAttribute("fids");
String uid=(String)session.getAttribute("uids");
String filename=(String)session.getAttribute("filenames");
String t1tenant=(String)session.getAttribute("t1tenants");

String t2pkey=request.getParameter("pkey");

System.out.println("T2 Authentication=="+t2tenant+fid+oid+uid+filename+t1tenant+t2pkey);
 Connection con = null;
    Statement st = null;
    Statement st1 = null;
    ResultSet rs = null;
    Connection conn = DbConnection.getConnection();
    Statement sto = conn.createStatement();
    st = conn.createStatement();
    st1 = conn.createStatement();
    try {                       
            int i = sto.executeUpdate("update filereq set status='Authenticated' where fid='" + fid + "' And status='Redirected' And oid='"+oid+"' And t2id='"+uid+"' And t2pkey='"+t2pkey+"'");
           System.out.println("Redirect Attributes=="+t2tenant+fid+oid+uid+filename);
            if (i != 0) {                               
                System.out.println("success");
                %>
           <script type="text/javascript">
           window.alert("Authenticated Successfully"); 
           window.location="t2authen.jsp";
           </script>
          <%
                
            } else {
                System.out.println("failed");
                %>
           <script type="text/javascript">
           window.alert("Authentication failed"); 
           window.location="t2authen.jsp";
           </script>
          <%
            }
        
    } catch (Exception ex) {
        ex.printStackTrace();
    }

%>