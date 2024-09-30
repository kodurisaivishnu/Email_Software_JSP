<%@page import="java.sql.*"%>
<%
try{
    String mfrom=request.getParameter("mfrom");
    String mto=request.getParameter("mto");
    String sub=request.getParameter("sub");
    String text=request.getParameter("text");


    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/soft","root","Saivishnu@123");
    PreparedStatement ps =conn.prepareStatement("insert into mail(mfrom,mto,sub,mtext,sentbox,inbox) values(?,?,?,?,?,?)");
    ps.setString(1,mfrom);
    ps.setString(2,mto);
    ps.setString(3,sub);
    ps.setString(4,text);
    ps.setInt(5,1);
    ps.setInt(6,1);
    int i=ps.executeUpdate();
    if(i>0){
        out.println("mail sent");
        response.sendRedirect("compose.jsp?msg=MAIL_SENT_SUCESS!");
    }else{
        out.println("mail not sent");
    }
}catch(Exception e){
    out.println(e.getMessage());
}
%>