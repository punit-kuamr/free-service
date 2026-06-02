<%@ Page Language="C#" AutoEventWireup="true" CodeFile="home - Copy.aspx.cs" Inherits="home" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dayton Natural Resources.PVT.LTD - Gateway Access</title>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    
    <style>
        :root {
            --bg-start: #f4f3f0;   
            --bg-end: #eae9f1;     
            --primary-dark: #0f172a; 
            --accent-blue: #5d87ff; 
            --text-dark: #111827;
            --text-muted: #4b5563;
            --card-bg: rgba(255, 255, 255, 0.7);
            --border-color: rgba(255, 255, 255, 0.6);
            --emerald: #10b981;
            --amber: #f59e0b;
            --indigo: #6366f1;
        }

        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Plus Jakarta Sans', sans-serif; }
        html { scroll-behavior: smooth; }

        body {
            background: linear-gradient(135deg, rgba(244, 243, 240, 0.85) 0%, rgba(234, 233, 241, 0.9) 100%),
                        url('https://images.unsplash.com/photo-1497366216548-37526070297c?auto=format&fit=crop&w=1920&q=80');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color: var(--text-dark);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            overflow-x: hidden;
        }

        .navbar {
            display: flex; justify-content: space-between; align-items: center;
            padding: 18px 6%; background: rgba(255, 255, 255, 0.4);
            backdrop-filter: blur(20px); -webkit-backdrop-filter: blur(20px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.5);
            width: 100%; position: sticky; top: 0; z-index: 100;
        }
        
        .brand-unit { display: flex; align-items: center; gap: 12px; }
        .brand-avatar {
            width: 36px; height: 36px; background: linear-gradient(135deg, #2563eb, #3b82f6);
            display: flex; align-items: center; justify-content: center; border-radius: 10px;
            font-weight: 800; font-size: 16px; color: #ffffff;
            box-shadow: 0 4px 14px rgba(37, 99, 235, 0.2);
        }
        .brand-headline { font-size: 16px; font-weight: 700; color: var(--primary-dark); }

        .nav-links { display: flex; gap: 32px; list-style: none; align-items: center; }
        .nav-links a { color: var(--text-muted); text-decoration: none; font-size: 14px; font-weight: 500; transition: color 0.2s; }
        .nav-links a:hover { color: var(--accent-blue); }

        .main-container {
            max-width: 1250px; width: 100%; margin: auto; padding: 40px 30px;
            display: grid; grid-template-columns: 1.1fr 0.9fr; gap: 60px; align-items: start;
        }

        .info-panel { display: flex; flex-direction: column; gap: 30px; position: sticky; top: 100px; }
        .hero-text h1 { font-size: 46px; font-weight: 800; line-height: 56px; color: var(--primary-dark); letter-spacing: -1.2px; margin-bottom: 12px; }
        .hero-text p { color: var(--text-muted); font-size: 16px; line-height: 26px; max-width: 520px; }

        .about-icon-framework-card {
            background: rgba(255, 255, 255, 0.55); border: 1px solid rgba(255, 255, 255, 0.7);
            border-radius: 24px; padding: 35px; display: flex; align-items: center; gap: 30px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.02); backdrop-filter: blur(20px); -webkit-backdrop-filter: blur(20px); max-width: 540px;
        }
        
        .vector-illustration-container {
            flex-shrink: 0; width: 140px; height: 140px;
            background: linear-gradient(135deg, rgba(255,255,255,0.8), rgba(255,255,255,0.4));
            border-radius: 18px; display: flex; align-items: center; justify-content: center; border: 1px solid rgba(255,255,255,0.6);
        }
        .tech-vector-graphic { width: 100px; height: 100px; }
        .about-framework-details { display: flex; flex-direction: column; gap: 6px; }
        .about-framework-details h3 { font-size: 18px; font-weight: 800; text-transform: uppercase; color: var(--primary-dark); letter-spacing: 0.5px; }
        .about-framework-details p { font-size: 14px; color: var(--text-muted); line-height: 22px; margin: 0; }

        .right-sidebar { display: flex; flex-direction: column; gap: 24px; }

        .console-card {
            background: rgba(255, 255, 255, 0.45); border: 1px solid rgba(255, 255, 255, 0.7); border-radius: 24px; padding: 40px; 
            box-shadow: 0 30px 60px rgba(15, 23, 42, 0.04), inset 0 1px 0 rgba(255,255,255,0.5);
            backdrop-filter: blur(30px); -webkit-backdrop-filter: blur(30px);
        }
        .console-card h3 { font-size: 22px; font-weight: 700; margin-bottom: 24px; color: var(--primary-dark); letter-spacing: -0.5px; }

        .form-group { display: flex; flex-direction: column; gap: 8px; margin-bottom: 20px; }
        .form-group label { font-size: 13px; font-weight: 600; color: var(--text-dark); }

        .input-control {
            width: 100%; padding: 12px 16px; background: #ffffff; border: 1px solid rgba(0, 0, 0, 0.08); 
            border-radius: 10px; color: var(--text-dark); font-size: 14px; outline: none; transition: all 0.2s; font-weight: 500;
        }
        .input-control:focus { border-color: var(--accent-blue); box-shadow: 0 0 0 4px rgba(93, 135, 255, 0.12); }
        .input-control:disabled { opacity: 0.5; background: rgba(255,255,255,0.3); cursor: not-allowed; }
        
        select.input-control {
            cursor: pointer; appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 24 24' stroke='%23475569'%3E%3Cpath stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M19 9l-7 7-7-7'/%3E%3C/svg%3E");
            background-repeat: no-repeat; background-position: right 16px center; background-size: 14px; padding-right: 40px;
        }

        .pincode-divider {
            text-align: center; margin: 20px 0; font-size: 12px; font-weight: 700; color: var(--text-muted); position: relative; text-transform: uppercase; letter-spacing: 1.5px;
        }
        .pincode-divider::before, .pincode-divider::after { content: ''; position: absolute; top: 50%; width: 25%; height: 1px; background: rgba(0,0,0,0.08); }
        .pincode-divider::before { left: 0; } .pincode-divider::after { right: 0; }

        .cta-button {
            width: 100%; padding: 14px; background: #5d87ff; color: #ffffff; border: none; border-radius: 25px; font-size: 14px; font-weight: 600; cursor: pointer;
            transition: all 0.2s; margin-top: 10px; box-shadow: 0 4px 15px rgba(93, 135, 255, 0.3); letter-spacing: 0.2px;
        }
        .cta-button:hover { background: #4b76ed; box-shadow: 0 6px 20px rgba(93, 135, 255, 0.4); transform: translateY(-0.5px); }

        /* --- INTEL WORKSPACE & TAB INTERACTIVE MATRIX --- */
        .workspace-block { max-width: 1250px; width: 100%; margin: 30px auto; padding: 0 30px; }
        .panel-container {
            background: rgba(255, 255, 255, 0.75); border: 1px solid rgba(255,255,255,0.7);
            border-radius: 28px; padding: 45px; backdrop-filter: blur(30px); -webkit-backdrop-filter: blur(30px);
            box-shadow: 0 40px 80px rgba(15, 23, 42, 0.06);
        }
        .panel-header {
            display: flex; justify-content: space-between; align-items: center;
            border-bottom: 1px solid rgba(0,0,0,0.06); padding-bottom: 25px; margin-bottom: 30px;
        }
        .panel-header h2 { font-size: 26px; font-weight: 800; color: var(--primary-dark); letter-spacing: -0.8px; }
        
        .tab-menu-row { display: flex; gap: 8px; background: rgba(0,0,0,0.03); padding: 6px; border-radius: 14px; list-style: none; }
        .tab-btn {
            padding: 10px 20px; font-size: 13px; font-weight: 600; color: var(--text-muted);
            background: transparent; border: none; border-radius: 10px; cursor: pointer; transition: all 0.2s;
        }
        .tab-btn.active { background: #ffffff; color: var(--accent-blue); box-shadow: 0 4px 12px rgba(0,0,0,0.04); }

        .tab-content-viewport { display: none; }
        .tab-content-viewport.active { display: block; animation: fadeIn 0.4s ease-out; }

        @keyframes fadeIn { from { opacity: 0; transform: translateY(8px); } to { opacity: 1; transform: translateY(0); } }

        .metrics-summary-row { display: grid; grid-template-columns: repeat(auto-fit, minmax(220px, 1fr)); gap: 20px; margin-bottom: 30px; }
        .metric-mini-card { background: #ffffff; padding: 20px; border-radius: 16px; border: 1px solid rgba(0,0,0,0.03); box-shadow: 0 4px 10px rgba(0,0,0,0.01); }
        .metric-mini-card span { font-size: 12px; font-weight: 700; text-transform: uppercase; color: var(--text-muted); letter-spacing: 0.5px; }
        .metric-mini-card h4 { font-size: 24px; font-weight: 800; color: var(--primary-dark); margin-top: 4px; }

        .data-table-wrapper { width: 100%; overflow-x: auto; background: #ffffff; border-radius: 16px; border: 1px solid rgba(0,0,0,0.04); }
        .intel-table { width: 100%; border-collapse: collapse; text-align: left; font-size: 14px; }
        .intel-table th { background: rgba(0,0,0,0.02); padding: 16px 20px; font-weight: 700; color: var(--primary-dark); border-bottom: 1px solid rgba(0,0,0,0.05); }
        .intel-table td { padding: 16px 20px; color: var(--text-muted); border-bottom: 1px solid rgba(0,0,0,0.03); font-weight: 500; }
        .intel-table tr:last-child td { border: none; }
        
        .badge-pill { display: inline-block; padding: 4px 12px; border-radius: 20px; font-size: 11px; font-weight: 700; text-transform: uppercase; }
        .badge-pill.it { background: rgba(93, 135, 255, 0.1); color: var(--accent-blue); }
        .badge-pill.furniture { background: rgba(245, 158, 11, 0.1); color: var(--amber); }
        .badge-pill.electronic { background: rgba(16, 185, 129, 0.1); color: var(--emerald); }

        /* Pure CSS Charts Framework */
        .chart-visual-layout { display: grid; grid-template-columns: 1fr 1fr; gap: 30px; margin-top: 35px; border-top: 1px dashed rgba(0,0,0,0.08); padding-top: 30px; }
        .chart-box-container { background: #ffffff; border-radius: 16px; padding: 25px; border: 1px solid rgba(0,0,0,0.04); }
        .chart-box-container h3 { font-size: 15px; font-weight: 700; color: var(--primary-dark); margin-bottom: 20px; }
        
        .bar-chart-flex { display: flex; flex-direction: column; gap: 14px; }
        .chart-row-unit { display: flex; align-items: center; gap: 15px; font-size: 13px; font-weight: 600; }
        .chart-label-text { width: 120px; color: var(--text-muted); text-overflow: ellipsis; overflow: hidden; white-space: nowrap; }
        .chart-bar-track { flex: 1; height: 12px; background: rgba(0,0,0,0.03); border-radius: 6px; overflow: hidden; }
        .chart-bar-fill { height: 100%; border-radius: 6px; transition: width 1s ease; }
        .chart-bar-fill.blue { background: var(--accent-blue); }
        .chart-bar-fill.indigo { background: var(--indigo); }
        .chart-value-text { width: 45px; text-align: right; color: var(--primary-dark); font-weight: 700; }

        .report-gen-area { text-align: center; padding: 25px 0 0 0; }
        .secondary-cta-btn {
            padding: 12px 30px; background: var(--primary-dark); color: white; border: none; border-radius: 20px;
            font-size: 13px; font-weight: 600; cursor: pointer; transition: all 0.2s; display: inline-flex; align-items: center; gap: 8px;
        }
        .secondary-cta-btn:hover { background: #1e293b; transform: translateY(-1px); }

        /* Corporate Content Grid */
        .corporate-container { max-width: 1250px; width: 100%; margin: 40px auto; padding: 0 30px; display: flex; flex-direction: column; gap: 40px; }
        .content-block {
            background: var(--card-bg); border: 1px solid var(--border-color); border-radius: 24px;
            padding: 45px; backdrop-filter: blur(20px); -webkit-backdrop-filter: blur(20px); box-shadow: 0 10px 30px rgba(0,0,0,0.02);
        }
        .content-block h2 { font-size: 28px; font-weight: 800; color: var(--primary-dark); margin-bottom: 20px; border-left: 5px solid var(--accent-blue); padding-left: 15px; }
        .content-block h3 { font-size: 18px; font-weight: 700; color: var(--primary-dark); margin: 25px 0 12px 0; }
        .content-block p { font-size: 15px; color: var(--text-muted); line-height: 26px; margin-bottom: 15px; text-align: justify; }
        
        .toll-free-badge { background: linear-gradient(135deg, #10b981, #059669); color: white; display: inline-block; padding: 6px 16px; border-radius: 30px; font-size: 14px; font-weight: 700; margin-bottom: 20px; }
        .info-list { list-style: none; margin-bottom: 20px; }
        .info-list li { position: relative; padding-left: 20px; margin-bottom: 12px; font-size: 14px; color: var(--text-muted); line-height: 22px; }
        .info-list li::before { content: "-"; position: absolute; left: 0; color: #2563eb; font-weight: 900; }

        .services-table-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 20px; margin-top: 20px; }
        .service-column-card { background: rgba(255,255,255,0.5); border: 1px solid rgba(0,0,0,0.04); border-radius: 16px; padding: 20px; }
        .service-column-card h4 { font-size: 15px; font-weight: 700; color: var(--primary-dark); margin-bottom: 12px; padding-bottom: 6px; border-bottom: 1px solid rgba(0,0,0,0.06); }

        .client-tags { display: flex; flex-wrap: wrap; gap: 10px; margin-top: 15px; }
        .client-badge { background: #ffffff; border: 1px solid rgba(0,0,0,0.06); padding: 8px 16px; border-radius: 8px; font-size: 13px; font-weight: 600; color: var(--primary-dark); }

        .contact-grid { display: grid; grid-template-columns: 1.2fr 0.8fr; gap: 30px; align-items: center; }
        .contact-info-box h3 { font-size: 20px; margin-bottom: 8px; color: var(--primary-dark); }
        .contact-info-box p { font-size: 15px; line-height: 24px; color: var(--text-muted); margin-bottom: 8px; }
        
        .support-desk-strip {
            background: rgba(15, 23, 42, 0.9); border: 1px solid rgba(15, 23, 42, 0.95);
            border-radius: 18px; padding: 25px; color: #ffffff; display: flex; justify-content: space-between; align-items: center;
        }
        .support-info h4 { font-size: 11px; font-weight: 700; text-transform: uppercase; color: #3b82f6; letter-spacing: 0.8px; margin-bottom: 2px; }
        .support-info p { font-size: 16px; font-weight: 700; color: #ffffff; }
        .support-action-btn { font-size: 14px; color: #60a5fa; text-decoration: none; font-weight: 600; background: rgba(255,255,255,0.06); padding: 10px 20px; border-radius: 8px; border: 1px solid rgba(255,255,255,0.08); transition: 0.2s; }
        .support-action-btn:hover { background: #3b82f6; color: white; border-color: #3b82f6; }

        .footer-container {
            display: flex; justify-content: space-between; align-items: center;
            max-width: 1250px; width: 100%; margin: auto; padding: 25px 30px; color: var(--text-muted); font-size: 13px;
            border-top: 1px solid rgba(0, 0, 0, 0.04); background: rgba(255,255,255,0.15); backdrop-filter: blur(10px);
        }
        .footer-links { display: flex; gap: 20px; list-style: none; }
        .footer-links a { color: var(--text-muted); text-decoration: none; }
        .footer-links a:hover { color: var(--accent-blue); }
    </style>
</head>
<body>

    <form id="form1" runat="server">
        
        <nav class="navbar">
            <div class="brand-unit">
                <div class="brand-avatar">D</div>
                <div class="brand-headline">Dayton Natural Resources.PVT.LTD</div>
            </div>
            <ul class="nav-links">
                <li><a href="#about-framework-section">About</a></li>
                <li><a href="#corporate-about-section">Company Profile</a></li>
                <li><a href="#intelWorkspace">Resource Hub</a></li>
                <li><a href="#contact-section">Contact</a></li>
            </ul>
        </nav>

        <div class="main-container">
            <div class="info-panel">
                <div class="hero-text">
                    <h1>Asset Management System</h1>
                    <p>Unified hub for tracking distributed components and dynamic node setups across all active grids.</p>
                </div>
                
                <div class="about-icon-framework-card" id="about-framework-section">
                    <div class="vector-illustration-container">
                        <svg class="tech-vector-graphic" viewBox="0 0 100 100" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <circle cx="30" cy="40" r="8" fill="#3b82f6" fill-opacity="0.8"/>
                            <circle cx="70" cy="30" r="10" fill="#60a5fa" fill-opacity="0.9"/>
                            <circle cx="55" cy="75" r="7" fill="#2563eb"/>
                            <circle cx="75" cy="65" r="6" fill="#93c5fd"/>
                            <line x1="37" y1="38" x2="61" y2="31" stroke="#2563eb" stroke-width="2" stroke-dasharray="2 2"/>
                            <line x1="66" y1="38" x2="57" y2="69" stroke="#3b82f6" stroke-width="2"/>
                            <line x1="59" y1="73" x2="70" y2="67" stroke="#60a5fa" stroke-width="1.5"/>
                            <path d="M25 65 C 35 55, 45 80, 75 50" stroke="#3b82f6" stroke-width="3" stroke-linecap="round"/>
                            <path d="M25 80 L 40 68 L 55 74 L 75 58" stroke="#93c5fd" stroke-width="2" stroke-linejoin="round"/>
                        </svg>
                    </div>
                    <div class="about-framework-details">
                        <h3>About Our Framework</h3>
                        <p>Unified hub for tracking distributed components and dynamic node setups across all active pincode grids.</p>
                    </div>
                </div>
            </div>

            <div class="right-sidebar">
                <div class="console-card">
                    <h3>Gateway access</h3>
                    
                    <div class="form-group">
                        <label>Gateway</label>
                        <asp:DropDownList ID="ddlState" runat="server" CssClass="input-control" AutoPostBack="true" OnSelectedIndexChanged="ddlState_SelectedIndexChanged">
                            <asp:ListItem Text="Gateway Node" Value="" />
                            <asp:ListItem Text="Andhra Pradesh Terminal" Value="AP" />
                            <asp:ListItem Text="Delhi Central Terminal" Value="DL" />
                            <asp:ListItem Text="Karnataka Terminal" Value="KA" />
                            <asp:ListItem Text="Maharashtra Grid" Value="MH" />
                            <asp:ListItem Text="Rajasthan Hub" Value="RJ" />
                        </asp:DropDownList>
                    </div>

                    <div class="form-group">
                        <label>District Hub Selector</label>
                        <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="input-control" AutoPostBack="true" OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged" Enabled="false">
                            <asp:ListItem Text="Choose Dynamic Center" Value="" />
                        </asp:DropDownList>
                    </div>

                    <div class="form-group">
                        <label>Pincode Router Index</label>
                        <asp:DropDownList ID="ddlSubDistrict" runat="server" CssClass="input-control" AutoPostBack="true" OnSelectedIndexChanged="ddlSubDistrict_SelectedIndexChanged" Enabled="false">
                            <asp:ListItem Text="Pincode gateway" Value="" />
                        </asp:DropDownList>
                    </div>

                    <div class="form-group">
                        <label>Allocated Target Node</label>
                        <asp:DropDownList ID="ddlBranch" runat="server" CssClass="input-control" Enabled="false">
                            <asp:ListItem Text="Pincode Router" Value="" />
                        </asp:DropDownList>
                    </div>

                    <div class="pincode-divider">OR Fast Track Router</div>

                    <div class="form-group">
                        <label>Direct Area PIN Code</label>
                        <asp:TextBox ID="txtPinCode" runat="server" CssClass="input-control" Placeholder="Type 6-digit dynamic Pincode" MaxLength="6"></asp:TextBox>
                    </div>

                    <asp:Button ID="btnFetchDetails" runat="server" Text="Submit Lookup Request" CssClass="cta-button" OnClick="btnFetchDetails_Click" />
                </div>
            </div>
        </div>

        <asp:Panel ID="pnlWorkspace" runat="server" CssClass="workspace-block" Visible="false">
            <div id="intelWorkspace" class="panel-container">
                <div class="panel-header">
                    <div>
                        <h2>Asset & Staff Intelligence Desk</h2>
                        <p style="font-size:13px; color:var(--text-muted); margin-top:2px;">Real-time resource operational index</p>
                    </div>
                    <div>
                        <asp:HiddenField ID="hfSelectedTab" runat="server" Value="tab-assets" />
                        <ul class="tab-menu-row">
                            <li><button type="button" class="tab-btn active" onclick="switchIntelTab('tab-assets', this)">Inventory Infrastructure</button></li>
                            <li><button type="button" class="tab-btn" onclick="switchIntelTab('tab-staff', this)">Human Capital Index</button></li>
                            <li><button type="button" class="tab-btn" onclick="switchIntelTab('tab-assignments', this)">Ownership Allocations</button></li>
                            <li><button type="button" class="tab-btn" onclick="switchIntelTab('tab-services-view', this)">Our Core Services</button></li>
                        </ul>
                    </div>
                </div>

                <div id="tab-assets" class="tab-content-viewport active">
                    <div class="metrics-summary-row">
                        <div class="metric-mini-card"><span>IT Assets</span><h4><asp:Literal ID="litCountIT" runat="server" Text="0" /> Units</h4></div>
                        <div class="metric-mini-card"><span>Office Furniture</span><h4><asp:Literal ID="litCountFurniture" runat="server" Text="0" /> Pcs</h4></div>
                        <div class="metric-mini-card"><span>Electronics System</span><h4><asp:Literal ID="litCountElectronics" runat="server" Text="0" /> Hubs</h4></div>
                    </div>
                    <div class="data-table-wrapper">
                        <asp:GridView ID="gvAssets" runat="server" AutoGenerateColumns="False" CssClass="intel-table" GridLines="None" Width="100%">
                            <Columns>
                                <asp:BoundField DataField="AssetID" HeaderText="Asset Tag ID" />
                                <asp:BoundField DataField="AssetName" HeaderText="Item Nomenclature" />
                                <asp:TemplateField HeaderText="Classification Group">
                                    <ItemTemplate>
                                        <span class='badge-pill <%# Eval("Category").ToString().ToLower() %>'><%# Eval("Category") %></span>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Status" HeaderText="Current Status" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>

                <div id="tab-staff" class="tab-content-viewport">
                    <div class="data-table-wrapper">
                        <asp:GridView ID="gvStaff" runat="server" AutoGenerateColumns="False" CssClass="intel-table" GridLines="None" Width="100%">
                            <Columns>
                                <asp:BoundField DataField="StaffID" HeaderText="Staff Token ID" />
                                <asp:BoundField DataField="StaffName" HeaderText="Full Name" />
                                <asp:BoundField DataField="Post" HeaderText="Designated Post Role" />
                                <asp:BoundField DataField="JoiningDate" HeaderText="Date of Joining" DataFormatString="{0:dd-MMM-yyyy}" />
                                <asp:BoundField DataField="Salary" HeaderText="Remuneration Matrix" DataFormatString="INR {0:N2}" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>

                <div id="tab-assignments" class="tab-content-viewport">
                    <div class="data-table-wrapper">
                        <asp:GridView ID="gvAssignments" runat="server" AutoGenerateColumns="False" CssClass="intel-table" GridLines="None" Width="100%">
                            <Columns>
                                <asp:BoundField DataField="AssetTag" HeaderText="Asset Reference ID" />
                                <asp:BoundField DataField="AssetName" HeaderText="Equipment Type" />
                                <asp:BoundField DataField="AssignedTo" HeaderText="Accountable Custodian" />
                                <asp:BoundField DataField="Role" HeaderText="Staff Role Profile" />
                                <asp:BoundField DataField="HandoverDate" HeaderText="Assignment Date" DataFormatString="{0:dd-MMM-yyyy}" />
                            </Columns>
                        </asp:GridView>
                    </div>

                    <div class="chart-visual-layout">
                        <div class="chart-box-container">
                            <h3>Volume Density Distribution per Category</h3>
                            <div class="bar-chart-flex">
                                <div class="chart-row-unit">
                                    <div class="chart-label-text">IT Infrastructure</div>
                                    <div class="chart-bar-track"><div id="barIT" runat="server" class="chart-bar-fill blue"></div></div>
                                    <div class="chart-value-text"><asp:Literal ID="lblChartIT" runat="server" Text="0" /></div>
                                </div>
                                <div class="chart-row-unit">
                                    <div class="chart-label-text">Furniture Modules</div>
                                    <div class="chart-bar-track"><div id="barFur" runat="server" class="chart-bar-fill blue"></div></div>
                                    <div class="chart-value-text"><asp:Literal ID="lblChartFur" runat="server" Text="0" /></div>
                                </div>
                                <div class="chart-row-unit">
                                    <div class="chart-label-text">Electronic Units</div>
                                    <div class="chart-bar-track"><div id="barElec" runat="server" class="chart-bar-fill blue"></div></div>
                                    <div class="chart-value-text"><asp:Literal ID="lblChartElec" runat="server" Text="0" /></div>
                                </div>
                            </div>
                        </div>

                        <div class="chart-box-container">
                            <h3>Operational Cost Share metrics (Budget %)</h3>
                            <div class="bar-chart-flex">
                                <div class="chart-row-unit">
                                    <div class="chart-label-text">Executive Roles</div>
                                    <div class="chart-bar-track"><div id="barExecCost" runat="server" class="chart-bar-fill indigo"></div></div>
                                    <div class="chart-value-text"><asp:Literal ID="lblChartExec" runat="server" Text="0%" /></div>
                                </div>
                                <div class="chart-row-unit">
                                    <div class="chart-label-text">Technical Engineers</div>
                                    <div class="chart-bar-track"><div id="barTechCost" runat="server" class="chart-bar-fill indigo"></div></div>
                                    <div class="chart-value-text"><asp:Literal ID="lblChartTech" runat="server" Text="0%" /></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="tab-services-view" class="tab-content-viewport">
                    <div style="background: rgba(255,255,255,0.6); padding: 30px; border-radius: 20px; border: 1px dashed rgba(0,0,0,0.06);">
                        <h3 style="font-size: 20px; font-weight:800; color: var(--primary-dark); margin-bottom: 15px;">Corporate Operational Framework</h3>
                        <p style="font-size: 14px; color: var(--text-muted); line-height: 24px; margin-bottom: 25px;">
                            We precisely understand the engineering, systems tracking, and corporate asset distribution parameters required by structural grids. Here are our core disciplines:
                        </p>
                        
                        <div class="services-table-grid" style="margin-top: 10px;">
                            <div class="service-column-card" style="background: #ffffff;">
                                <h4>Site / Construction Engineering</h4>
                                <ul class="info-list">
                                    <li>Site Survey and Soil Investigation</li>
                                    <li>Structural Analysis and Reinforcement Solutions</li>
                                    <li>Foundation and Civil Work Design</li>
                                    <li>Electrical Utility and Land Development</li>
                                </ul>
                            </div>
                            <div class="service-column-card" style="background: #ffffff;">
                                <h4>Health Services, IT and ITeS</h4>
                                <ul class="info-list">
                                    <li>Emergency Response and Dispatch Centers</li>
                                    <li>MMU Digital Operations and Call Audits</li>
                                    <li>Mobile App and Data Centre Management</li>
                                    <li>IT Hardware and Health Analytics Software</li>
                                </ul>
                            </div>
                            <div class="service-column-card" style="background: #ffffff;">
                                <h4>Site Implementation & Management</h4>
                                <ul class="info-list">
                                    <li>Civil, Mechanical and Electrical Work</li>
                                    <li>Telecom BTS, MW, BSC and MSC I&C</li>
                                    <li>Project Planning and Logistics Management</li>
                                    <li>Permits, Clearances and Site Handover Docs</li>
                                </ul>
                            </div>
                        </div>

                        <h3 style="font-size: 16px; font-weight:700; color: var(--primary-dark); margin-top:30px; margin-bottom:10px;">Industries We Served</h3>
                        <p style="font-size: 14px; color: var(--text-muted); line-height: 22px;">
                            Healthcare Services, Emergency Response, ITeS (Emergency Call Centre), IT, Civil Work (Tower Foundation, Outdoor Pad, Electrical, Earthing), Solar, Diagnostics, Data Centre Management, IT and Digital Software Dev and Maintenance.
                        </p>
                    </div>
                </div>

                <div class="report-gen-area">
                    <asp:Button ID="btnGenerateReport" runat="server" Text="Generate & Download Node Report" CssClass="secondary-cta-btn" OnClick="btnGenerateReport_Click" />
                </div>
            </div>
        </asp:Panel>

        <div class="corporate-container">
            <div class="content-block" id="corporate-about-section">
                <h2>Dayton Natural Resources Pvt. Ltd.</h2>
                <div class="toll-free-badge">Toll Free Helpline: 1800-1800-555</div>
                <p>Established in 2018, Dayton Natural Resources Pvt. Ltd. is one of the leading systems integration Solutions Companies. We are a dedicated team of professionals having wide experience in the field of Health Services covering Emergency Response Systems, Civil Works, Diagnostics, Infrastructure Development, and Construction.</p>
                
                <h3>Our Ongoing Projects</h3>
                <ul class="info-list">
                    <li><strong>Co-Developer for Tripura Industrial Dev Corporation:</strong> Infrastructure Setup covering Civil, Electrical, Road Construction, and associated works.</li>
                    <li><strong>ITeS Services for Emergency Response Center (NHM - Govt of Rajasthan):</strong> 118 seated integrated call center providing 24x7 services for 108 / 104 Ambulances.</li>
                    <li><strong>TELEMANAS (Govt of India program):</strong> Centralized call centre with 45 seats managed with NHM - Govt of Rajasthan for Stress and Mental Health support.</li>
                </ul>
            </div>

            <div class="content-block" id="contact-section">
                <h2>Contact Us</h2>
                <div class="contact-grid">
                    <div class="contact-info-box">
                        <h3>Headquarters / Corporate Office</h3>
                        <p><strong>Dayton Natural Resources Pvt. Ltd.</strong></p>
                        <p>1st Floor, S I H F W Building, Near Doordarshan Kendra, Jhalana Institutional Area, Jaipur - 302004, Rajasthan, India</p>
                        <p>Email: <a href="mailto:info@daytonnaturalresources.com" style="color: var(--accent-blue); text-decoration: none; font-weight: 600;">info@daytonnaturalresources.com</a></p>
                    </div>
                    <div class="support-desk-strip">
                        <div class="support-info">
                            <h4>24x7 Help Desk</h4>
                            <p>1800-1800-555</p>
                        </div>
                        <a href="mailto:info@daytonnaturalresources.com" class="support-action-btn">Get In Touch</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="footer-container">
            <div>Copyright Dayton Natural Resources.PVT.LTD All Rights Reserved</div>
            <ul class="footer-links">
                <li><a href="#corporate-about-section">About Us</a></li>
                <li><a href="#">Terms and Conditions</a></li>
                <li><a href="#contact-section">Contact</a></li>
            </ul>
        </div>
    </form>

    <script type="text/javascript">
        function switchIntelTab(tabId, btnElement) {
            document.querySelectorAll('.tab-content-viewport').forEach(view => view.classList.remove('active'));
            document.querySelectorAll('.tab-btn').forEach(btn => btn.classList.remove('active'));
            
            const activeTab = document.getElementById(tabId);
            activeTab.classList.add('active');
            btnElement.classList.add('active');
            
            document.getElementById('<%= hfSelectedTab.ClientID %>').value = tabId;

            if (tabId === 'tab-services-view') {
                setTimeout(function () {
                    activeTab.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
                }, 50);
            }
        }

        window.addEventListener('DOMContentLoaded', () => {
            const preservedTab = document.getElementById('<%= hfSelectedTab.ClientID %>')?.value;
            if (preservedTab) {
                const targetedBtn = document.querySelector(`button[onclick*='${preservedTab}']`);
                if (targetedBtn) {
                    document.querySelectorAll('.tab-content-viewport').forEach(view => view.classList.remove('active'));
                    document.querySelectorAll('.tab-btn').forEach(btn => btn.classList.remove('active'));
                    document.getElementById(preservedTab).classList.add('active');
                    targetedBtn.classList.add('active');
                }
            }
        });
    </script>
</body>
</html>