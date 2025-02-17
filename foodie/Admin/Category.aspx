﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="foodie.Admin.Category" %>
<%@ Import Namespace="foodie" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>

        window.onload = function () {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID%>").style.display = "none";
                }, seconds * 1000);
        };
    </script>
    <script>
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=imgCategory.ClientID%>').prop('src', e.target.result)
                        .width(200)
                        .height(200);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
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
                                    <div class="col-sm-6 col-md-4 col-lg-4">
                                        <h4 class="sub-title">Danh mục</h4>
                                        <div>
                                            <div class="form-group">
                                                <label>Tên danh mục</label>
                                                <div>
                                                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control"
                                                        plceholder="Nhập tên danh mục" required></asp:TextBox>
                                                    <asp:HiddenField ID="hdnId" runat="server" Value="0" />
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label>Hình ảnh danh mục</label>
                                                <div>
                                                    
                                                    <asp:FileUpload ID="fuCategoryImage" runat="server" CssClass="form-control" onchange="ImagePreview(this)" />


                                                </div>
                                            </div>
                                            <div class="form-check pl-4">
                                             
                                                <div>
                                                    <asp:CheckBox ID="cbIsActive" runat="server" Text="&nbsp; Kích hoạt" CssClass="form-check-input"
                                                         />

                                                </div>
                                            </div>
                                            <div class="pb-5">
                                                <asp:Button ID="btnAddOrUpdate" runat="server" Text="Thêm" CssClass="btn btn-primary" 
                                                    OnClick="btnAddOrUpdate_Click"/>
                                                &nbsp;<asp:Button ID="btnClear" runat="server" Text="Xóa"  CssClass="btn btn-primary" CausesValidation="false" OnClick="btnClear_Click"/>
                                                

                                            </div>
                                            <div>
                                                <asp:Image ID="imgCategory" runat="server" CssClass="img-thumbnail" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-sm-6 col-md-8 col-lg-8 mobile-inputs">
                                        <h4 class="sub-title">Danh sách danh mục</h4>
                                        <div class="card-block table-border-style">
                                            <div class="table-responsive">
                                                <asp:Repeater ID="rCategory" runat="server" OnItemCommand="rCategory_ItemCommand"
                                                    OnItemDataBound="rCategory_ItemDataBound">
                                                    <HeaderTemplate>
                                                        <table class="table data-table-export table-hover nowrap">
                                                            <thead>

                                                           
                                                            <tr>
                                                                <th  class="table-plus">Tên</th>
                                                                <th>Hình ảnh</th>
                                                                <th>Kích hoạt</th>
                                                                <th>Ngày tạo</th>
                                                                <th class="dataTable">Thao tác</th>
                                                            </tr>
                                                                 </thead>
                                                            <tbody>
                                                        
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td class="table-plus"><%#Eval("Name")%> </td>
                                                            <td>
                                                                <img alt="" Width="40" src="<%# Utils.GetImageUrl( Eval("ImageUrl")) %>" />
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblIsActive"  runat="server" Text='<%#Eval("IsActive")%>'></asp:Label>
                                                                </td>
                                                            <td><%#Eval("CreatedDate")%></td>
                                                            <td>
                                                                <asp:LinkButton ID="lnkEdit" Text="Chỉnh sửa" runat="server" CssClass="badge badge-primary" CommandArgument ='<%# Eval("categoryId") %>' CommandName="edit"><i class="ti-pencil"></i></asp:LinkButton>
                                                                <asp:LinkButton ID="lnkDelete" Text="Xóa" runat="server" CommandName="delete" CssClass="badge bg-danger" CommandArgument='<%# Eval("CategoryId") %>'
                                                                    OnClientClick="return confirm('Bạn có muốn xóa danh mục này không?')"><i class="ti-trash"></i></asp:LinkButton>
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
