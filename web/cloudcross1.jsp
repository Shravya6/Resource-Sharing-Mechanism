<%-- 
    Document   : cloudcross1
    Created on : Jul 12, 2017, 3:40:49 PM
    Author     : java3
--%>

<%@page import="network.Mail"%>
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
String uid=request.getParameter("t2ids");
String filename=request.getParameter("filename");
String t1tenant=request.getParameter("t1tenant");
String t2policy=request.getParameter("t2policies");
String fpolicy=request.getParameter("fpolicies");
String t2mail=request.getParameter("t2mail");
System.out.println("CLOUD Approving=="+t2tenant+fid+oid+uid+filename+t1tenant+t2policy+fpolicy);
 Connection con = null;
    Statement st = null;
    Statement st1 = null;
    ResultSet rs = null;
    Connection conn = DbConnection.getConnection();
    Statement sto = conn.createStatement();
    st = conn.createStatement();
    st1 = conn.createStatement();
    try {                       
            int i = sto.executeUpdate("update filereq set status='Approved' where fid='" + fid + "' And status='Approving' And oid='"+oid+"' And t2id='"+uid+"' And fpolicy='"+t2policy+"' And t2policy='"+fpolicy+"'");
           System.out.println("Redirect Attributes=="+t2tenant+fid+oid+uid+filename);
            if (i != 0) {                               
                System.out.println("success");
                %>
           <script type="text/javascript">
           window.alert("Approved Successfully"); 
           window.location="cloudcross.jsp";
           </script>
          <%
                
            } else {
               int j = st1.executeUpdate("update filereq set status='Not Approved' where fid='" + fid + "' And status='Approving' And oid='"+oid+"' And t2id='"+uid+"' And fpolicy!='"+t2policy+"' And t2policy!='"+fpolicy+"'");
                Mail ma= new Mail();
                String mssg="Backward Revocation:"+"\nYour Permission Request of this File"+fid+"."+filename+"is Denied because of mismatch of Attributes";
            ma.secretMail(mssg,filename,t2mail);          
            String msg= "Permission Denied:"+mssg; 
               System.out.println("failed");
                %>
           <script type="text/javascript">
           window.alert("Approval Failed"); 
           window.location="cloudcross.jsp";
           </script>
          <%
                
            }
        
    } catch (Exception ex) {
        ex.printStackTrace();
    }

%>