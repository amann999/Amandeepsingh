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
                    <li class="nav-item ">
                        <a class="nav-link" href="raiseticket.jsp">Raise A Ticket </a>
                    </li>

                    <li class="nav-item active">
                        <a class="nav-link" href="view_all_ticket.jsp">View All Tickets <span class="sr-only">(current)</span></a>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="container my-2">


            <h4 class="text-center">View Tickets</h4>

            <h6 class="my-4" style="color: darkred;text-align: center;display: none" id="noTicket">
                No Ticket Available.
            </h6>
            <div class="justify-content-lg-end">
                <input class="form-control mr-sm-2 col-4" id="search" type="search" placeholder="Search" aria-label="Search">
            </div>
            <div class="row" style="margin-top: 1em;" id="main">

            </div>

        </div>
        <script src="js/jquery-3.4.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/handlebars-v4.7.3.js"></script>
        <script type="text/javascript">

            var tickets;
            $(document).ready(function () {
                $.getJSON("get_all_tickets", function (data) {
                    tickets = data;
                    if (tickets.length !== 0)
                    {
                        for (var temp in tickets)
                        {
                            var ticket = tickets[temp];
                            var template = Handlebars.compile($('#row-template').text());
                            var html = template(ticket);
                            $('#main').append(html);
                        }
                    } else
                    {
                        $('#noTicket').css('display', 'block');
                        $('#search').css('display', 'none');
                    }
                });
            });

            $('#search').on('keyup', function () {
                var text = $('#search').val().toLowerCase();
                $("#main > div").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(text) > -1);
                });
            });

            Handlebars.registerHelper('convertTime', function (data) {
                var millis = parseInt(data);
                return new Date(millis).toLocaleString();
            });

        </script>

        <script type="text/x-handlebars-template" id="row-template">
            <div class="col-sm-6 my-1">
            <div class="card" style="background:whitesmoke">
            <div class="card-body">
            <span style="display: block;text-align: right">{{convertTime doc}}</span>
            <h5 class="card-title" style="text-transform: uppercase">{{projectName}}</h5>
            <p class="card-text">
            <b>Description </b>: {{description}}
            <br><b>Requested By</b>: {{requestedBy}}
            <br><b>Department : </b>: {{department}}
            </p>
            </div>
            </div>
            </div>
        </script>
    </body>
</html>