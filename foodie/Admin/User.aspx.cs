﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using foodie.User;

namespace foodie.Admin
{
    public partial class User : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["breadCrum"] = "Users";
                if (Session["admin"] == null)
                {
                    Response.Redirect("../User/Login.aspx");
                }
                else
                {
                    getUser();
                }
                
            }
        }
        private void getUser()
        {
            con = new SqlConnection(Connetion.GetConnectionString());
            cmd = new SqlCommand("User_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "SELECT4ADMIN");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rUsers.DataSource = dt;
            rUsers.DataBind();
        }
        protected void rUsers_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "delete")
            {
                con = new SqlConnection(Connetion.GetConnectionString());
                cmd = new SqlCommand("User_Crud", con);
                cmd.Parameters.AddWithValue("@Action", "DELETE");
                cmd.Parameters.AddWithValue("@UserId", e.CommandArgument);
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    lblMsg.Visible = true;
                    lblMsg.Text = "Xóa thành công !";
                    lblMsg.CssClass = "alert alert-success";
                    getUser();
                }
                catch (Exception ex)
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Error" + ex.Message;
                    lblMsg.CssClass = "alert alert-danger";
                }

                con.Close();

            }
        }

        
    }
}