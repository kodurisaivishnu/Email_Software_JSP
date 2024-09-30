<%
session.invalidate();
response.sendRedirect("go.jsp?msg=You are Logged out");
%>