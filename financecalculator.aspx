<%@ Page Language="C#" AutoEventWireup="true" Inherits="EducationalApps.financecalculator" CodeFile="financecalculator.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>ASP.net Lesson 6</title>
	<link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <span style="font-size: 24pt"><strong>Payment Calculator<br />
            <br />
        </strong><span style="font-size: 12pt">How much are you borrowing?<br />
            <asp:TextBox ID="txtPrincipal" runat="server" CssClass="input"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPrincipal"
                Display="Dynamic" ErrorMessage="Please enter your loan amount." SetFocusOnError="True"></asp:RequiredFieldValidator>&nbsp;
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPrincipal"
                Display="Dynamic" ErrorMessage="Please only enter a dollar amount with no cents."
                SetFocusOnError="True" ValidationExpression="^(\d|,)*\d*$"></asp:RegularExpressionValidator>
                <!--This regular expression accepts positive integers only, including commas. -->
                <br />
            <br />
            What is the annual interest rate for your loan?<br />
            <asp:DropDownList ID="ddlInterest" runat="server">
                
            </asp:DropDownList><br />
            <br />
            Over how many years are you financing the loan?<br />
            <asp:DropDownList ID="ddlYears" runat="server">
                <asp:ListItem>5</asp:ListItem>
                <asp:ListItem>10</asp:ListItem>
                <asp:ListItem>15</asp:ListItem>
                <asp:ListItem>20</asp:ListItem>
                <asp:ListItem>25</asp:ListItem>
                <asp:ListItem>30</asp:ListItem>
            </asp:DropDownList><br />
            <br />
            <asp:Button ID="btnCalculate" runat="server" OnClick="btnCalculate_Click" Text="Calculate Monthly Payment" /><br />
            <br />
            <asp:Label ID="lblMonthlyPayment" runat="server"></asp:Label></span></span></div>
    </form>
</body>
</html>
