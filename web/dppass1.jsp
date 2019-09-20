<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="network.DbConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String pass = request.getParameter("pass");
    String nupass=request.getParameter("nupass");
    String nupass1=request.getParameter("nupass1");
    String sssname=(String)session.getAttribute("sssname");String dpname=(String)session.getAttribute("dpname");
    Connection conn = DbConnection.getConnection();
    Statement sto = conn.createStatement();
    ResultSet rs=sto.executeQuery("select * from provider where name='"+sssname+"'");
    rs.next();
    String pwd=rs.getString(3);
    System.out.println(pwd);
if(pass.equals(pwd)){
        if(nupass.equals(nupass1)){
        PreparedStatement ps=conn.prepareStatement("update provider set pass=? where name='"+sssname+"'");
        ps.setString(1,nupass);
        
           
          
       int k=ps.executeUpdate();
       
        if(k!=0)
        {
            %>
            <script type="text/javascript">
           window.alert("Password updated successfully"); 
           window.location="dphome.jsp";
           </script>
            <% }}
                else{%>
                <script type="text/javascript">
           window.alert("Mismatch of Password and Re-enter Password"); 
           window.location="dppass.jsp";
           </script>
                   <%  } 
           }else{
               %>
               <script type="text/javascript">
           window.alert("You've entered wrong current password"); 
           window.location="dppass.jsp";
           </script>
               
               <%
               
           }
        %>

