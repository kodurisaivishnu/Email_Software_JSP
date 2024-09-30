<%@page import="java.sql.*"%>
<%
try{
    String email=request.getParameter("email");
    String password=request.getParameter("password");

    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/soft","root","Saivishnu@123");

    if (email != null && !email.trim().isEmpty() && password != null && !password.trim().isEmpty())
    {
        PreparedStatement ps =conn.prepareStatement("select * from users where email=? and password=?");

        ps.setString(1,email.trim());
        ps.setString(2,password.trim());
        ResultSet rs=ps.executeQuery();
        if(rs.next()){
            out.println("<h1>User Found!</h1>");
            String id=rs.getString("email");
            session.setAttribute("email",id);
            response.sendRedirect("inbox.jsp");
        }else{
            response.sendRedirect("go.jsp?msg=Invalid Credintials!");
        }
    }else{
        response.sendRedirect("go.jsp?msg=Fields Can't Be Null!");
    }
}catch(Exception e){
    out.println(e.getMessage());
}
%>