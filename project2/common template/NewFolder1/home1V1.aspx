<%@ Page Language="C#" AutoEventWireup="true"
    CodeFile="home1V1.aspx.cs"
    Inherits="home" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Office Assets</title>

    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />

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

        /* ================= MAIN CONTAINER ================= */
        .main-container {
            max-width: 1200px;
            margin: auto;
            display: grid;
            grid-template-columns: 1.1fr 0.9fr;
            gap: 40px;
            align-items: start;
        }

        /* LEFT PANEL */
        .info-panel {
            position: sticky;
            top: 40px;
        }

        .hero-box {
            background: rgba(255,255,255,0.55);
            border: 1px solid rgba(255,255,255,0.7);
            padding: 30px;
            border-radius: 20px;
            backdrop-filter: blur(20px);
        }

        .hero-box h1 {
            font-size: 34px;
            color: var(--primary-dark);
            font-weight: 800;
        }

        .hero-box p {
            margin-top: 10px;
            color: var(--text-muted);
            font-size: 14px;
            line-height: 22px;
        }

        /* RIGHT PANEL */
        .card {
            background: rgba(255,255,255,0.6);
            border: 1px solid rgba(255,255,255,0.7);
            border-radius: 20px;
            padding: 25px;
            backdrop-filter: blur(20px);
            box-shadow: 0 20px 40px rgba(0,0,0,0.05);
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        label {
            font-size: 13px;
            font-weight: 600;
            color: var(--primary-dark);
            margin-bottom: 6px;
            display: block;
        }

        .input-control {
            width: 100%;
            padding: 12px;
            border-radius: 10px;
            border: 1px solid rgba(0,0,0,0.1);
            font-size: 14px;
            outline: none;
        }

        .input-control:focus {
            border-color: var(--accent-blue);
            box-shadow: 0 0 0 3px rgba(93,135,255,0.15);
        }

        .btn {
            margin-top: 20px;
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 25px;
            background: var(--accent-blue);
            color: white;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
        }

        .btn:hover {
            background: #4b76ed;
        }

        /* ================= BELOW SECTION ================= */
        .grid-section {
            max-width: 1200px;
            margin: 30px auto 0 auto;
        }

        .grid-card {
            background: rgba(255,255,255,0.65);
            border: 1px solid rgba(255,255,255,0.7);
            border-radius: 20px;
            padding: 25px;
            backdrop-filter: blur(20px);
            box-shadow: 0 20px 40px rgba(0,0,0,0.05);
        }

        .grid-title {
            font-size: 18px;
            font-weight: 800;
            color: var(--primary-dark);
            margin-bottom: 12px;
        }

        .grid-view {
            width: 100%;
            border-collapse: collapse;
        }

        .grid-view th {
            background: rgba(0,0,0,0.03);
            padding: 12px;
            font-size: 13px;
        }

        .grid-view td {
            padding: 10px;
            font-size: 13px;
            color: var(--text-muted);
        }
        .edit-icon{
    color:#2563eb;
    font-size:18px;
    cursor:pointer;
    transition:.3s;
}

.edit-icon:hover{
    color:#1d4ed8;
    transform:scale(1.15);
}

.delete-icon{
    color:#dc2626;
    font-size:18px;
    cursor:pointer;
    transition:.3s;
}

.delete-icon:hover{
    color:#b91c1c;
    transform:scale(1.15);
}

.save-icon{
    color:#16a34a;
    font-size:18px;
}

.cancel-icon{
    color:#ea580c;
    font-size:18px;
}
    </style>
</head>

<body>
<form id="form1" runat="server">
<div style="
    display:flex;
    justify-content:flex-end;
    margin-bottom:20px;">

    <div style="
        background:#ffffff;
        padding:8px 15px;
        border-radius:20px;
        border:1px solid #ddd;
        font-weight:600;
        color:#0f172a;">

        <asp:Label ID="lblRole" runat="server"></asp:Label>

    </div>

</div>
<!-- ================= MAIN CONTAINER ================= -->
<div class="main-container">

    <!-- LEFT PANEL -->
    <div class="info-panel">

        <div class="hero-box">
            <h1>Office Asset System</h1>
            <p>
                Unified tracking system for Office, Group classification and asset mapping.
                Manage IT, Furniture and Electronics in one dashboard.
            </p>
        </div>

    </div>

    <!-- RIGHT PANEL -->
    <div class="card">

        <div class="form-grid">

            <div>
                <label>Office</label>
                <asp:DropDownList ID="ddlOffice" runat="server" CssClass="input-control">
                    <asp:ListItem Text="Select Office" Value="0" />
                    <asp:ListItem Text="NHM" Value="1" />
                    <asp:ListItem Text="TCIL" Value="2" />
                    <asp:ListItem Text="GVK" Value="3" />
                    <asp:ListItem Text="TELEMANAS" Value="4" />
                </asp:DropDownList>
            </div>

            <div>
                <label>Group</label>
                <asp:DropDownList ID="ddlGroup" runat="server" CssClass="input-control">
                    <asp:ListItem Text="Select Group" Value="" />
                    <asp:ListItem Text="IT" Value="IT" />
                    <asp:ListItem Text="Furniture" Value="Furniture" />
                    <asp:ListItem Text="Electronics" Value="Electronics" />
                </asp:DropDownList>
            </div>

        </div>

        <asp:Button ID="btnSubmit" runat="server"
            Text="Fetch Assets"
            CssClass="btn"
            OnClick="btnSubmit_Click" />

    </div>

</div>

<!-- ================= GRID SECTION ================= -->
<div class="grid-section">

    <div class="grid-card">

        <div class="grid-title">Asset Details</div>

        <asp:GridView ID="gvAssets" runat="server"
            AutoGenerateColumns="False"
            DataKeyNames="ID"
            CssClass="grid-view"
            OnRowEditing="gvAssets_RowEditing"
            OnRowCancelingEdit="gvAssets_RowCancelingEdit"
            OnRowUpdating="gvAssets_RowUpdating"
            OnRowDeleting="gvAssets_RowDeleting">
            <Columns>

        <asp:BoundField DataField="ID"
            HeaderText="ID"
            ReadOnly="true" />

        <asp:BoundField DataField="ItemName"
            HeaderText="Item Name" />

        <asp:BoundField DataField="Quantity"
            HeaderText="Quantity" />

        <asp:BoundField DataField="Status"
            HeaderText="Status" />
            <asp:TemplateField HeaderText="Edit">

    <ItemTemplate>
        <asp:LinkButton ID="lnkEdit"
            runat="server"
            CommandName="Edit">

            <i class="fa-solid fa-pen-to-square edit-icon"></i>

        </asp:LinkButton>
    </ItemTemplate>

    <EditItemTemplate>

        <asp:LinkButton ID="lnkUpdate"
            runat="server"
            CommandName="Update">

            <i class="fa-solid fa-check save-icon"></i>

        </asp:LinkButton>

        &nbsp;

        <asp:LinkButton ID="lnkCancel"
            runat="server"
            CommandName="Cancel">

            <i class="fa-solid fa-xmark cancel-icon"></i>

        </asp:LinkButton>

    </EditItemTemplate>

</asp:TemplateField>
        
       <asp:TemplateField HeaderText="Delete">

    <ItemTemplate>

        <asp:LinkButton ID="lnkDelete"
            runat="server"
            CommandName="Delete"
            CausesValidation="false"
            OnClientClick="return confirm('Are you sure you want to delete this asset?');">

            <i class="fa-solid fa-trash delete-icon"></i>

        </asp:LinkButton>

    </ItemTemplate>

</asp:TemplateField>
           

    </Columns>

        </asp:GridView>

    </div>

</div>
    <!-- ================= INSERT SECTION ================= -->
<div class="grid-section">

    <div class="grid-card">

        <div class="grid-title"><asp:Literal ID="litInsertTitle" runat="server" Text="Insert Asset"></asp:Literal>(Admin)</div>

        <div class="form-grid">

            <div>
                <label>Item Name</label>
                <asp:TextBox ID="txtItemName" runat="server" CssClass="input-control"></asp:TextBox>
            </div>

            <div>
                <label>Quantity</label>
                <asp:TextBox ID="txtQuantity" runat="server" CssClass="input-control"></asp:TextBox>
            </div>

            <div>
                <label>Status</label>
                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="input-control">
                    <asp:ListItem Text="Select Status" Value="" />
                    <asp:ListItem Text="Active" Value="Active" />
                    <asp:ListItem Text="Inactive" Value="Inactive" />
                </asp:DropDownList>
            </div>

            <div style="display:flex; align-items:end;">
                <asp:Button ID="btnInsert" runat="server"
                    Text="Insert Item"
                    CssClass="btn"
                    OnClick="btnInsert_Click" />
            </div>
            <div style="grid-column: 1 / span 2;">
    <label>Remark</label>
    <asp:TextBox ID="txtRemark"
        runat="server"
        CssClass="input-control"
        TextMode="MultiLine"
        Rows="4">
    </asp:TextBox>
</div>
        </div>

    </div>

</div>

</form>
</body>
</html>