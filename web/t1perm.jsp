<%-- 
    Document   : t1perm
    Created on : Jul 12, 2017, 5:39:43 PM
    Author     : java3
--%>

<%@page import="network.Mail"%>
<%@page import="network.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String t2tenant=request.getParameter("t2tenant");
String fid=request.getParameter("fid");
String oid=request.getParameter("oid");
String uid=request.getParameter("uid");
String t2mail=request.getParameter("t2mail");
String fskey=request.getParameter("fskey");
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
            int i = sto.executeUpdate("update filereq set status1='GRANTED' where fid='" + fid + "' And status='sent' And status1='approved' And oid='"+oid+"' And t2id='"+uid+"'");
           System.out.println("Redirect Attributes=="+t2tenant+fid+oid+uid);
            if (i != 0) { 
String msggg="File Download Key:"+fskey+"\nFile Id:"+fid;                  
                 Mail ma= new Mail();
            ma.secretMail(msggg,"Downloadkey",t2mail);          
            String msg= "File Download Key:"+msggg;                         
                System.out.println("success");
                %>
           <script type="text/javascript">
           window.alert("Request granted"); 
           window.location="t1permt2.jsp";
           </script>
          <%
                
            } else {
               
                System.out.println("failed");
               %>
           <script type="text/javascript">
           window.alert("Request failed"); 
           window.location="t1permt2.jsp";
           </script>
          <%
            }
        
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>