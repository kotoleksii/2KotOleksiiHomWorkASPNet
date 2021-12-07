<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="WebApplication1.Main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
     <form id="frmRegister" runat="server">
        <table>
            <!-- Name -->
            <tr>
                <td>
                    <asp:Label ID="lblName" runat="server" AssociatedControlID="txtName" Text="Ім`я: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator 
                        ID="validateRequiredName"
                        runat="server" 
                        ErrorMessage="* requared field name"
                        ControlToValidate="txtName"
                        EnableClientScript="False">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <!-- Email -->
            <tr>
                <td>
                   <label for="txtEmail">Email: </label>
                </td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator 
                        ID="validateRequiredEmail"
                        runat="server" 
                        ErrorMessage="* requared field - email"
                        ControlToValidate="txtEmail"
                        EnableClientScript="False">
                    </asp:RequiredFieldValidator>

                    <asp:RegularExpressionValidator 
                        ID="validateRegExpEmail" 
                        runat="server"
                        ErrorMessage="* wrong email format"
                        ControlToValidate="txtEmail"
                        EnableClientScript="False"
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        >
                    </asp:RegularExpressionValidator>
                </td>
            </tr>

             <!-- Password -->
            <tr>
                <td>
                    <asp:Label ID="lblPassword" runat="server" AssociatedControlID="txtPassword"
                        Text="Пароль: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPassword" TextMode="Password" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator 
                        ID="validateRequiredPassword"
                        runat="server" 
                        ErrorMessage="* requared field password"
                        ControlToValidate="txtPassword"
                        EnableClientScript="False">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
             <!--Repeat Password -->
            <tr>
                <td>
                    <asp:Label ID="lblPasswordRepeat" runat="server" AssociatedControlID="txtPasswordRepeat"
                        Text="Повторити пароль: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPasswordRepeat" TextMode="Password" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator 
                        ID="validateRequiredPasswordRepeat"
                        runat="server" 
                        ErrorMessage="* requared field password repeat"
                        ControlToValidate="txtPasswordRepeat"
                        EnableClientScript="False">
                    </asp:RequiredFieldValidator>
                    <asp:CompareValidator 
                        ID="validateComparePassword"
                        runat="server"
                        ErrorMessage="* паролі не співпадають"
                        ControlToValidate="txtPasswordRepeat"
                        ControlToCompare="txtPassword"
                        EnableClientScript="false"
                        >
                    </asp:CompareValidator>
                </td>
            </tr>
            <!-- Birthday -->
            <tr>
                <td>
                   <label for="txtBirthDay">Дата Народження: </label>
                </td>
                <td>
                    <asp:TextBox ID="txtBirthDay" runat="server"></asp:TextBox>
                    <asp:Calendar ID="cldrBirthDay" runat="server" OnSelectionChanged="cldrBirthDay_SelectionChanged" VisibleDate="01.01.0001" Visible="True"></asp:Calendar>
                </td>
                <td>
                    <asp:RequiredFieldValidator 
                        ID="validateRequiredBirthDay"
                        runat="server" 
                        ErrorMessage="* requared field - Дата Народження"
                        ControlToValidate="txtBirthDay"
                        EnableClientScript="False">
                    </asp:RequiredFieldValidator>

                    <asp:RangeValidator 
                        ID="validateRangeBirthDay"
                        runat="server" 
                        ErrorMessage="* 14+"
                        ControlToValidate="txtBirthDay"
                        EnableClientScript="False"
                        MinimumValue="14"
                        MaximumValue="99"
                        >
                    </asp:RangeValidator>
                </td>
            </tr>         

            <!-- CheckRules -->
            <tr>
                <td>
                    <label>Згода з правилами </label>
                </td>
                <td>
                    <asp:CheckBox ID="cbxRules" runat="server" OnCheckedChanged="cbxRules_CheckedChanged" />
                </td>
                <td>
                    <!--TODO-->
                    <div>
                        <asp:ValidationSummary ID="ValidationSummary" runat="server" />
                    </div>
                </td>
            </tr>

            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnRegister" runat="server" Text="Registration" OnClick="btnRegister_Click"/>
                    <asp:CustomValidator 
                        ID="validateBtnRegister"
                        runat="server" 
                        ErrorMessage="* Є пробеми"
                        EnableClientScript="false"
                        OnServerValidate="validateBtnRegister_ServerValidate"
                        >
                    </asp:CustomValidator>
                </td>
                <td></td>
            </tr>
        </table>
       
    </form>
</body>
</html>
