<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="network.DbConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String ssname=(String)session.getAttribute("ssname");String duname=(String)session.getAttribute("duname");
    System.out.println("DU id is" + duname);
    String pass = request.getParameter("pass");
    String nupass=request.getParameter("nupass");
    String nupass1=request.getParameter("nupass1");
    
    Connection conn = DbConnection.getConnection();
    Statement sto = conn.createStatement();
    ResultSet rs=sto.executeQuery("select * from user where name='"+ssname+"'");
    rs.next();
    String pwd=rs.getString("pass");
    System.out.println(pwd);
if(pass.equals(pwd)){
        if(nupass.equals(nupass1)){
        PreparedStatement ps=conn.prepareStatement("update user set pass=? where name='"+ssname+"'");
        ps.setString(1,nupass);
        
           
          
       int k=ps.executeUpdate();
       
        if(k!=0)
        {
            %>
            <script type="text/javascript">
           window.alert("Password updated successfully"); 
           window.location="duhome.jsp";
           </script>
            <% }}
                else{%>
                <script type="text/javascript">
           window.alert("Mismatch of Password and Re-enter Password"); 
           window.location="dupass.jsp";
           </script>
                   <%  } 
           }else{
               %>
               <script type="text/javascript">
           window.alert("You've entered wrong current password"); 
           window.location="dupass.jsp";
           </script>
               
               <%
               
           }
        %>

