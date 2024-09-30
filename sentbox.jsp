<%@page import="java.sql.*"%>
<html>
<head>
    <title>SENTBOX</title>
    <style>
        h3{
            text-align:center;
            background-color:lightblue;
            height:30px;
            padding-top:10px;
        }
        td a{
            text-decoration:none;
            color:red;
        }
    </style>
<head>
<body>
    <h3>
        <%
            String email=session.getAttribute("email").toString();
            out.println("Welcome '"+email+"' to SentBox <br><br>");
        %>
    </h3>


    <form action="delSnt.jsp">
        <table align="center" width="75%">
        <tr>
            <th>Sent TO</th>
            <th>SubJect</th>
            <th> <input type="submit" value="delete"> </th>
        </tr>
        <%
            ResultSet rs=null;
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/soft","root","Saivishnu@123");
                PreparedStatement ps=conn.prepareStatement("select * from mail where mfrom=? and sentbox=1");
                ps.setString(1,email);
                rs=ps.executeQuery();
            }catch(Exception e)
            {
                out.println(e);
            }
            while(rs.next())
            {
                String mid=rs.getString("mid");
                out.println("<tr>");
                    out.println("<td align='center'>");
                        out.println(rs.getString("mto"));
                    out.println("</td>");
                    out.println("<td align='center'>");
                        out.println("<a href=viewSnt.jsp?mid="+mid+" "+">"+rs.getString("sub")+"</a>");
                    out.println("</td>");
                     out.println("<td align='center'>");
                        out.println("<input type='checkbox' name='selected' value="+mid+">");
                    out.println("</td>");
                out.println("</tr>");
            }
        %>
    </table>
    </form>
</body>
<html>