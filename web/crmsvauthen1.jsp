<%-- 
    Document   : crmsvauthen1
    Created on : Jul 12, 2017, 3:09:04 PM
    Author     : java3
--%>

<%@page import="network.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String t2tenant=request.getParameter("t2tenant");
String fid=request.getParameter("fid");
String oid=request.getParameter("oid");
String uid=request.getParameter("t2id");
String filename=request.getParameter("filename");
String t1tenant=request.getParameter("t1tenant");

System.out.println("T2 Authentication=="+t2tenant+fid+oid+uid+filename+t1tenant);
 Connection con = null;
    Statement st = null;
    Statement st1 = null;
    ResultSet rs = null;
    Connection conn = DbConnection.getConnection();
    Statement sto = conn.createStatement();
    st = conn.createStatement();
    st1 = conn.createStatement();
    try {                       
            int i = sto.executeUpdate("update filereq set status='Approving' where fid='" + fid + "' And status='Authenticated' And oid='"+oid+"' And t2id='"+uid+"'");
           System.out.println("Redirect Attributes=="+t2tenant+fid+oid+uid+filename);
            if (i != 0) {                               
                System.out.println("success");
                %>
           <script type="text/javascript">
           window.alert("Sent Successfully to cloud"); 
           window.location="crmsvauthen.jsp";
           </script>
          <%
               
            } else {
                System.out.println("failed");
                %>
           <script type="text/javascript">
           window.alert("Authentication Failed"); 
           window.location="crmsvauthen.jsp";
           </script>
          <%
            }
        
    } catch (Exception ex) {
        ex.printStackTrace();
    }

%>
