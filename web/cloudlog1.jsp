<%-- 
    Document   : cloudlog1
    Created on : Jul 10, 2017, 6:37:07 PM
    Author     : java3
--%>

<%
String name = request.getParameter("name");
    String pass = request.getParameter("pass");
    try {
        if (name.equalsIgnoreCase("cloud") && pass.equalsIgnoreCase("cloud")) {
            response.sendRedirect("cloudhome.jsp");
        } else {
            %>
           <script type="text/javascript">
           window.alert("Incorrect username or password"); 
           window.location="cloudlog.jsp";
           </script>
          <%
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>