<%-- 
    Document   : t2vt1file1
    Created on : Jul 11, 2017, 2:59:28 PM
    Author     : java3
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="network.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String pkey=request.getParameter("pkey");
String t2id=(String)session.getAttribute("t2id");
String t2name=(String)session.getAttribute("t2name");
 Connection con = DbConnection.getConnection();
    Statement st = con.createStatement();
    ResultSet rs = null;
    try {
        rs = st.executeQuery("select * from t2 where id='" + t2id + "' and pkey='" + pkey + "'");
        if (rs.next()) {
            session.setAttribute("t2id", rs.getString("id"));
            session.setAttribute("t2mail", rs.getString("mail"));
            session.setAttribute("t2name", rs.getString("name"));
            session.setAttribute("t2tenant", rs.getString("tenant"));
            System.out.println("Sucess");
            %>
           <script type="text/javascript">
           window.alert("Verification sucess"); 
           window.location="t2vt1file2.jsp";
           </script>
          <%
            
        } else {
            %>
           <script type="text/javascript">
           window.alert("Verification failed"); 
           window.location="t2vt1file.jsp";
           </script>
          <%
            
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
%>