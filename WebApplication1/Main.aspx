<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="WebApplication1.Main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
    <link href="/style/main.css" rel="stylesheet" />
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#" style="margin: auto;">KyivFest</a>
      </div>
</nav>
  <div class="container my-3 pb-4">
    <div class="row ">
        <div class="col-md-8 pt-3 d-flex justify-content-center text-center">
            <div class="mb-2 ">
                <img height="380" src="/images/poster.jpeg"  alt="Alternate Text" />
            </div>
        </div>
        <div class="col-md-4 col-md-offset-1 pt-3">
            <div class="card">
                <div class="card-body mx-4 py-3">
                    <h5 class="card-title text-center">Форма Реєстрації</h5>
                   <form id="frmRegister" runat="server">
                          <div class="form-group">
                            <!-- Name -->
                            <div class="mb-0 ">
                               <%-- <asp:Label ID="lblName" runat="server" AssociatedControlID="txtName" class="form-label" Text="Ім`я: "></asp:Label>--%>
                                <asp:TextBox ID="txtName" runat="server" class="form-control input-sm" placeholder="Ім`я"></asp:TextBox>
                
                                <asp:RequiredFieldValidator 
                                    ID="validateRequiredName"
                                    runat="server" 
                                    ErrorMessage="* заповніть Ім`я"
                                    ControlToValidate="txtName"
                                    EnableClientScript="False">
                                </asp:RequiredFieldValidator>
                            </div>
                            <!-- Email -->
                            <div class="mb-0">
                                <%--<label for="txtEmail" class="form-label">Email: </label>--%>
                                <asp:TextBox ID="txtEmail" runat="server" class="form-control input-sm" placeholder="E-mail"></asp:TextBox>
               
                                <asp:RequiredFieldValidator 
                                    ID="validateRequiredEmail"
                                    runat="server" 
                                    ErrorMessage="* заповніть email"
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
                            </div>
                             <!-- Password -->
                              <div class="mb-0">
                                   <%-- <asp:Label ID="lblPassword" runat="server" AssociatedControlID="txtPassword"
                                        Text="Пароль: "></asp:Label>--%>
                                    <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" class="form-control input-sm"
                                        placeholder="Пароль"></asp:TextBox>
               
                                    <asp:RequiredFieldValidator 
                                        ID="validateRequiredPassword"
                                        runat="server" 
                                        ErrorMessage="* заповніть пароль"
                                        ControlToValidate="txtPassword"
                                        EnableClientScript="False">
                                    </asp:RequiredFieldValidator>
                               </div>
                             <!--Repeat Password -->
                            <div class="mb-0">
                                    <%--<asp:Label ID="lblPasswordRepeat" runat="server" AssociatedControlID="txtPasswordRepeat"
                                        Text="Повторити пароль: "></asp:Label>--%>
                
                                    <asp:TextBox ID="txtPasswordRepeat" TextMode="Password" runat="server" class="form-control input-sm"
                                        placeholder="Повторіть пароль"></asp:TextBox>
               
                                    <asp:RequiredFieldValidator 
                                        ID="validateRequiredPasswordRepeat"
                                        runat="server" 
                                        ErrorMessage="* повторіть пароль"
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
                               </div>
                            <!-- Birthday -->
                            <div class="mb-0">                            
                               <asp:TextBox ID="txtBirthDay" runat="server"></asp:TextBox>
                                <asp:TextBox runat="server" TextMode="Date"
                                    ID="txtCalendar" class="form-control input-sm" 
                                    OnTextChanged="txtCalendar_TextChanged">
                                </asp:TextBox>
               
                                <asp:RequiredFieldValidator 
                                    ID="validateRequiredBirthDay"
                                    runat="server" 
                                    ErrorMessage="* заповніть дату народження"
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
                            </div>

                            <!-- CheckRules -->
                            <div class="mb-1">
                                    <asp:CheckBox ID="cbxRules" runat="server" type="checkbox" OnCheckedChanged="cbxRules_CheckedChanged" />
                                    <label class="form-check-label" for="cbxRules">Згода з правилами </label>

                                    <!--TODO-->
                                  <%-- <div>
                                        <asp:ValidationSummary ID="ValidationSummary" runat="server" />
                                    </div>  --%>      
                                </div>
                            <div class="mb-0 text-center">
                                <asp:Button ID="btnRegister" runat="server" Text="Зареєструватись" OnClick="btnRegister_Click" CssClass="btn btn-primary" />
                                <asp:CustomValidator 
                                    ID="validateBtnRegister"
                                    runat="server" 
                                    ErrorMessage="* Є пробеми"
                                    EnableClientScript="false"
                                    OnServerValidate="validateBtnRegister_ServerValidate"
                                    >
                                </asp:CustomValidator>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div> 
<footer class="bg-dark text-center text-white">
    <div class="text-center p-3">
        © 2021 Copyright: KotOleksii HomeWork 2
    </div>
</footer>
</body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</html>
