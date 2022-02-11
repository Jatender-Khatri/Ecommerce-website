<%-- 
    Document   : contact
    Created on : Feb 2, 2022, 7:19:55 PM
    Author     : MeGa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mycart - Contact</title>
        <%@include file="components/common_css_js.jsp" %>
        <link rel="stylesheet" href="css/contact.css"/>
        <link rel="stylesheet" href="css/footer.css"/>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <section class="main-contact-section py-5">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-10">
                        <div class="card py-5 card-body border-0 shadow">
                            <div class="row">
                                <div class="col-lg-5">
                                    <div class="card card-body card-contact bg-theme">
                                        <h1>Contact Us</h1>
                                        <div class="media mb-5 align-items-center">
                                            <div class="icon-part mr-3">
                                                <i class="fas fa-location-arrow " style="color: white"></i>
                                            </div>

                                            <div class="media-body">
                                                <h5 class="mt-0 text-white">Khatri Mohalla Umerkot</h5>

                                            </div>
                                        </div>
                                        <div class="media mb-5 align-items-center">
                                            <div class="icon-part mr-3">
                                                <i class="fas fa-phone " style="color: white"></i>
                                            </div>

                                            <div class="media-body">
                                                <h5 class="mt-0 text-white">+92 3351035477</h5>

                                            </div>
                                        </div>
                                        <div class="media mb-5 align-items-center">
                                            <div class="icon-part mr-3">
                                                <i class="fas fa-envelope " style="color: white"></i>
                                            </div>

                                            <div class="media-body">
                                                <h5 class="mt-0 text-white">kumarjatender0@gmail.com</h5>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-7">
                                    <form id="add-contact-form" action="AddContentServlet" method="POST" enctype="multipart/form-data">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Name</label>
                                            <input name="name" required type="text" class="form-control" name="name" aria-describedby="emailHelp" placeholder="Enter Name"  >
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">Mobile Number</label>
                                            <input  required type="number" class="form-control" name="number"  placeholder="Enter Number" >
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">Email</label>
                                            <input  required type="email" class="form-control" name="email" placeholder="Enter Email" >
                                        </div>
                                        <div class="text-center">
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script>
            $(document).ready(function () {
                $("#add-contact-form").on("submit", function (event) {
                    // this code gets called when form is submitted
                    event.preventDefault();
                    console.log("You hava clicked on submit..")
                    let form = new FormData(this);
                    //now requesting to server
                    $.ajax({
                        url: "AddContentServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            if (data.trim() == 'Done')
                            {
                                swal("Saved Successfully!", "Reply Back Inshallah", "success");
                            } else {
                                swal("Oops", "Something went wrong!", "error");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            swal("Oops", "Something went wrong!", "error");
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>
        <%@include  file="components/common_models.jsp" %>
        <%@include file="components/footer.jsp" %>
    </body>
</html>
