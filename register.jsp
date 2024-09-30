<%@page import="java.sql.*"%>
<%

try{
    String email=request.getParameter("email");
    String password=request.getParameter("password");

    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/soft","root","Saivishnu@123");
    out.println("<h1>Connection Sucessful!</h1>");

    if (email != null && !email.trim().isEmpty() && password != null && !password.trim().isEmpty())
    {
        PreparedStatement ps =conn.prepareStatement("INSERT INTO users VALUES (?,?)");

        ps.setString(1,email);
        ps.setString(2,password);
        int i=ps.executeUpdate();
        if(i>0){
            out.println("<h2>SucessFull Entry to DB</h2>");
        }else{
            response.sendRedirect("login.jsp?msg=Fields_Can't_Be_Null!");
        }
    }else{
        response.sendRedirect("login.jsp?msg=Fields_Can't_Be_Null!");
    }

}catch(Exception e){
    out.println(e.getMessage());
}


%>