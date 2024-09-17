﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="OrderStatus.aspx.cs" Inherits="foodie.Admin.OrderStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        window.onload = function () {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID%>").style.display = "none";
            }, seconds * 1000);
        };
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="pcoded-inner-content pt-0">
        <div class="align-align-self-end">
            <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
        </div>
        <div class="main-body">
            <div class="page-wrapper">
                <div class="page-body">
                    <div class="row">
                        <div class="col-sm-12 ">
                            <div class="card">
                                <div class="card-header">
                                </div>
                                <div class="card-block">
                                    <div class="row">
                                        <div class="col-sm-6 col-md-8 col-lg-8">
                                            <h4 class="sub-title">Danh sách đơn hàng</h4>
                                            <div class="card-block table-border-style">
                                                <div class="table-responsive">
                                                    <asp:Repeater ID="rOrderStatus" runat="server" OnItemCommand="rOrderStatus_ItemCommand">
                                                        <HeaderTemplate>
                                                            <table class="table data-table-export table-hover nowrap">
                                                                <thead>
                                                                    <tr>
                                                                        <th class="table-plus">Số đơn hàng</th>
                                                                        <th>Ngày đặt hàng</th>
                                                                        <th>Trạng thái</th>
                                                                        <th>Tên sản phẩm</th>
                                                                        <th>Tổng giá</th>
                                                                        <th>Phương thức thanh toán</th>
                                                                        <th class="dataTable-nosort">Chỉnh sửa</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td class="table-plus"><%#Eval("OrderNo")%></td>
                                                                <td><%#Eval("OrderDate")%></td>
                                                                <td>
                                                                    <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("Status")%>'
                                                                        CssClass='<%#Eval("Status").ToString()=="Delivered"? "badge badge-success" : "badge badge-warning"%>'></asp:Label>
                                                                </td>
                                                                <td><%#Eval("Name")%></td>
                                                                <td><%#Eval("TotalPrice")%> đ</td>
                                                                <td><%#Eval("PaymentMode")%></td>
                                                                <td>
                                                                    <asp:LinkButton ID="lnkEdit" Text="Chỉnh sửa" runat="server" CssClass="badge badge-primary"
                                                                        CommandArgument='<%# Eval("OrderDetailsId") %>' CommandName="edit">
                                                                        <i class="ti-pencil"></i>
                                                                    </asp:LinkButton>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            </tbody>
                                                            </table>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 col-md-4 col-lg-4 mobile-inputs">
                                            <asp:Panel ID="pUpdateOrderStatus" runat="server">
                                                <h4 class="sub-title">Cập nhật trạng thái</h4>
                                                <div>
                                                    <div class="form-group">
                                                        <label>Trạng thái đơn hàng</label>
                                                        <div>
                                                            <asp:DropDownList ID="ddlOrderStatus" runat="server" CssClass="form-control">
                                                                <asp:ListItem Value="0">Chọn trạng thái</asp:ListItem>
                                                                <asp:ListItem>Pending</asp:ListItem>
                                                                <asp:ListItem>Dispatched</asp:ListItem>
                                                                <asp:ListItem>Delivered</asp:ListItem>
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="rfvDdlOrderStatus" runat="server" ForeColor="Red" ControlToValidate="ddlOrderStatus"
                                                                ErrorMessage="Trạng thái đơn hàng là bắt buộc" SetFocusOnError="true" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
                                                            <asp:HiddenField ID="hdnId" runat="server" Value="0" />
                                                        </div>
                                                    </div>
                                                    <div class="pb-5">
                                                        <asp:Button ID="btnUpdate" runat="server" Text="Cập nhật" CssClass="btn btn-primary"
                                                            OnClick="btnUpdate_Click" />
                                                        &nbsp;
                                                        <asp:Button ID="btnClear" runat="server" Text="Làm mới" CssClass="btn btn-primary" 
                                                            OnClick="btnClear_Click" />
                                                    </div>
                                                </div>
                                            </asp:Panel>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
