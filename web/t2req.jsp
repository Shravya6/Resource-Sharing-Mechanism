<%-- 
    Document   : t2req
    Created on : Jul 11, 2017, 3:12:24 PM
    Author     : java3
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="network.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String oid=request.getParameter("oid");
String fid=request.getParameter("fid");
String tenant=request.getParameter("tenant");
String filename=request.getParameter("filename");
String fskey=request.getParameter("fskey");
String fpolicy=request.getParameter("fpolicy");
String t2id=(String)session.getAttribute("t2id");
String t2name=(String)session.getAttribute("t2name");
String t2mail=(String)session.getAttribute("t2mail");
String t2tenant=(String)session.getAttribute("t2tenant");
String t2pkey=(String)session.getAttribute("t2pkey");
String t2policy=(String)session.getAttribute("t2policy");

Connection conn = DbConnection.getConnection();
    Statement sto = conn.createStatement();
    try {
 
        int i = sto.executeUpdate("insert into filereq(oid, otenant, fid, t2id, t2name, t2mail, status, status1, t2tenant, filename, t2pkey, t2policy, fpolicy, fskey)values('" + oid + "','" + tenant + "','" + fid + "','" + t2id + "','" + t2name + "','" + t2mail + "','Requested','Waiting','"+t2tenant+"','"+filename+"','"+t2pkey+"','"+t2policy+"','"+fpolicy+"','"+fskey+"')");
        if (i != 0) {
            System.out.println("success");
            %>
           <script type="text/javascript">
           window.alert("sucess"); 
           window.location="t2vt1file2.jsp";
           </script>
          <%
            
        } else {
            System.out.println("failed");
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>