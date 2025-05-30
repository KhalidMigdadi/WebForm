﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="feedback.aspx.cs" Inherits="projectc_.Mohammed.feedback" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Library Feedback</title>

    <!-- ✅ jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- ✅ Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>

    <style>
        /* ✅ Full-Page Background */
        body, html {
            min-height: 100vh;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            background: url('https://images.unsplash.com/photo-1524985069026-dd778a71c7b4') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Poppins', sans-serif;
            color: white;
            position: relative;
        }

        /* ✅ Overlay */
        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.6);
            z-index: 0;
        }

        /* ✅ Feedback Container */
        .feedback-container {
            background: rgba(255, 255, 255, 0.15);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.5);
            width: 100%;
            max-width: 550px;
            backdrop-filter: blur(8px);
            text-align: center;
            position: relative;
            z-index: 1;
            animation: fadeIn 0.8s ease-in-out;
        }

        .feedback-container h2 {
            font-family: 'Georgia', serif;
            color: #ffcc00;
            margin-bottom: 20px;
        }

        .form-control {
            background: rgba(255, 255, 255, 0.3);
            border: none;
            color: white;
            font-size: 18px;
            height: 50px;
            text-align: center;
            border-radius: 10px;
            transition: all 0.3s ease-in-out;
        }

        .form-control:focus {
            background: rgba(255, 255, 255, 0.5);
            color: black;
        }

        .form-control::placeholder {
            color: rgba(255, 255, 255, 0.7);
        }

        .btn-custom {
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            border: none;
            font-weight: bold;
            font-size: 20px;
            transition: 0.3s;
            width: 100%;
            height: 50px;
            color: white;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(255, 255, 255, 0.3);
        }

        .btn-custom:hover {
            background: linear-gradient(135deg, #2575fc, #6a11cb);
            box-shadow: 0 4px 15px rgba(255, 255, 255, 0.5);
        }

        .message {
            text-align: center;
            font-weight: bold;
            margin-top: 10px;
        }

        /* ✅ Popup Styling */
        #successPopup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: white;
            color: black;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.3);
            text-align: center;
            z-index: 9999;
            width: 500px;
            animation: fadeIn 0.5s ease-in-out;
        }

        /* ✅ Animations */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>

    <!-- ✅ Overlay -->
    <div class="overlay"></div>

    <form id="form1" runat="server">
        <div class="feedback-container">
            <h2>📝 Library Feedback 📖</h2>
            <p class="mb-4">Submit your feedback about the library services.</p>

            <asp:ScriptManager runat="server"></asp:ScriptManager>

            <asp:UpdatePanel runat="server">
                <ContentTemplate>

                    <!-- ✅ Feedback Type Dropdown -->
                    <div class="mb-4">
                        <asp:DropDownList ID="ddlFeedbackType" runat="server" CssClass="form-control">
                            <asp:ListItem Text="📌 Select Feedback Type" Value="" />
                            <asp:ListItem Text="💡 Suggestion" Value="Suggestion" />
                            <asp:ListItem Text="🚨 Complaint" Value="Complaint" />
                            <asp:ListItem Text="❓ Inquiry" Value="Inquiry" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvFeedbackType" runat="server" ControlToValidate="ddlFeedbackType"
                            ErrorMessage="⚠ Please select a feedback type!" ForeColor="Red" Display="Dynamic" InitialValue="" />
                    </div>

                    <!-- ✅ Feedback Text Area -->
                    <div class="mb-4">
                        <asp:TextBox ID="txtFeedback" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4"
                            placeholder="✍️ Write your feedback here..."></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvFeedback" runat="server" ControlToValidate="txtFeedback"
                            ErrorMessage="⚠ Feedback cannot be empty!" ForeColor="Red" Display="Dynamic" />
                    </div>

                    <!-- ✅ Submit Button -->
                    <div class="d-flex justify-content-center">
                        <asp:Button ID="btnSubmitFeedback" runat="server" Text="Send Feedback" CssClass="btn btn-custom" OnClick="btnSubmitFeedback_Click" />
                    </div>

                    <asp:Label ID="lblMessage" runat="server" CssClass="message mt-3"></asp:Label>

                </ContentTemplate>
            </asp:UpdatePanel>

        </div>
    </form>

    <!-- ✅ Success Popup -->
    <div id="successPopup">
        <h3>✅ Feedback Submitted!</h3>
        <p>Thank you for your feedback! Redirecting...</p>
    </div>

    <script>
        function showPopupAndRedirect() {
            document.getElementById('successPopup').style.display = 'block';
            setTimeout(function () {
                window.location.href = 'userDashboard.aspx';
            }, 2000);
        }
    </script>

</body>
</html>
