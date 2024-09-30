<%
String mail = null;
if (session.getAttribute("email") != null) {
    mail = session.getAttribute("email").toString();
    out.println("Email: " + mail);
} else {
    out.println("No email set in session.");
}
%>
