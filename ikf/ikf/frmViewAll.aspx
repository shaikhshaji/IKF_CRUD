<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="frmViewAll.aspx.cs" Inherits="ikf.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder_Title" runat="server">
    View All User
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="card-header">
        <i class="fas fa-table me-1"></i>
        View All users
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


                <%--                <tr>
                    <td>Tiger Nixon</td>
                    <td>System Architect</td>
                    <td>Edinburgh</td>
                    <td>61</td>
                    <td>2011/04/25</td>
                    <td>$320,800</td>
                </tr>
                <tr>
                    <td>Garrett Winters</td>
                    <td>Accountant</td>
                    <td>Tokyo</td>
                    <td>63</td>
                    <td>2011/07/25</td>
                    <td>$170,750</td>
                </tr>
                <tr>
                    <td>Ashton Cox</td>
                    <td>Junior Technical Author</td>
                    <td>San Francisco</td>
                    <td>66</td>
                    <td>2009/01/12</td>
                    <td>$86,000</td>
                </tr>--%>
            </tbody>
        </table>
    </div>

</asp:Content>
