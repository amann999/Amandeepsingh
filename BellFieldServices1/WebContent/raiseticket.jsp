<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="css/bootstrap.min.css">

        <title>Bell Field Services</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">Bell Field Services</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp">Home </a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="raiseticket.jsp">Raise A Ticket <span class="sr-only">(current)</span></a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="view_all_ticket.jsp">View All Tickets</a>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="container my-2">
            <div class="alert alert-danger alert-dismissible fade show" role="alert" id="dangeralert" style="display: none">
                Something Went Wrong!! Please Try Again.
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="alert alert-success alert-dismissible fade show" role="alert" id="successalert" style="display: none">
                Ticket raised Successfully.
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <h4 class="text-center">Raise a Ticket</h4>
            <form>
                <div class="form-group">
                    <label for="projectName">Project Name</label>
                    <input type="text" class="form-control" id="projectName" placeholder="Enter project name" onkeyup="$(this).removeClass('is-invalid')">
                    <small id="nameHelp" class="form-text text-muted">Name of the project for which concern is being raised.</small>
                </div>
                <div class="form-group">
                    <label for="departmentName">Department Name</label>
                    <select class="form-control" id="departmentName" onchange="$(this).removeClass('is-invalid')">
                        <option value="-1" disabled selected>--------</option>
                    </select>
                    <small id="departmentHelp" class="form-text text-muted">Department name for which concern is being raised.</small>
                </div>
                <div class="form-group">
                    <label for="requestedBy">Requested By</label>
                    <select class="form-control" id="requestedBy" onchange="$(this).removeClass('is-invalid')">
                        <option value="-1" disabled selected>--------</option>
                    </select>
                    <small id="requestedByHelp" class="form-text text-muted">Concern is requested by which employee.</small>
                </div>
                <div class="form-group">
                    <label for="descriptionOfProblem">Description Of Problem</label>
                    <textarea id="descriptionOfProblem" class="form-control" rows="5" onkeyup="$(this).removeClass('is-invalid')"></textarea>
                    <small id="descriptionOfProblemHelp" class="form-text text-muted">Detailed description of the concern being raised.</small>
                </div>
                <div class="text-right">
                    <button type="reset" class="btn btn-outline-dark">Reset</button>
                    <button type="submit" class="btn btn-success">Submit</button>
                </div>
            </form>
        </div>
        <script src="js/jquery-3.4.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script type="text/javascript">

                        var dept_emp_data;
                        $(document).ready(function () {
                            $.getJSON("get_emp_dept", function (data) {
                                dept_emp_data = data;
                                for (var item in dept_emp_data) {
                                    var temp = dept_emp_data[item];
                                    $('#departmentName').append("<option value ='" + temp.dept + "'>" + temp.dept + '</option');
                                }
                            });
                        });

                        $('#departmentName').on('change', function (e)
                        {
                            $('#requestedBy').find('option').not(':first').remove();
                            var dept = $('#departmentName option:selected').val();
                            for (var item in dept_emp_data) {
                                var temp = dept_emp_data[item];
                                if (temp.dept === dept)
                                {
                                    $('#requestedBy').append("<option value ='" + temp.emp_name + "'>" + temp.emp_name + '</option');
                                }
                            }
                        });

                        $("form").submit(function (e) {
                            $('#successalert').css('display', 'none');
                            $('#dangeralert').css('display', 'none');
                            e.preventDefault();
                            var projectName = $('#projectName').val();
                            var departmentName = $('#departmentName option:selected').val();
                            var requestedBy = $('#requestedBy option:selected').val();
                            var descriptionOfProblem = $('#descriptionOfProblem').val();
                            if (projectName === '')
                            {
                                $('#projectName').addClass('is-invalid');
                                return false;
                            }
                            if (descriptionOfProblem === '')
                            {
                                $('#descriptionOfProblem').addClass('is-invalid');
                                return false;
                            }
                            if (departmentName === '-1')
                            {
                                $('#departmentName').addClass('is-invalid');
                                return false;
                            }
                            if (requestedBy === '-1')
                            {
                                $('#requestedBy').addClass('is-invalid');
                                return false;
                            }
                            $.post('raise_a_ticket', {
                                "projectName": projectName,
                                "descriptionOfProblem": descriptionOfProblem,
                                "requestedBy": requestedBy,
                                "departmentName": departmentName
                            }, function (data) {
                                if (data === "true")
                                {
                                    $('#successalert').css('display', 'block');
                                } else
                                {
                                    $('#dangeralert').css('display', 'block');
                                }
                            });
                        });

        </script>
    </body>
</html>