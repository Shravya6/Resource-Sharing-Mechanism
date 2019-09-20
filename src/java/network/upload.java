/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package network;

import com.oreilly.servlet.MultipartRequest;
import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import network.DbConnection;
import network.Ftpcon;

/**
 *
 * @author IBN5
 */
public class upload extends HttpServlet {

    File file;
    final String filepath = "D:/";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        HttpSession user = request.getSession(true);
        String t1id = user.getAttribute("t1id").toString();
        String t1name = user.getAttribute("t1name").toString();
        String t1mail = user.getAttribute("t1mail").toString();
        String t1tenant = user.getAttribute("t1tenant").toString();

        try {

            MultipartRequest m = new MultipartRequest(request, filepath);

            String title = m.getParameter("fname");
            String des = m.getParameter("des");
            String skey = m.getParameter("skey");
            String policy = m.getParameter("policy");
            System.out.println("File Upload Attributes==" + t1id + t1name + t1mail + t1tenant);
            File file = m.getFile("file");
            String filename = file.getName().toLowerCase();

            double size = file.length();

            Connection con = DbConnection.getConnection();
            Statement st3 = con.createStatement();
            ResultSet rs = null;
            BufferedReader br = new BufferedReader(new FileReader(filepath + filename));
            StringBuffer sb = new StringBuffer();
            String temp = null;

            while ((temp = br.readLine()) != null) {
                sb.append(temp);
            }
            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            Date date = new Date();
            String time = dateFormat.format(date);
            user.setAttribute("stime", time);
            System.out.println("Session set Time ----------------------------------------> : " + time);
            boolean status = new Ftpcon().upload(file);
            if (status) {
                Statement st = con.createStatement();

                st.executeUpdate("insert into fileupload(filename, content, oname, oid, dtime, fsize, tenant, des, skey, title, policy)values('" + file.getName() + "', '" + sb.toString() + "', '" + t1name + "', '" + t1id + "', '" + time + "', '" + size + "', '" + t1tenant + "', '" + des + "', '" + skey + "','" + title + "','"+policy+"')");
                response.sendRedirect("fileupload.jsp?msg=File Uploaded");

            } else {
                out.println("error");
            }

        } catch (Exception e) {
            out.println(e);
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}