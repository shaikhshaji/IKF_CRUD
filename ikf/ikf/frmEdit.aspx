<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="frmEdit.aspx.cs" Inherits="ikf.frmEdit" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <style>
        .ajax__calendar_container {
            z-index: 1000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></cc1:ToolkitScriptManager>


    <div class="card-header">

        <div class="row">
            <div class="col col-4" style="text-align: right;">
                <h5>Please enter the ID to Edit the User:</h5>
            </div>

            <div class="col col-2" style="text-align: left;">
                <asp:TextBox ID="txtID" CssClass="form-control" runat="server"></asp:TextBox>
            </div>

            <div class="col col-3" style="text-align: left;">
                <asp:Button ID="btnEdit" runat="server" CssClass="btn btn-primary" Text="Edit User?" OnClick="btnEdit_Click" />
            </div>

            <div class="col col-3" style="text-align: left;">
                <asp:Label ID="lblErr" runat="server" Text="" Visible="false"></asp:Label>
            </div>
        </div>

    </div>



    <!-- container adding controls from the ASP.net -->
    <div class="">
        <div class="row justify-content-center">
            <div class="col-4">
                <div class="card-body">
                    <table style="width: 100%;">



                        <!-- name -->
                        <tr>
                            <td style="text-align: left; width: 150px;">Enter full Name:</td>
                            <td>
                                <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" type="text" placeholder="Enter your Full Name"></asp:TextBox>

                            </td>

                            <td>
                                <asp:Label ID="lbl_er1" runat="server" Text="&nbsp;&nbsp; <--" ForeColor="Red" Visible="false"></asp:Label>
                            </td>
                        </tr>
                        <!-- name end     -->


                        <!-- DOB -->
                        <tr>
                            <td style="text-align: left;">Enter Date of Birth:
                            </td>

                            <td>
                                <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control" type="text" placeholder="Enter  Date of Birth"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtDOB_CalendarExtender" runat="server" Enabled="True" TargetControlID="txtDOB">
                                </cc1:CalendarExtender>
                            </td>

                            <td>
                                <asp:Label ID="lbl_er2" runat="server" Text="&nbsp;&nbsp; <--" ForeColor="Red" Visible="false"></asp:Label>
                            </td>
                        </tr>
                        <!-- DOB END -->


                        <!-- DESIGNATION -->
                        <tr>
                            <td style="text-align: left;">Select Designation:</td>

                            <td>
                                <asp:DropDownList ID="dd_designation" runat="server" DataTextField="designation" DataValueField="id" CssClass="form-control" type="text"></asp:DropDownList>
                            </td>

                            <td>
                                <asp:Label ID="lbl_er3" runat="server" Text="&nbsp;&nbsp; <--" ForeColor="Red" Visible="false"></asp:Label>
                            </td>
                        </tr>
                        <!-- DESIGNATION END -->


                        <!-- SKILL SET -->
                        <tr>
                            <td style="text-align: left;">Select Skill set(s):
                            </td>

                            <td>

                                <asp:TextBox ID="txtSkills" runat="server" placeholder="Select Skill" CssClass="form-control"></asp:TextBox>

                            </td>



                            <td>
                                <asp:Label ID="lbl_er4" runat="server" Text="&nbsp;&nbsp; <--" ForeColor="Red" Visible="false"></asp:Label>
                            </td>
                        </tr>
                        <!-- SKILL SET END -->



                        <!-- HR -->
                        <tr>
                            <td colspan="3" style="text-align: center;">
                                <%--  <hr />--%>
                            </td>
                        </tr>
                        <!-- HR END -->


                        <!-- BUTTONS -->
                        <tr>
                            <td colspan="3" style="text-align: center; padding-top: 10px; padding-bottom: 10px;">

                                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-success btn-block" Text="Update User" Width="150px" OnClick="btnSubmit_Click" />

                                <asp:Button ID="btnReset" runat="server" CssClass="btn btn-danger btn-block" Text="Cancel" Width="150px" />
                            </td>
                        </tr>
                        <!-- BUTTONS END -->

                    </table>

                </div>
            </div>

            <div class="col-8">

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

            </div>
        </div>
        <br />
        >
    </div>
    <!-- end container adding controls from the ASP.net -->





</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder_Title" runat="server">
    Add New User
</asp:Content>

