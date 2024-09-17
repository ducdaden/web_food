<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="foodie.User.Default" %>

<%@ Import Namespace="foodie" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Phần ưu đãi -->

    <section class="offer_section layout_padding-bottom">
        <div class="offer_container">
            <div class="container ">
                <div class="row">
                    <asp:Repeater ID="rCategory" runat="server">
                        <ItemTemplate>
                            <div class="col-md-6">
                                <div class="box">
                                    <div class="img-box">
                                        <a href="Menu.aspx?id=<%# Eval("CategoryId") %>">
                                            <img src="<%#Utils.GetImageUrl(Eval("ImageUrl")) %>" alt="">
                                        </a>
                                    </div>
                                    <div class="detail-box">
                                        <h5><%# Eval("Name") %></h5>
                                        <h6><span>20%</span> Giảm giá</h6>
                                        <a href="Menu.aspx?id=<%# Eval("CategoryId") %>">Đặt hàng ngay
                                            <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 456.029 456.029" style="enable-background: new 0 0 456.029 456.029;" xml:space="preserve">
                                                <!-- Mã SVG icon -->
                                            </svg>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </section>

    <!-- Kết thúc phần ưu đãi -->

    <!-- Phần giới thiệu -->

    <section class="about_section layout_padding">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="img-box">
                        <img src="../TemplateFile/images/about-img.png" alt="">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="detail-box">
                        <div class="heading_container">
                            <h2>Chúng tôi là KFC</h2>
                        </div>
                        <p>
KFC là viết tắt của Kentucky Fried Chicken, một thương hiệu và đơn vị hoạt động của Tập đoàn Nhà hàng Quốc tế Yum! (Hoa Kỳ). KFC bán gà chiên, một loại thức ăn nhanh đã trở nên ngày càng phổ biến tại các quốc gia đông dân trên toàn thế giới. Hiện nay, chuỗi cửa hàng KFC có mặt tại 145 quốc gia và vùng lãnh thổ trên toàn thế giới, với hơn 27,000 nhà hàng phục vụ 12 triệu khách hàng mỗi ngày.
                        </p>
                        <a href="">Đọc thêm</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Kết thúc phần giới thiệu -->

    <!-- Phần phản hồi của khách hàng -->

    <section class="client_section layout_padding-bottom pt-5">
        <div class="container">
            <div class="heading_container heading_center psudo_white_primary mb_45">
                <h2>Ý kiến của Khách hàng</h2>
            </div>
            <div class="carousel-wrap row">
                <div class="owl-carousel client_owl-carousel">
                    <div class="item">
                        <div class="box">
                            <div class="detail-box">
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam
                                </p>
                                <h6>Moana Michell</h6>
                                <p>magna aliqua</p>
                            </div>
                            <div class="img-box">
                                <img src="../TemplateFile/images/client1.jpg" alt="" class="box-img">
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="box">
                            <div class="detail-box">
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam
                                </p>
                                <h6>Mike Hamell</h6>
                                <p>magna aliqua</p>
                            </div>
                            <div class="img-box">
                                <img src="../TemplateFile/images/client2.jpg" alt="" class="box-img">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Kết thúc phần phản hồi của khách hàng -->

</asp:Content>
