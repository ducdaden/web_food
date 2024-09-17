﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using foodie.User;

namespace foodie.Admin
{
    public partial class Report : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["breadCrum"] = "Selling Report";
                if (Session["admin"] == null)
                {
                    Response.Redirect("../User/Login.aspx");
                }
            }
        }
        private void getReportData(DateTime fromDate,DateTime toDate)
        {
            double grandTotal = 0;
            con = new SqlConnection(Connetion.GetConnectionString());
            cmd = new SqlCommand("SellingReport", con);
            cmd.Parameters.AddWithValue("@FromDate", fromDate);
            cmd.Parameters.AddWithValue("@ToDate", toDate);
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            if(dt.Rows.Count > 0)
            {
                foreach(DataRow dr in dt.Rows)
                {
                    grandTotal += Convert.ToDouble( dr["TotalPrice"]);

                }
                lblTotal.Text = "Tông giá: " + grandTotal +"đ";
                lblTotal.CssClass = "badge badge-primary";
            }
            rReport.DataSource = dt;
            rReport.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            DateTime fromDate =Convert.ToDateTime(txtFromDate.Text);
            DateTime toDate =Convert.ToDateTime(txtToDate.Text);
            if (toDate>DateTime.Now)
            {
                Response.Write("<script>alert('Ngày đến không được lớn hơn ngày hiện tại!');</script>");
            }
            else if (fromDate > toDate)
            {
                Response.Write("<script>alert('từ ngày không đc lớn hơn ngày tới!');</script>");
            }
            else
            {
                getReportData(fromDate, toDate);
            }
        }
    }
}