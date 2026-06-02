<%@ Page Language="C#" AutoEventWireup="true" CodeFile="staff.aspx.cs" Inherits="staff" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Staff Dashboard</title>

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet" />

<style>

/* =========================
   GLOBAL
========================= */

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI';
}

body{
    background:linear-gradient(135deg,#dce7ff,#edf2ff,#cfdcff);
    min-height:100vh;
    padding:20px;
}

/* =========================
   CONTAINER
========================= */

.container{
    display:flex;
    width:100%;
    min-height:95vh;
    background:#f7f9ff;
    border-radius:25px;
    overflow:hidden;
    box-shadow:0 10px 30px rgba(0,0,0,0.10);
}

/* =========================
   SIDEBAR
========================= */

.sidebar{
    width:240px;
    background:linear-gradient(180deg,#0b4dff,#4e8cff);
    padding:20px 18px;
    color:white;
}

.logo{
    background:rgba(255,255,255,0.15);
    padding:16px;
    border-radius:16px;
    margin-bottom:22px;
}

.logo h1{
    font-size:26px;
    font-weight:bold;
}

.logo p{
    font-size:12px;
    margin-top:4px;
}

/* MENU */

.menu{
    list-style:none;
}

.menu li{
    padding:13px 15px;
    margin-bottom:10px;
    border-radius:12px;
    font-size:15px;
    background:rgba(255,255,255,0.08);
    transition:0.3s;
    cursor:pointer;
}

.menu li i{
    margin-right:10px;
    font-size:14px;
}

.menu li:hover,
.active{
    background:white;
    color:#0b4dff;
}

/* =========================
   MAIN
========================= */

.main{
    flex:1;
    padding:24px;
}

/* TOPBAR */

.topbar{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:24px;
}

.topbar h2{
    font-size:28px;
    color:#1b265f;
    font-weight:600;
}

/* SEARCH */

.search-box{
    width:320px;
    background:white;
    padding:10px 16px;
    border-radius:35px;
    box-shadow:0 4px 10px rgba(0,0,0,0.08);
}

.search-box input{
    width:100%;
    border:none;
    outline:none;
    font-size:14px;
}

/* =========================
   CARDS
========================= */

.cards{
    display:grid;
    grid-template-columns:repeat(3,1fr);
    gap:16px;
    margin-bottom:24px;
}

.card{
    background:white;
    padding:20px;
    border-radius:18px;
    box-shadow:0 4px 10px rgba(0,0,0,0.08);
}

.card h3{
    font-size:16px;
    margin-bottom:8px;
    color:#555;
    font-weight:600;
}

.card .number{
    font-size:30px;
    font-weight:bold;
    color:#0b4dff;
}

/* =========================
   SECTION
========================= */

.section{
    background:white;
    padding:22px;
    border-radius:20px;
    margin-bottom:20px;
    box-shadow:0 4px 10px rgba(0,0,0,0.08);
}

.section-title{
    font-size:22px;
    color:#1b265f;
    margin-bottom:16px;
    font-weight:600;
}

/* =========================
   CATEGORY
========================= */

.category-grid{
    display:grid;
    grid-template-columns:repeat(3,1fr);
    gap:16px;
}

.category-card{
    background:#f4f8ff;
    border-radius:16px;
    padding:16px;
}

.category-card h4{
    color:#0b4dff;
    font-size:18px;
    margin-bottom:12px;
}

/* TAG */

.tag{
    display:inline-block;
    background:#0b4dff;
    color:white;
    padding:6px 12px;
    border-radius:25px;
    margin:4px;
    font-size:12px;
}

/* =========================
   TABLE
========================= */

table{
    width:100%;
    border-collapse:collapse;
}

table th{
    background:#edf2ff;
    padding:14px;
    text-align:left;
    font-size:14px;
    color:#1b265f;
}

table td{
    padding:14px;
    border-bottom:1px solid #eee;
    font-size:13px;
    color:#444;
}

/* STATUS */

.status{
    padding:6px 12px;
    border-radius:25px;
    color:white;
    font-weight:600;
    font-size:12px;
}

.assigned{
    background:#15b86d;
}

.returned{
    background:#ff9100;
}

/* =========================
   BUTTONS
========================= */

.buttons{
    display:grid;
    grid-template-columns:repeat(2,1fr);
    gap:16px;
    margin-top:20px;
}

.btn{
    border:none;
    padding:14px;
    border-radius:14px;
    font-size:14px;
    color:white;
    font-weight:600;
    cursor:pointer;
    transition:0.3s;
}

.btn:hover{
    transform:translateY(-2px);
}

.blue{
    background:linear-gradient(45deg,#0052ff,#4f8dff);
}

.green{
    background:linear-gradient(45deg,#00a878,#33d6b2);
}

/* =========================
   RESPONSIVE
========================= */

@media(max-width:1100px){

    .cards{
        grid-template-columns:1fr;
    }

    .category-grid{
        grid-template-columns:1fr;
    }
}

@media(max-width:850px){

    .container{
        flex-direction:column;
    }

    .sidebar{
        width:100%;
    }

    .topbar{
        flex-direction:column;
        gap:15px;
    }

    .search-box{
        width:100%;
    }

    .buttons{
        grid-template-columns:1fr;
    }
}

</style>

</head>

<body>

<form id="form1" runat="server">

<div class="container">

    <!-- SIDEBAR -->

    <div class="sidebar">

        <div class="logo">
            <h1>DNR</h1>
            <p>Staff Control Panel</p>
        </div>

        <ul class="menu">

            <li class="active">
                <i class="fa-solid fa-house"></i>
                Dashboard
            </li>

            <li>
                <i class="fa-solid fa-laptop"></i>
                IT Assets
            </li>

            <li>
                <i class="fa-solid fa-bolt"></i>
                Electrical Assets
            </li>

            <li>
                <i class="fa-solid fa-couch"></i>
                Furniture Assets
            </li>

            <li>
                <i class="fa-solid fa-file"></i>
                Reports
            </li>

        </ul>

    </div>

    <!-- MAIN -->

    <div class="main">

        <div class="topbar">

            <h2>Staff Dashboard</h2>

            <div class="search-box">

                <asp:TextBox ID="txtSearch"
                    runat="server"
                    placeholder="Search asset or report...">
                </asp:TextBox>

            </div>

        </div>

        <!-- CARDS -->

        <div class="cards">

            <div class="card">

                <h3>My Assets</h3>

                <div class="number">
                    <asp:Label ID="lblMyAssets" runat="server" Text="08"></asp:Label>
                </div>

            </div>

            <div class="card">

                <h3>Available Reports</h3>

                <div class="number">
                    <asp:Label ID="lblReports" runat="server" Text="15"></asp:Label>
                </div>

            </div>

            <div class="card">

                <h3>Departments</h3>

                <div class="number">
                    <asp:Label ID="lblDepartments" runat="server" Text="12"></asp:Label>
                </div>

            </div>

        </div>

        <!-- CATEGORY -->

        <div class="section">

            <div class="section-title">
                Asset Categories
            </div>

            <div class="category-grid">

                <div class="category-card">

                    <h4>IT Assets</h4>

                    <span class="tag">Laptop</span>
                    <span class="tag">Keyboard</span>
                    <span class="tag">Mouse</span>
                    <span class="tag">Printer</span>

                </div>

                <div class="category-card">

                    <h4>Electrical Assets</h4>

                    <span class="tag">AC</span>
                    <span class="tag">Fan</span>
                    <span class="tag">Cooler</span>

                </div>

                <div class="category-card">

                    <h4>Furniture Assets</h4>

                    <span class="tag">Chair</span>
                    <span class="tag">Table</span>
                    <span class="tag">Desk</span>

                </div>

            </div>

        </div>

        <!-- TABLE -->

        <div class="section">

            <div class="section-title">
                Assigned Assets
            </div>

            <table>

                <tr>
                    <th>Asset Name</th>
                    <th>Category</th>
                    <th>Date</th>
                    <th>Status</th>
                </tr>

                <tr>
                    <td>Dell Latitude Laptop</td>
                    <td>IT Asset</td>
                    <td>27/05/2026</td>
                    <td>
                        <span class="status assigned">
                            Assigned
                        </span>
                    </td>
                </tr>

                <tr>
                    <td>Voltas Split AC</td>
                    <td>Electrical Asset</td>
                    <td>20/05/2026</td>
                    <td>
                        <span class="status returned">
                            In Service
                        </span>
                    </td>
                </tr>

            </table>

            <!-- BUTTONS -->

            <div class="buttons">

                <asp:Button ID="btnViewReport"
                    runat="server"
                    Text="View Reports"
                    CssClass="btn blue"
                    OnClick="btnViewReport_Click" />

                <asp:Button ID="btnFindAsset"
                    runat="server"
                    Text="Find Asset"
                    CssClass="btn green"
                    OnClick="btnFindAsset_Click" />

            </div>

        </div>

    </div>

</div>

</form>

</body>
</html>