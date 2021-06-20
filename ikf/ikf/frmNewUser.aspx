<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="frmNewUser.aspx.cs" Inherits="ikf.frmNewUser" %>

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

    <!-- container adding controls from the ASP.net -->
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-7">
                <div class="card shadow-lg border-0 rounded-lg mt-5">
                    <div class="card-body">
                        <table style="width: 100%;">



                            <!-- name -->
                            <tr>
                                <td style="text-align: left; width: 150px;">Enter full Name:</td>
                                <td>
                                    <div class="form-floating mb-3">
                                        <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" type="text" placeholder="Enter your Full Name"></asp:TextBox>
                                        <label for="txtFullName">Enter Your full Name</label>
                                    </div>

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
                                    <div class="form-floating mb-3">
                                        <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control" type="text" placeholder="Enter  Date of Birth"></asp:TextBox>
                                        <label for="txtDOB">Enter Date of Birth</label>
                                        <cc1:CalendarExtender ID="txtDOB_CalendarExtender" runat="server" Enabled="True" TargetControlID="txtDOB">
                                        </cc1:CalendarExtender>
                                    </div>
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
                                    <div class="form-floating mb-3">
                                        <asp:DropDownList ID="dd_designation" runat="server" DataTextField="designation" DataValueField="id" CssClass="form-control" type="text"></asp:DropDownList>
                                        <label for="txtDOB">Select Designation</label>
                                    </div>
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
                                    <div class="form-floating mb-3">
                                        <asp:TextBox ID="txtSkills" runat="server" placeholder="Select Skill" CssClass="form-control" type="text"></asp:TextBox>

                                        <cc1:PopupControlExtender ID="PopupControlExtender1" runat="server" TargetControlID="txtSkills" Enabled="true" ExtenderControlID=""
                                            PopupControlID="pnlSkill" OffsetY="22">
                                        </cc1:PopupControlExtender>

                                        <asp:Panel ID="pnlSkill" runat="server" Style="display: none; margin-top: 10px; background-color: white;"
                                            Height="300px" Width="100%" BorderStyle="Solid" BorderWidth="1px" Direction="LeftToRight" ScrollBars="Auto">

                                            <asp:CheckBoxList ID="ckbx_skill_list" runat="server" CssClass="form-check custom-checkbox" AutoPostBack="false" OnSelectedIndexChanged="ckbx_skill_list_SelectedIndexChanged"></asp:CheckBoxList>
                                        </asp:Panel>
                                        <label for="txtDOB">Select SkillSet</label>
                                    </div>
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
                                <td colspan="3" style="text-align: center;">

                                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-success btn-block" Text="Add a new User" Width="200px" OnClick="btnSubmit_Click" />
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
                                    <asp:Button ID="btnReset" runat="server" CssClass="btn btn-danger btn-block" Text="Cancel" Width="200px" />
                                </td>
                            </tr>
                            <!-- BUTTONS END -->

                        </table>

                    </div>
                </div>
            </div>
        </div>
        <br />
        <br />
        <br />
        <br />
    </div>
    <!-- end container adding controls from the ASP.net -->

    <asp:Label ID="Label1" runat="server" Text="test"></asp:Label>



</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder_Title" runat="server">
    Add New User
</asp:Content>

