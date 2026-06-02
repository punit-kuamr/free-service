<%@ Page Language="C#" AutoEventWireup="true"
    CodeFile="home1.aspx.cs"
    Inherits="home" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Office Assets</title>

    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">

    <style>
        :root {
            --primary-dark: #0f172a;
            --accent-blue: #5d87ff;
            --text-muted: #4b5563;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Plus Jakarta Sans', sans-serif;
        }

        body {
            min-height: 100vh;
            background: linear-gradient(135deg, rgba(244,243,240,0.85), rgba(234,233,241,0.9)),
                        url('https://images.unsplash.com/photo-1497366216548-37526070297c?auto=format&fit=crop&w=1920&q=80');
            background-size: cover;
            background-position: center;
            padding: 40px;
        }

        .main-container {
            max-width: 1200px;
            margin: auto;
            display: grid;
            grid-template-columns: 1.1fr 0.9fr;
            gap: 40px;
        }

        .info-panel {
            position: sticky;
            top: 40px;
        }

        .hero-box {
            background: rgba(255,255,255,0.55);
            border-radius: 20px;
            padding: 30px;
            border: 1px solid rgba(255,255,255,0.7);
            backdrop-filter: blur(20px);
        }

        .hero-box h1 {
            font-size: 34px;
            font-weight: 800;
            color: var(--primary-dark);
        }

        .hero-box p {
            margin-top: 10px;
            color: var(--text-muted);
        }

        .card {
            background: rgba(255,255,255,0.6);
            border-radius: 20px;
            padding: 25px;
            border: 1px solid rgba(255,255,255,0.7);
            backdrop-filter: blur(20px);
        }

        .form-group {
            display: flex;
            flex-direction: column;
            margin-bottom: 15px;
        }

        label {
            font-size: 13px;
            font-weight: 600;
            margin-bottom: 6px;
            color: var(--primary-dark);
        }

        .input-control {
            width: 100%;
            padding: 12px;
            border-radius: 10px;
            border: 1px solid rgba(0,0,0,0.1);
            font-size: 14px;
        }

        .btn {
            width: 100%;
            padding: 12px;
            border-radius: 25px;
            background: var(--accent-blue);
            color: #fff;
            border: none;
            font-weight: 600;
            cursor: pointer;
        }

        .btn:hover {
            background: #4b76ed;
        }

        .grid-section {
            max-width: 1200px;
            margin: 30px auto;
        }

        .grid-card {
            background: rgba(255,255,255,0.65);
            border-radius: 20px;
            padding: 25px;
            border: 1px solid rgba(255,255,255,0.7);
            backdrop-filter: blur(20px);
        }

        .grid-title {
            font-size: 18px;
            font-weight: 800;
            margin-bottom: 15px;
            color: var(--primary-dark);
        }

        .grid-view {
            width: 100%;
            border-collapse: collapse;
        }

        .grid-view th {
            background: rgba(0,0,0,0.03);
            padding: 12px;
            font-size: 13px;
            text-align: left;
        }

        .grid-view td {
            padding: 10px;
            font-size: 13px;
            color: var(--text-muted);
            border-bottom: 1px solid rgba(0,0,0,0.05);
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

<div class="main-container">

    <!-- LEFT -->
    <div class="info-panel">
        <div class="hero-box">
            <h1>Office Asset System</h1>
            <p>Gateway routing + Office + Group based asset tracking system.</p>
        </div>
    </div>

    <!-- RIGHT -->
    <div class="card">

        <h3 style="margin-bottom:15px; color:var(--primary-dark);">Gateway Routing System</h3>

        <div class="form-group">
            <label>Gateway</label>
            <asp:DropDownList ID="ddlState" runat="server" CssClass="input-control">
                <asp:ListItem Text="Select Gateway" Value="" />
                <asp:ListItem Text="Andhra Pradesh Terminal" Value="AP" />
                <asp:ListItem Text="Delhi Central Terminal" Value="DL" />
                <asp:ListItem Text="Karnataka Terminal" Value="KA" />
                <asp:ListItem Text="Maharashtra Grid" Value="MH" />
                <asp:ListItem Text="Rajasthan Hub" Value="RJ" />
            </asp:DropDownList>
        </div>

        <div class="form-group">
            <label>District</label>
            <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="input-control">
                <asp:ListItem Text="Select District" Value="" />
            </asp:DropDownList>
        </div>

        <div class="form-group">
            <label>Sub District</label>
            <asp:DropDownList ID="ddlSubDistrict" runat="server" CssClass="input-control">
                <asp:ListItem Text="Select Sub District" Value="" />
            </asp:DropDownList>
        </div>

        <div class="form-group">
            <label>Branch Node</label>
            <asp:DropDownList ID="ddlBranch" runat="server" CssClass="input-control">
                <asp:ListItem Text="Select Branch" Value="" />
            </asp:DropDownList>
        </div>

        <div class="form-group">
            <label>Office</label>
            <asp:DropDownList ID="ddlOffice" runat="server" CssClass="input-control">
                <asp:ListItem Text="Select Office" Value="0" />
                <asp:ListItem Text="NHM" Value="1" />
                <asp:ListItem Text="TCIL" Value="2" />
                <asp:ListItem Text="GVK" Value="3" />
                <asp:ListItem Text="TELEMANAS" Value="4" />
            </asp:DropDownList>
        </div>

        <div class="form-group">
            <label>Group</label>
            <asp:DropDownList ID="ddlGroup" runat="server" CssClass="input-control">
                <asp:ListItem Text="Select Group" Value="" />
                <asp:ListItem Text="IT" Value="IT" />
                <asp:ListItem Text="Furniture" Value="Furniture" />
                <asp:ListItem Text="Electronics" Value="Electronics" />
            </asp:DropDownList>
        </div>

        <div class="form-group">
            <label>PIN Code</label>
            <asp:TextBox ID="txtPinCode" runat="server" CssClass="input-control" MaxLength="6"></asp:TextBox>
        </div>

        <asp:Button ID="btnSubmit" runat="server"
            Text="Fetch Assets"
            CssClass="btn"
            OnClick="btnSubmit_Click" />

    </div>

</div>

<!-- GRID -->
<div class="grid-section">
    <div class="grid-card">
        <div class="grid-title">Asset Details</div>

        <asp:GridView ID="gvAssets" runat="server"
            AutoGenerateColumns="true"
            CssClass="grid-view">
        </asp:GridView>

    </div>
</div>

</form>
</body>
</html>