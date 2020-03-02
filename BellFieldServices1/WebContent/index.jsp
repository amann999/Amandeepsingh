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
                    <li class="nav-item active">
                        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="raiseticket.jsp">Raise A Ticket </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="view_all_ticket.jsp">View All Tickets</a>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="container my-2">
            <h6 class="my-4" style="color: darkred;text-align: center;display: none" id="noTicket">
                No Ticket Available.
            </h6>
            <div style="text-align: center">
                <canvas id="myChart" width="600" height="400"></canvas>    
            </div>


        </div>
        <script src="js/jquery-3.4.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/Chart.min.js"></script>
        <script type="text/javascript">

            var dept_emp_data;
            var ctx = document.getElementById('myChart').getContext('2d');
            $(document).ready(function () {
                $.getJSON("get_stats", function (res) {
                    console.log(res);
                    var labels = [];
                    var values = [];
                    for (var i in res)
                    {
                        labels.push(res[i]['projectName']);
                        values.push(res[i]['count']);
                    }
                    if (res && res.length > 0)
                    {
                        var myChart = new Chart(ctx, {
                            type: 'bar',
                            data: {
                                labels: labels,
                                datasets: [{
                                        label: 'No Of Tickets',
                                        data: values,
                                        barPercentage: 1,
                                        backgroundColor: [
                                            'rgba(255, 99, 132, 0.2)',
                                            'rgba(54, 162, 235, 0.2)',
                                            'rgba(255, 206, 86, 0.2)',
                                            'rgba(75, 192, 192, 0.2)',
                                            'rgba(153, 102, 255, 0.2)',
                                            'rgba(255, 159, 64, 0.2)'
                                        ],
                                        borderColor: [
                                            'rgba(255, 99, 132, 1)',
                                            'rgba(54, 162, 235, 1)',
                                            'rgba(255, 206, 86, 1)',
                                            'rgba(75, 192, 192, 1)',
                                            'rgba(153, 102, 255, 1)',
                                            'rgba(255, 159, 64, 1)'
                                        ],
                                        borderWidth: 1
                                    }],
                            }, options: {
                                responsive: false
                            }
                        });
                    } else
                    {
                        $('#noTicket').css('display', 'block');
                    }
                });
            });

        </script>
    </body>
</html>