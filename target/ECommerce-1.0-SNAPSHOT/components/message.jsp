<%
    String message = (String) session.getAttribute("message");
    if (message != null) {
//        out.println(message);
//        session.removeAttribute("message");
%>
<div class="container text-center">
    <br>
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        <strong class="text-center"><%= message%></strong>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
</div>
<%
    }
%>