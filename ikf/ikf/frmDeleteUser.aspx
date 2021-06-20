<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="frmDeleteUser.aspx.cs" Inherits="ikf.frmDeleteUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder_Title" runat="server">
    Delete User
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="card-header">

        <div class="row">
            <div class="col col-4" style="text-align: right;">
                <h5>Please enter the ID to Delete the User:</h5>
            </div>

            <div class="col col-2" style="text-align: left;">
                <asp:TextBox ID="txtID" CssClass="form-control" runat="server"></asp:TextBox>
            </div>

            <div class="col col-3" style="text-align: left;">
                <asp:Button ID="btnDelete" runat="server" CssClass="btn btn-danger" Text="Delete User?" OnClick="btnDelete_Click" />
            </div>

            <div class="col col-3" style="text-align: left;">
                <asp:Label ID="lblErr" runat="server" Text="" Visible="false"></asp:Label>
            </div>
        </div>

    </div>

    <div class="card-body">
        <table id="datatablesSimple">
            <thead>
                <tr>
                    <th>id</th>
                    <th>Name</th>
                    <th>Date of Birth</th>
                    <th>Designation</th>
                    <th>Skill Sets</th>
                </tr>
            </thead>
            <tfoot>
                <tr>
                    <th>id</th>
                    <th>Name</th>
                    <th>Date of Birth</th>
                    <th>Designation</th>
                    <th>Skill Sets</th>
                </tr>
            </tfoot>
            <tbody>
                <asp:Repeater ID="rpt_view_emp" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("id") %> </td>
                            <td><%# Eval("Name") %> </td>
                            <td><%# Eval("DOB") %> </td>
                            <td><%# Eval("Designation") %> </td>
                            <td><%# Eval("skillset") %> </td>

                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </div>

</asp:Content>
