<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Inbox</title>
    <style>
        *{
            text-align:center;
            margin:0px;
        }
        h3{
            background-color:lightblue;
            height:30px;
            padding-top:10px;
        }
        #nav{
            width:100%;
            background-color:brown;
            margin-top:2px;
        }
        a{
            color:white;
            text-decoration:none;
        }
        #data{
            margin:5px;
            width:1000px;
            height:50%;
            margin:auto;
        }
        #show{
            color:red;
        }

    </style>
</head>
<body>
    <h3>
        <%
            String email=session.getAttribute("email").toString();
            out.println("Welcome '"+email+"' to INBOX <br><br>");
        %>
    </h3>
    <table id="nav">
        <tr>
            <th><a href="inbox.jsp"> Home </a></th>
            <th><a href="inbox.jsp"> InBox </a></th>
            <th><a href="sentbox.jsp"> sentbox </a></th>
            <th><a href="compose.jsp"> compose mail </a></th>
        </tr>
    <table>

<table id="data">
    <tr>
        <th>Received From</th>
        <th>Subject</th>
        <th><input type="button" value="delete" onclick="f1()"></th>
    </tr>
<%
        try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/soft","root","Saivishnu@123");
        PreparedStatement ps =conn.prepareStatement("select * from mail where mto=? and inbox=1");
        ps.setString(1,email);
        ResultSet rs=ps.executeQuery();
        while(rs.next()){
            String mid=rs.getString("mid");
            String mfrom=rs.getString("mfrom");
            String sub=rs.getString("sub");

            out.println("<tr>");
            out.println("<td>"+mfrom + "</td>");
            out.println("<td><a id='show' href='view.jsp?mid="+mid+"'>"+sub+"</a></td>");
            out.println("<td><input type='checkbox' name='select' id='select' value="+mid+"></td>");
            out.println("</tr>");
        }
}catch(Exception e){
    out.println(e.getMessage());
}
%>
</table>

<script>
    function f1()
    {
        chk=document.querySelectorAll("input[name=select]:checked");
        values=[];
        chk.forEach((ch)=>{
            values.push(ch.value);
        });
        if(values.length>0)
        {
            let url="delInbox.jsp?ids="+values.join(",");
            window.location.href=url;
        }else{
            alert("not selected");
        }
    }
</script>
</body>

</html>