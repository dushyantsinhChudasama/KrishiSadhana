<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="KrishiSadhana.Administrator.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login Panel</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <link rel="stylesheet" href="../assets/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700&display=swap" rel="stylesheet">

    <style>
        .custome-bg {
            background-color: #21ceac;
        }

            .custome-bg:hover {
                background-color: #279e8c;
            }

        .login-form {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
            width: 400px;
        }
    </style>

</head>
<body cssclass="bg-light">
    <form id="form1" runat="server">
        <div>
            <div class="login-form text-center rounded bg-white shadow overflow-hidden">

                <h4 class="text-white bg-dark py-3">ADMIN LOGIN PANEL</h4>
                <div class="p-4">
                    <div class="mb-3">
                        <asp:TextBox ID="txtname" runat="server" class="form-control shadow-none text-center" placeholder="Admin Name"></asp:TextBox>
                        <%--<input name="admin_name" required type="text" ">--%>
                    </div>
                    <div class="mb-3">
                        <asp:TextBox ID="txtPassword" runat="server" class="form-control shadow-none text-center" placeholder="Password"></asp:TextBox>
                        <%--<input name="admin_pass" required type="password" >--%>
                    </div>
                    <asp:Button ID="btnLogin" class="btn text-white custome-bg shadow-none" runat="server" Text="LOGIN" OnClick="btnLogin_Click" />
                    <%--<button name="login" type="submit" >LOGIN</button>--%>
                    <p class="register-text">Click here for, <a href="Register.aspx">Admin Registration </a></p>
                </div>

            </div>
        </div>
    </form>
</body>
</html>
