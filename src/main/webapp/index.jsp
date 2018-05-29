<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="nl.ecliptic.bep.friendspammer.EmailSender" %>
<%@ page import="nl.ecliptic.bep.friendspammer.MongoSaver" %>
<%@ page import="nl.ecliptic.bep.friendspammer.resources.HistoryRecord" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Collections" %>
<%
    if (request.getParameter("methode") != null && request.getParameter("methode").equals("email")) {
        String subject = request.getParameter("subject");
        String to = request.getParameter("to");
        String message = request.getParameter("message");
        boolean html = Boolean.valueOf(request.getParameter("html"));

        if(to.contains(",")) {
            String[] toList = to.split(",");
            System.out.println(toList);
            EmailSender.sendEmail(subject, toList, message, html);
        } else {
            EmailSender.sendEmail(subject, to, message, html);
        }

    }
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
    <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
    <title>Hello, world!</title>
    <style>
        body {
            background: #f2f2f2;
        }
        a.mdl-layout__tab:hover {
            color: #fff;
        }
        .mdl-textfield {
            padding-bottom: 28px;
            width: 100%;
        }
        .form-ding {
            margin-top: 20px;
        }
        .form-ding:first-child {
            margin-top: 0;
        }
        .form-ding button.btn-submit {
            width: 100%;
            outline: none;
            height: 64px;
            line-height: 64px;
            font-size: 16px;
        }
        .card {
            width: 100%;
            margin-top: 40px;
            margin-bottom: 60px;
            padding: 24px;
        }
        .list-group-item {
            border: 0;
            padding-bottom: 24px;
        }
        .cut-txt {
            text-overflow: ellipsis;
            overflow: hidden;
            white-space: nowrap;
        }
    </style>
</head>
<body>

<!-- Simple header with fixed tabs. -->
<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header
            mdl-layout--fixed-tabs">
    <header class="mdl-layout__header">
        <div class="mdl-layout__header-row">
            <!-- Title -->
            <span class="mdl-layout-title">Friendspammer</span>
            <div class="mdl-layout-spacer"></div>
            <nav class="mdl-navigation mdl-layout--large-screen-only">
                <a class="mdl-navigation__link" href="">Home</a>
                <a class="mdl-navigation__link" href="old_index.jsp">Old index</a>
                <a class="mdl-navigation__link" href="old_history.jsp">Old history</a>
            </nav>
        </div>
        <!-- Tabs -->
        <div class="mdl-layout__tab-bar mdl-js-ripple-effect">
            <a href="#fixed-tab-1" class="mdl-layout__tab is-active">Spam people</a>
            <a href="#fixed-tab-2" class="mdl-layout__tab">My history</a>
        </div>
    </header>
    <div class="mdl-layout__drawer">
        <span class="mdl-layout-title">Friendspammer</span>
        <nav class="mdl-navigation">
            <a class="mdl-navigation__link" href="">Home</a>
            <a class="mdl-navigation__link" href="old_index.jsp">Old index</a>
            <a class="mdl-navigation__link" href="old_history.jsp">Old history</a>
        </nav>
    </div>
    <main class="mdl-layout__content">
        <section class="mdl-layout__tab-panel is-active" id="fixed-tab-1" style="user-select: none">
            <div class="page-content">
                <div class="container">
                    <div class="row">
                        <div class="col-12">


                            <div class="card mdl-card mdl-shadow--2dp">
                                <form action="#">

                                    <!-- subject -->
                                    <div class="form-ding">
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                            <input class="mdl-textfield__input"
                                                   type="text"
                                                   id="subject"
                                                   name="subject">
                                            <label class="mdl-textfield__label" for="subject">Onderwerp</label>
                                        </div>
                                    </div>

                                    <!-- to -->
                                    <div class="form-ding">
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                            <input class="mdl-textfield__input"
                                                   type="text"
                                                   id="to"
                                                   name="to"
                                                   value="ee48d7379f-9f0226@inbox.mailtrap.io">
                                            <label class="mdl-textfield__label" for="to">Aan</label>
                                        </div>
                                    </div>

                                    <!-- message -->
                                    <div class="form-ding">
                                        <div class="mdl-textfield mdl-js-textfield">
                                            <textarea class="mdl-textfield__input"
                                                      rows="3"
                                                      name="message"
                                                      id="message"></textarea>
                                            <label class="mdl-textfield__label" for="message">Bericht</label>
                                        </div>
                                    </div>


                                    <!-- asHtml -->
                                    <div class="form-ding">
                                        <label class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="html">
                                            <input type="checkbox"
                                                   class="mdl-switch__input"
                                                   id="html"
                                                   name="html"
                                                   value="true">
                                            <span class="mdl-switch__label">Verstuur als HTML</span>
                                        </label>
                                    </div>

                                    <!-- email/sms -->
                                    <div class="form-ding">
                                        <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="email">
                                            <input type="radio"
                                                   class="mdl-radio__button"
                                                   id="email"
                                                   name="methode"
                                                   value="email"
                                                   checked>
                                            <span class="mdl-radio__label">Email</span>
                                        </label>
                                        <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="sms">
                                            <input type="radio"
                                                   class="mdl-radio__button"
                                                   id="sms"
                                                   name="methode"
                                                   value="sms"
                                                   disabled>
                                            <span class="mdl-radio__label">(sorry SMS werkt nog niet) </span>
                                        </label>
                                    </div>

                                    <div class="form-ding">
                                        <button type="submit" class="btn-submit mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--colored">
                                            Gooi mail
                                        </button>
                                    </div>

                                </form>
                            </div>


                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="mdl-layout__tab-panel" id="fixed-tab-2">
            <div class="page-content">
                <div class="container">
                    <div class="row">
                        <div class="col-12">


                            <div class="card mdl-card mdl-shadow--2dp">
                                <div class="list-group">
                                    <% List<HistoryRecord> history = MongoSaver.getEmailHistory(); %>
                                    <% for(int i = history.size() - 1; i >= 0; i--) { %>
                                    <a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
                                        <div class="d-flex w-100 justify-content-between">
                                            <h5 class="mb-1"><%= history.get(i).getSubject() %></h5>
                                            <small class="cut-txt"><span id="h<%=i%>-from"><%= history.get(i).getFrom() %></span> | <span id="h<%=i%>-to"><%= history.get(i).getTo() %></span></small>
                                        </div>
                                        <p class="mb-1"><%= history.get(i).getText() %></p>
                                        <small>HTML: <%= history.get(i).getAsHtml() %></small>
                                    </a>
                                    <div class="mdl-tooltip" data-mdl-for="h<%=i%>-from">From: <%= history.get(i).getFrom() %></div>
                                    <div class="mdl-tooltip" data-mdl-for="h<%=i%>-to">To: <%= history.get(i).getTo() %></div>
                                    <% } %>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
</div>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
</body>
</html>