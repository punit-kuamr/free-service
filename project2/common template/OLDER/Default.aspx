<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="Server">
    <style>
        /*.content input[type=text]*/
        .text {
            background: #fff;
            width: 100%;
            padding: 6px 6px;
            font-size: 13px;
            border: 1px solid #d3d3d3;
            font-family: 'Arial';
            height: 30px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        .bttn {
            display: inline-block;
            background: #b82619;
            padding: 7px 14px;
            font-size: 13px;
            font-weight: bold;
            border: 0px;
            cursor: pointer;
            color: #fff;
            font-family: 'Arial';
            border-radius: 2px;
            -moz-border-radius: 2px;
        }
        div.scroll
            {
            background-color:#FFFFFF;
            width:90%;
            height:800PX;
            FLOAT: left;
            margin-left: 0%;
            padding: 0%;
            overflow:auto;
            }
    </style>

    <link rel="stylesheet" href="https://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script src="https://code.jquery.com/jquery-1.9.1.js" type="text/javascript"></script>
    <script src="https://code.jquery.com/ui/1.10.3/jquery-ui.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(bindPicker);
            bindPicker();
        });
        function bindPicker() {
            $("input[type=text][id*=txtFromDate]").datepicker();
            $("input[type=text][id*=txtToDate]").datepicker();
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
 <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
    </asp:ScriptManager>
    <table style="margin-left: 40px;">
        <tr>
 
            <td style="width: 100px">District
            </td>
            <td style="width: 150px">
                <asp:DropDownList ID="ddlDistrict" runat="server"></asp:DropDownList>
            </td>
            <td>&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                From Date:<asp:TextBox ID="txtFromDate" runat="server" CssClass="text" Style="text-transform: uppercase" autocomplete="off"
                        onCut="javascript: return false;" onPaste="javascript: return false;" onKeyDown="javascript: return false;" onfocus="this.select();" />
&nbsp;</td>
            <td></td>
            <td>&nbspTo Date:<asp:TextBox ID="txtToDate" runat="server" CssClass="text" Style="text-transform: uppercase" autocomplete="off"
                        onCut="javascript: return false;" onPaste="javascript: return false;" onKeyDown="javascript: return false;" onfocus="this.select();" />
                &nbsp&nbsp</td>
            <td>
                <asp:Button runat="server" ID="btnBindData" Text="Fetch Data" 
                    OnClick="btnBindData_Click"></asp:Button>
            </td>
            <td>&nbsp&nbsp&nbsp&nbsp</td>
            <td>
                <asp:Button runat="server" ID="btnExport" Text="Export To Excel" OnClick="btnExport_Click"></asp:Button>
            </td>
            <%--<td>Submit
            </td>
            <td>
                <asp:Button runat="server" ID="btnSubmit" Text="Submit" OnClick="btnSubmit_Click" />
            </td>--%>
        </tr>


        <tr>
            <td>&nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>Status
            </td>
            <td>
                <asp:Label ID="lblStatus" runat="server"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblid" runat="server" Visible="false"></asp:Label>
            </td>
        </tr>

    </table>
    <div class="loading" align="center">
        <img src="images/quiz-loading.gif" alt="" runat="server" id="qzload"/>
    </div>
    <div class="scroll" style="margin-left: 2%; margin-top: 1%;">
        <asp:GridView ID="grdData" runat="server" Font-Names="Arial" 
            OnPageIndexChanging="grdData_PageIndexChanging" CssClass="gridview"
            Font-Size="11pt" HeaderStyle-BackColor="#993300" 
            HeaderStyle-ForeColor="White" HeaderStyle-CssClass="gridview" 
            RowStyle-HorizontalAlign="Center" PagerStyle-VerticalAlign="Middle" 
            AllowPaging="True" PageSize="50" CellPadding="4" ForeColor="#333333" 
            BorderColor="#003366" BorderStyle="None">
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
<HeaderStyle BackColor="#507CD1" CssClass="gridview" ForeColor="White" Font-Bold="True" 
                HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>

            <PagerStyle CssClass="GridviewScrollPager" BackColor="#2461BF" 
                ForeColor="White" HorizontalAlign="Center" />

<RowStyle HorizontalAlign="Center" BackColor="#EFF3FB" BorderColor="#003366"></RowStyle>
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
    </div>


    <div style="display:none">
         <asp:GridView ID="grdDatadummy" runat="server" Font-Size="11pt" HeaderStyle-BackColor="#993300" CssClass="gridview" HeaderStyle-CssClass="gridview" HeaderStyle-ForeColor="White"  >  </asp:GridView>
    </div>

</asp:Content>

