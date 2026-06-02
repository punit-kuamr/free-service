<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LOGINPAGE.aspx.cs" Inherits="LOGINPAGE" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dayton Natural Resources .PVT .LTD</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Inter', sans-serif; }
        
        body {
            height: 100vh; width: 100vw; display: flex; justify-content: center; align-items: center;
            background: #f1f5f9;
            overflow: hidden; position: relative;
            padding: 20px; /* स्क्रीन के चारों तरफ सुरक्षित गैप */
        }

        .ambient-glow {
            position: absolute; width: 700px; height: 700px; border-radius: 50%;
            background: radial-gradient(circle, rgba(203, 213, 225, 0.7) 0%, rgba(241, 245, 249, 0) 70%);
            top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 1;
        }

        /* 👑 जादू यहाँ है: यह बॉक्स अब लैपटॉप की स्क्रीन हाइट के अनुसार ऑटो-एडजस्ट होगा */
        .portal-wrapper {
            position: relative; z-index: 10;
            background: #ffffff;
            box-shadow: 0 30px 70px rgba(15, 23, 42, 0.15);
            width: 100%; max-width: 1150px; 
            
            /* फिक्स px हटाकर लैपटॉप की वर्टिकल स्क्रीन का 88% हाइट दे दिया ताकि बटन न कटे */
            height: 88vh; 
            max-height: 720px;
            min-height: 560px;
            
            border-radius: 20px; overflow: hidden;
            animation: paneEntrance 0.5s cubic-bezier(0.16, 1, 0.3, 1);
        }

        @keyframes paneEntrance {
            from { opacity: 0; transform: scale(0.98) translateY(10px); }
            to { opacity: 1; transform: scale(1) translateY(0); }
        }

        .executive-grid { display: flex; width: 100%; height: 100%; }

        /* LEFT PANEL */
        .slideshow-sidebar {
            width: 46%; height: 100%; position: relative; overflow: hidden;
            background: #0f172a;
        }

        .slide-track { width: 100%; height: 100%; position: relative; }

        .slide-item {
            position: absolute; width: 100%; height: 100%; top: 0; left: 0;
            opacity: 0; transform: scale(1.12); filter: brightness(0.7);
            background-size: cover; background-position: center;
            animation: dynamicSlideshow 15s infinite ease-in-out;
        }

        .slide-item:nth-child(1) {
            background-image: url('https://images.unsplash.com/photo-1497215728101-856f4ea42174?auto=format&fit=crop&w=800&q=80');
            animation-delay: 0s;
        }
        .slide-item:nth-child(2) {
            background-image: url('https://images.unsplash.com/photo-1497366216548-37526070297c?auto=format&fit=crop&w=800&q=80');
            animation-delay: 5s;
        }
        .slide-item:nth-child(3) {
            background-image: url('https://images.unsplash.com/photo-1606857521015-7f9fcf423740?auto=format&fit=crop&w=800&q=80');
            animation-delay: 10s;
        }

        @keyframes dynamicSlideshow {
            0% { opacity: 0; transform: scale(1.12); }
            10% { opacity: 1; }
            33% { opacity: 1; transform: scale(1.03); }
            43% { opacity: 0; transform: scale(1); }
            100% { opacity: 0; }
        }

        .slide-overlay-content {
            position: absolute; inset: 0; z-index: 5;
            padding: 40px; display: flex; flex-direction: column; justify-content: space-between;
            background: linear-gradient(to bottom, rgba(15, 23, 42, 0.2) 0%, rgba(15, 23, 42, 0.8) 100%);
            color: #ffffff;
        }

        .brand-unit { display: flex; align-items: center; gap: 12px; }
        .brand-avatar {
            width: 38px; height: 38px; background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(8px); -webkit-backdrop-filter: blur(8px);
            display: flex; align-items: center; justify-content: center; border-radius: 8px;
            font-weight: 700; font-size: 16px; color: #ffffff; border: 1px solid rgba(255, 255, 255, 0.2);
        }
        .brand-headline { font-size: 15px; font-weight: 700; letter-spacing: -0.2px; }
        .brand-headline span { opacity: 0.8; display: block; font-size: 11px; font-weight: 400; }

        .slide-overlay-content h1 { font-size: 28px; line-height: 38px; font-weight: 800; letter-spacing: -0.5px; }
        .slide-overlay-content p { font-size: 13px; opacity: 0.85; line-height: 22px; margin-top: 10px; font-weight: 400; }

        /* RIGHT PANEL: Forms - पैडिंग को कंप्रेस किया ताकि सब कुछ अंदर आ जाए */
        .interaction-panel { 
            width: 54%; height: 100%; padding: 25px 45px; 
            display: flex; flex-direction: column; justify-content: center; background: #ffffff;
        }
        .interaction-panel h2 { font-size: 24px; font-weight: 700; color: #0f172a; letter-spacing: -0.4px; }
        .interaction-panel p { color: #64748b; font-size: 13px; margin-bottom: 16px; margin-top: 2px; }
        
        .input-group { margin-bottom: 12px; }
        .input-group label { display: block; font-size: 11px; color: #475569; font-weight: 600; margin-bottom: 5px; text-transform: uppercase; letter-spacing: 0.4px; }
        
        .control-input { 
            width: 100%; padding: 10px 14px; background: #f8fafc; 
            border: 1px solid #e2e8f0; border-radius: 8px; 
            color: #0f172a; font-size: 13px; font-weight: 500; outline: none; 
            transition: all 0.2s ease; 
        }
        .control-input option { background: #ffffff; color: #0f172a; }
        .control-input:focus { 
            border-color: #0f172a; background: #ffffff;
            box-shadow: 0 0 0 3px rgba(15, 23, 42, 0.05);
        }

        /* कैप्चा ब्लॉक का साइज लैपटॉप स्क्रीन के हिसाब से छोटा और साफ़ किया */
        .captcha-slab { background: #f8fafc; border: 1px solid #e2e8f0; padding: 10px; border-radius: 10px; margin-bottom: 16px; }
        .captcha-flex-row { display: flex; gap: 10px; align-items: center; margin-top: 4px; }
        .captcha-render-box { 
            flex: 1; background: #ffffff; color: #0f172a; 
            padding: 8px; text-align: center; font-size: 20px; font-weight: 700;
            letter-spacing: 8px; border-radius: 6px; user-select: none; border: 1px solid #e2e8f0;
        }
        
        .refresh-action { 
            padding: 9px 14px; background: #ffffff; border: 1px solid #cbd5e1; 
            color: #475569; border-radius: 6px; cursor: pointer; font-size: 12px; font-weight: 600;
            transition: all 0.15s;
        }
        .refresh-action:hover { background: #f1f5f9; color: #0f172a; }

        .submit-action-btn { 
            width: 100%; padding: 12px; background: #0f172a; 
            border: none; border-radius: 8px; color: #ffffff; font-size: 14px; font-weight: 600; 
            cursor: pointer; transition: all 0.2s ease; 
            box-shadow: 0 4px 12px rgba(15, 23, 42, 0.1);
        }
        .submit-action-btn:hover { 
            background: #1e293b; transform: translateY(-0.5px);
            box-shadow: 0 6px 16px rgba(15, 23, 42, 0.15);
        }

        .alert-label { display: block; margin-top: 10px; text-align: center; font-size: 12px; font-weight: 600; }
    </style>
</head>
<body>
    <div class="ambient-glow"></div>

    <form id="form1" runat="server" style="width: 100%; display: flex; justify-content: center; align-items: center;">
        <asp:HiddenField ID="hdnServerCaptcha" runat="server" />

        <div class="portal-wrapper">
            <div class="executive-grid">
                
                <div class="slideshow-sidebar">
                    <div class="slide-track">
                        <div class="slide-item"></div>
                        <div class="slide-item"></div>
                        <div class="slide-item"></div>
                    </div>
                    
                    <div class="slide-overlay-content">
                        <div class="brand-unit">
                            <div class="brand-avatar">D</div>
                            <div class="brand-headline">DNR<span>Dayton Natural Resources.PVT.LTD.</span></div>
                        </div>
                        
                        <div>
                            <h1>Intelligent Asset<br>Management System</h1>
                            <p>Streamlined dynamic framework crafted to monitor global server deployments, lifecycle tracking, and instant clearance checks.</p>
                        </div>
                    </div>
                </div>

                <div class="interaction-panel">
                    <h2>Welcome Back</h2>
                    <p>Enter organizational clearance credentials.</p>

                    <div class="input-group">
                        <label>Organizational Assignment</label>
                        <asp:DropDownList ID="ddlRole" runat="server" CssClass="control-input">
                            <asp:ListItem Text="-- Select System Privilege --" Value="" />
                            <asp:ListItem Text="Admin" Value="Admin" />
                            <asp:ListItem Text="manager" Value="Manager" />
                            <asp:ListItem Text="Authorized Staff" Value="Staff" />
                        </asp:DropDownList>
                    </div>

                    <div class="input-group">
                        <label>Identity Signature</label>
                        <asp:TextBox ID="txtUsername" runat="server" CssClass="control-input" placeholder="Your username identifier" autocomplete="off"></asp:TextBox>
                    </div>

                    <div class="input-group">
                        <label>Security Access Code</label>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="control-input" TextMode="Password" placeholder="Your account password"></asp:TextBox>
                    </div>

                    <div class="captcha-slab">
                        <label>Anti-Bot Assertion</label>
                        <div class="captcha-flex-row">
                            <div class="captcha-render-box" id="lblCaptcha">XXXXXX</div>
                            <button type="button" class="refresh-action" onclick="generateCaptcha()">Refresh</button>
                        </div>
                        <div class="input-group" style="margin-top: 10px; margin-bottom: 0;">
                            <asp:TextBox ID="txtCaptchaInput" runat="server" CssClass="control-input" placeholder="Type characters shown above" autocomplete="off"></asp:TextBox>
                        </div>
                    </div>

                    <asp:Button ID="btnLogin" runat="server" Text="SIGN IN TO ENVIRONMENT" CssClass="submit-action-btn" OnClick="btnLogin_Click" />

                    <asp:Label ID="lblMessage" runat="server" CssClass="alert-label"></asp:Label>
                </div>

            </div>
        </div>
    </form>

    <script>
        function generateCaptcha() {
            const chars = "ABCDEFGHJKLMNOPQRSTUVWXYZabcdefghkmnpqrstuvwxyz23456789";
            let text = "";
            for (let i = 0; i < 6; i++) {
                text += chars.charAt(Math.floor(Math.random() * chars.length));
            }
            document.getElementById("lblCaptcha").innerText = text;
            document.getElementById("<%= hdnServerCaptcha.ClientID %>").value = text;
            document.getElementById("<%= txtCaptchaInput.ClientID %>").value = "";
        }
        window.onload = function () { generateCaptcha(); };
    </script>
</body>
</html>