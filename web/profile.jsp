
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%!
    // Method to escape special HTML characters
    public String escapeHtml(String value) {

        if (value == null) {
            return "";
        }

        return value.replace("&", "&amp;")
                    .replace("<", "&lt;")
                    .replace(">", "&gt;")
                    .replace("\"", "&quot;")
                    .replace("'", "&#x27;");
    }
%>

<%
    // Retrieve information passed from ProfileServlet
    String name = (String) request.getAttribute("name");
    String studentId = (String) request.getAttribute("studentId");
    String programme = (String) request.getAttribute("programme");
    String email = (String) request.getAttribute("email");
    String hobbies = (String) request.getAttribute("hobbies");
    String introduction = (String) request.getAttribute("introduction");
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>My Profile | Jashnithaa</title>

    <link rel="stylesheet" href="style.css">

    <style>

        .result-wrap {
            width: min(850px, calc(100% - 40px));
            margin: 75px auto;
        }

        .result-card {
            background: #ffffff;
            border: 1px solid #eee3e8;
            border-radius: 22px;
            padding: 38px;
            box-shadow: 0 22px 65px rgba(91,52,69,.09);
        }

        .result-heading {
            text-align: center;
            margin-bottom: 30px;
        }

        .result-heading h1 {
            font-size: clamp(2.4rem, 6vw, 4rem);
        }

        .profile-mark {
            width: 82px;
            height: 82px;
            margin: 0 auto 20px;
            border-radius: 50%;
            display: grid;
            place-items: center;
            background: #f7e8ee;
            color: #b96585;
            font: 2.5rem 'Playfair Display', serif;
        }

        .detail-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 14px;
        }

        
        
        .detail {
            padding: 17px;
            border: 1px solid #eee3e8;
            border-radius: 12px;
            background: #fdfbfc;
        }

        .detail.full {
            grid-column: 1 / -1;
        }

        .detail-label {
            display: block;
            color: #b96585;
            font-size: .65rem;
            font-weight: 700;
            letter-spacing: .12em;
            text-transform: uppercase;
            margin-bottom: 6px;
        }

        .detail-value {
            white-space: pre-wrap;
            overflow-wrap: anywhere;
            font-size: .9rem;
            font-weight: 700;
        }

        .result-actions {
            display: flex;
            justify-content: center;
            margin-top: 28px;
        }

        @media(max-width:600px) {

            .result-card {
                padding: 22px;
            }

            .detail-grid {
                grid-template-columns: 1fr;
            }

            .detail.full {
                grid-column: auto;
            }

        }

    </style>

</head>

<body>

    <!-- Navigation -->
    <header class="site-header">

        <a class="brand" href="index.html">
            JASH<span>.</span>
        </a>

        <nav>
            <a href="index.html">Back to Home</a>
        </nav>

    </header>


    <!-- Profile Result -->
    <main class="result-wrap">

        <section class="result-card">

            <div class="result-heading">

                <div class="profile-mark">
                    <%= escapeHtml(
                        name != null && !name.trim().isEmpty()
                        ? name.substring(0, 1).toUpperCase()
                        : "J"
                    ) %>
                </div>

                <p class="eyebrow">
                    YOUR PROFILE HAS BEEN SUBMITTED
                </p>

                <h1>
                    Hello,
                    <span class="accent-text">
                        <%= escapeHtml(name) %>
                    </span>!
                </h1>

                <p class="muted-copy">
                    Welcome to your little corner of the internet. ♡
                </p>

            </div>


            <!-- Display Submitted Information -->
            <div class="detail-grid">

                <div class="detail">

                    <span class="detail-label">
                        Full Name
                    </span>

                    <div class="detail-value">
                        <%= escapeHtml(name) %>
                    </div>

                </div>


                <div class="detail">

                    <span class="detail-label">
                        Student ID
                    </span>

                    <div class="detail-value">
                        <%= escapeHtml(studentId) %>
                    </div>

                </div>


                <div class="detail">

                    <span class="detail-label">
                        Programme
                    </span>

                    <div class="detail-value">
                        <%= escapeHtml(programme) %>
                    </div>

                </div>


                <div class="detail">

                    <span class="detail-label">
                        Email Address
                    </span>

                    <div class="detail-value">
                        <%= escapeHtml(email) %>
                    </div>

                </div>


                <div class="detail full">

                    <span class="detail-label">
                        Hobbies
                    </span>

                    <div class="detail-value">
                        <%= escapeHtml(hobbies) %>
                    </div>

                </div>


                <div class="detail full">

                    <span class="detail-label">
                        Short Self-Introduction
                    </span>

                    <div class="detail-value">
                        <%= escapeHtml(introduction) %>
                    </div>

                </div>

            </div>


            <!-- Return Button -->
            <div class="result-actions">

                <a href="index.html"
                   class="button button-primary">

                    Back to Homepage ↗

                </a>

            </div>

        </section>

    </main>


    <!-- Footer -->
    <footer class="site-footer">

        <a class="brand" href="index.html">
            JASH<span>.</span>
        </a>

        <p>
            Designed with creativity and a little bit of code ♡
        </p>

        <span>CSC584 | Personal Profile</span>

    </footer>

</body>

</html>
