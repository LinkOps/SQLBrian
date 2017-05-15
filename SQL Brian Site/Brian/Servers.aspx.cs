using System;
using System.Configuration;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.Web;
using System.Xml.Linq;
using System.Windows;

public partial class Servers : System.Web.UI.Page
{
    public SqlConnection SQLConn;

    protected void Page_Init(object sender, EventArgs e)
    {
        #region Set SQLConn String
        string connectionString = ConfigurationManager.AppSettings["ConnectionBrian"].ToString();
        SQLConn = new SqlConnection(connectionString);
        #endregion
        Servers_ddl();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (ConfigurationManager.AppSettings["Debug"] == "true")
        {
            pn_Debug.Visible = true;
        }
        
    }

    protected void Click_ServerSelect_AddServer (object sender, EventArgs e)
    {
        HideDynamicFields();

        Environment_ddl();
        Location_ddl();
        BusinessUnit_ddl();
        ServerStatus_ddl();

        ClearFields(pn_ServerInfo);

        TriggerChilds(pn_ServerInfo, true);

        lb_ServerInfo_Warning.Text = "";
        pn_ServerSelect.Visible = false;
        pn_ServerInfo.Visible = true;
        imgbtn_ServerInfo_AddServer.Visible = true;
        txt_ServerName.Focus();
    }

    protected void Click_ServerSelect_ViewServer(object sender, EventArgs e)
    {
        ShowDynamicFieds();

        Environment_ddl();
        Location_ddl();
        BusinessUnit_ddl();
        ServerStatus_ddl();

        ClearFields(pn_ServerInfo);

        GetServerInfo();

        TriggerChilds(pn_ServerInfo, false);

        lb_ServerInfo_Warning.Text = "";
        pn_ServerSelect.Visible = false;
        pn_ServerInfo.Visible = true;
        imgbtn_ServerInfo_EditServer.Visible = true;
    }

    protected void Click_ServerInfo_AddServer(object sender, EventArgs e)
    {
        SqlCommand AddInv_Reader = new SqlCommand("iface_datainsert", SQLConn)
        {
            CommandType = CommandType.StoredProcedure
        };
        try
        {
            AddInv_Reader.Parameters.Add("@Statement", SqlDbType.NVarChar).Value = "Add Inventory";
            AddInv_Reader.Parameters.Add("@ServerName", SqlDbType.NVarChar).Value = txt_ServerName.Text.ToString();
            AddInv_Reader.Parameters.Add("@InstanceName", SqlDbType.NVarChar).Value = txt_InstanceName.Text.ToString();
            AddInv_Reader.Parameters.Add("@EnvironmentId", SqlDbType.Int).Value = ddl_Environment.SelectedValue;
            AddInv_Reader.Parameters.Add("@LocationId", SqlDbType.Int).Value = ddl_Location.SelectedValue;
            AddInv_Reader.Parameters.Add("@BusinessUnitId", SqlDbType.Int).Value = ddl_BusinessUnit.SelectedValue;
            AddInv_Reader.Parameters.Add("@CPUCores", SqlDbType.Int).Value = txt_CPUCores.Text;
            AddInv_Reader.Parameters.Add("@CPUSpeed", SqlDbType.NVarChar).Value = txt_CPUSpeed.Text.ToString();
            AddInv_Reader.Parameters.Add("@StatusId", SqlDbType.Int).Value = ddl_ServerStatus.SelectedValue;
        }
        catch (Exception)
        {

        }
        try
        {
            if (SQLConn.State != ConnectionState.Open)
            {
                SQLConn.Open();
            }

            int row = AddInv_Reader.ExecuteNonQuery();
            if (row <= 0)
            {

            }
            else
            {

            }
        }
        catch (Exception ex)
        {
            lb_Warning.Text = "Something went wrong while trying to add the server to our inventory. " + ex;
        }
        finally
        {
            lb_ServerSelect_Info.Text = txt_ServerName.Text.ToString() + " (" + txt_InstanceName.Text.ToString() + ") has successfully been added to the server inventory.";
            Servers_ddl();
            pn_ServerInfo.Visible = false;
            pn_ServerSelect.Visible = true;
            imgbtn_ServerInfo_AddServer.Visible = false;
            SQLConn.Close();
        }
        
    }

    protected void Click_ServerInfo_EditServer(object sender, EventArgs e)
    {

        TriggerChilds(pn_ServerInfo, true);
        ShowDynamicFieds();
        txt_ServerName.Enabled = false;
        txt_InstanceName.Enabled = false;
        txt_IPAddress.Enabled = false;
        txt_Version.Enabled = false;
        txt_Edition.Enabled = false;
        txt_BuildNo.Enabled = false;
        txt_InstanceRAM.Enabled = false;
        imgbtn_ServerInfo_EditServer.Visible = false;
        imgbtn_ServerInfo_UpdateServer.Visible = true;
    }

    protected void Click_ServerInfo_UpdateServer (object sender, EventArgs e)
    {
        SqlCommand UpdateServer_Reader = new SqlCommand("iface_dataupdate", SQLConn)
        {
            CommandType = CommandType.StoredProcedure
        };
        
        UpdateServer_Reader.Parameters.Add("@Statement", SqlDbType.NVarChar).Value = "Update Server";
        UpdateServer_Reader.Parameters.Add("@ServerId", SqlDbType.Int).Value = ddl_ServerSelect.SelectedValue;
        UpdateServer_Reader.Parameters.Add("@EnvironmentId", SqlDbType.Int).Value = ddl_Environment.SelectedValue;
        UpdateServer_Reader.Parameters.Add("@LocationId", SqlDbType.Int).Value = ddl_Location.SelectedValue;
        UpdateServer_Reader.Parameters.Add("@BusinessUnitId", SqlDbType.Int).Value = ddl_BusinessUnit.SelectedValue;
        UpdateServer_Reader.Parameters.Add("@CPUCores", SqlDbType.Int).Value = txt_CPUCores.Text;
        UpdateServer_Reader.Parameters.Add("@CPUSpeed", SqlDbType.NVarChar).Value = txt_CPUSpeed.Text.ToString();
        UpdateServer_Reader.Parameters.Add("@InstallationDate", SqlDbType.Date).Value = cal_InstallDate.SelectedDate;
        UpdateServer_Reader.Parameters.Add("@StatusId", SqlDbType.Int).Value = ddl_ServerStatus.SelectedValue;
        
        try
        {
            if (SQLConn.State != ConnectionState.Open)
            {
                SQLConn.Open();
            }
            int row = UpdateServer_Reader.ExecuteNonQuery();
            if (row <= 0)
            {

            }
            else
            {

            }
        }
        catch (Exception ex)
        {
            lb_Warning.Text = "Something went wrong while trying to udpate the server in our inventory. " + ex;
            SQLConn.Close();
        }
        finally
        {
            pn_ServerInfo.Visible = false;
            pn_ServerSelect.Visible = true;
            imgbtn_ServerInfo_UpdateServer.Visible = false;
            SQLConn.Close();
        }
    }

    protected void Click_Home (object sender, EventArgs e)
    {
        HideDynamicFields();
        lb_ServerSelect_Info.Text = "";
        pn_ServerSelect.Visible = true;
        pn_ServerInfo.Visible = false;

        imgbtn_ServerInfo_AddServer.Visible = false;
        imgbtn_ServerInfo_EditServer.Visible = false;
        imgbtn_ServerInfo_UpdateServer.Visible = false;
    }

    private void Servers_ddl()
    {
        #region Load Servers DDL
        //SQLConn.Close();
        SqlDataReader Servers_reader;

        SqlCommand Servers_Comm = new SqlCommand("iface_ddl", SQLConn)
        {
            CommandType = CommandType.StoredProcedure
        };
        Servers_Comm.Parameters.Add("@Statement", SqlDbType.VarChar).Value = "ddl Server";

        try
        {
            if (SQLConn.State != ConnectionState.Open)
            {
                SQLConn.Open();
            }

            Servers_reader = Servers_Comm.ExecuteReader();
            ddl_ServerSelect.DataSource = Servers_reader;
            ddl_ServerSelect.DataValueField = "ServerId";
            ddl_ServerSelect.DataTextField = "ServerName";
            ddl_ServerSelect.DataBind();
            Servers_reader.Close();
            ddl_ServerSelect.Items.Insert(0, new ListItem("Select Server", "0"));
        }
        catch (Exception ex)
        {
            lb_Warning.Text = "Something has gone wrong while downloading the Servers DDL. " + ex;
           
        }
        finally
        {
            SQLConn.Close();
        }
        #endregion

    }

    private void ClearFields(Control ctrl)
    {
        foreach (Control c in ctrl.Controls)
        {
            DisableChilds(c);
            if (c is DropDownList)
            {
                ((DropDownList)(c)).SelectedValue = "0";
            }
            if (c is TextBox)
            {
                ((TextBox)(c)).Text = "";
            }

            txt_InstanceName.Text = "MSSQLSERVER";
        }
        cal_InstallDate.SelectedDate = DateTime.Today;
    }
    

    private void Environment_ddl()
    {
        #region Load Environment DDL

        SqlDataReader Environment_reader;

        SqlCommand Environment_Comm = new SqlCommand("iface_ddl", SQLConn)
        {
            CommandType = CommandType.StoredProcedure
        };
        Environment_Comm.Parameters.Add("@Statement", SqlDbType.VarChar).Value = "ddl Environment";

        try
        {
            if (SQLConn.State != ConnectionState.Open)
            {
                SQLConn.Open();
            }

            Environment_reader = Environment_Comm.ExecuteReader();
            ddl_Environment.DataSource = Environment_reader;
            ddl_Environment.DataValueField = "EnvironmentId";
            ddl_Environment.DataTextField = "Environment";
            ddl_Environment.DataBind();
            Environment_reader.Close();
            ddl_Environment.Items.Insert(0, new ListItem("Select Environment", "0"));
        }
        catch (Exception ex)
        {
            lb_Warning.Text = "Something has gone wrong while downloading the Environment DDL. " + ex;
        }
        finally
        {
            SQLConn.Close();
        }
        #endregion
    }

    private void Location_ddl()
    {
        #region Load Location DDL

        SqlDataReader Location_reader;

        SqlCommand Location_Comm = new SqlCommand("iface_ddl", SQLConn)
        {
            CommandType = CommandType.StoredProcedure
        };
        Location_Comm.Parameters.Add("@Statement", SqlDbType.VarChar).Value = "ddl Location";

        try
        {
            if (SQLConn.State != ConnectionState.Open)
            {
                SQLConn.Open();
            }

            Location_reader = Location_Comm.ExecuteReader();
            ddl_Location.DataSource = Location_reader;
            ddl_Location.DataValueField = "LocationId";
            ddl_Location.DataTextField = "Location";
            ddl_Location.DataBind();
            Location_reader.Close();
            ddl_Location.Items.Insert(0, new ListItem("Select Location", "0"));
        }
        catch (Exception ex)
        {
            lb_Warning.Text = "Something has gone wrong while downloading the Location DDL. " + ex;
        }
        finally
        {
            SQLConn.Close();
        }
        #endregion
    }

    private void BusinessUnit_ddl()
    {
        #region Load Business Unit DDL

        SqlDataReader BusinessUnit_reader;

        SqlCommand BusinessUnit_Comm = new SqlCommand("iface_ddl", SQLConn)
        {
            CommandType = CommandType.StoredProcedure
        };
        BusinessUnit_Comm.Parameters.Add("@Statement", SqlDbType.VarChar).Value = "ddl BusinessUnit";

        try
        {
            if (SQLConn.State != ConnectionState.Open)
            {
                SQLConn.Open();
            }

            BusinessUnit_reader = BusinessUnit_Comm.ExecuteReader();
            ddl_BusinessUnit.DataSource = BusinessUnit_reader;
            ddl_BusinessUnit.DataValueField = "BusinessUnitId";
            ddl_BusinessUnit.DataTextField = "BusinessUnit";
            ddl_BusinessUnit.DataBind();
            BusinessUnit_reader.Close();
            ddl_BusinessUnit.Items.Insert(0, new ListItem("Select Business Unit", "0"));
        }
        catch (Exception ex)
        {
            lb_Warning.Text = "Something has gone wrong while downloading the Business Unit DDL. " + ex;
        }
        finally
        {
            SQLConn.Close();
        }
        #endregion
    }

    private void ServerStatus_ddl()
    {
        #region Load Server Status DDL

        SqlDataReader ServerStatus_reader;

        SqlCommand ServerStatus_Comm = new SqlCommand("iface_ddl", SQLConn)
        {
            CommandType = CommandType.StoredProcedure
        };
        ServerStatus_Comm.Parameters.Add("@Statement", SqlDbType.VarChar).Value = "ddl Status";

        try
        {
            if (SQLConn.State != ConnectionState.Open)
            {
                SQLConn.Open();
            }

            ServerStatus_reader = ServerStatus_Comm.ExecuteReader();
            ddl_ServerStatus.DataSource = ServerStatus_reader;
            ddl_ServerStatus.DataValueField = "ServerStatusId";
            ddl_ServerStatus.DataTextField = "ServerStatus";
            ddl_ServerStatus.DataBind();
            ServerStatus_reader.Close();
            ddl_ServerStatus.Items.Insert(0, new ListItem("Select Server Status", "0"));
        }
        catch (Exception ex)
        {
            lb_Warning.Text = "Something has gone wrong while downloading the Server Status DDL. " + ex;
        }
        finally
        {
            SQLConn.Close();
        }
        #endregion
    }

    private void DisableChilds(Control ctrl)
    {
        foreach (Control c in ctrl.Controls)
        {
            DisableChilds(c);
            if (c is DropDownList)
            {
                ((DropDownList)(c)).Enabled = false;
            }
            if (c is TextBox)
            {
                ((TextBox)(c)).Enabled = false;
            }
        }
    }

    private void TriggerChilds(Control ctrl, Boolean status)
    {
        foreach (Control c in ctrl.Controls)
        {
            DisableChilds(c);
            if (c is DropDownList)
            {
                ((DropDownList)(c)).Enabled = status;
            }
            if (c is TextBox)
            {
                ((TextBox)(c)).Enabled = status;
            }
        }
    }

    private void GetServerInfo()
    {
        #region Get Server Info
        SqlCommand ServerInfoComm = new SqlCommand("iface_datacollect", SQLConn)
        {
            CommandType = CommandType.StoredProcedure
        };
        ServerInfoComm.Parameters.Add("@Statement", SqlDbType.NVarChar).Value = "Get Server Info";
        ServerInfoComm.Parameters.Add("@ServerId", SqlDbType.Int).Value = ddl_ServerSelect.SelectedValue.ToString();

        try
        {
            if (SQLConn.State != ConnectionState.Open)
            {
                SQLConn.Open();
            }
            SqlDataReader ServerInfoReader;
            ServerInfoReader = ServerInfoComm.ExecuteReader();
            while (ServerInfoReader.Read())
            {
                txt_ServerName.Text = Convert.ToString(ServerInfoReader["ServerName"]).Trim();
                txt_InstanceName.Text = Convert.ToString(ServerInfoReader["InstanceName"]).Trim();
                txt_IPAddress.Text = Convert.ToString(ServerInfoReader["IPAddress"]).Trim();
                txt_Version.Text = Convert.ToString(ServerInfoReader["Version"]).Trim();
                txt_BuildNo.Text = Convert.ToString(ServerInfoReader["BuildName"]).Trim();
                txt_Edition.Text = Convert.ToString(ServerInfoReader["Edition"]).Trim();
                ddl_Environment.SelectedValue = Convert.ToString(ServerInfoReader["EnvironmentId"]).Trim();
                ddl_Location.SelectedValue = Convert.ToString(ServerInfoReader["LocationId"]).Trim();
                ddl_BusinessUnit.SelectedValue = Convert.ToString(ServerInfoReader["BusinessUnitId"]).Trim();
                txt_CPUCores.Text = Convert.ToString(ServerInfoReader["CPUCores"]).Trim();
                txt_CPUSpeed.Text = Convert.ToString(ServerInfoReader["CPUCoreSpeed"]).Trim();
                txt_ServerRAM.Text = Convert.ToString(ServerInfoReader["ServerRAM"]).Trim();
                txt_InstanceRAM.Text = Convert.ToString(ServerInfoReader["InstanceRAM"]).Trim();
                cal_InstallDate.SelectedDate = Convert.ToDateTime(ServerInfoReader["InstallationDate"]);
                ddl_ServerStatus.SelectedValue = Convert.ToString(ServerInfoReader["ServerStatusId"]).Trim();
            }

            ServerInfoReader.Close();
        }
        catch (Exception ex)
        {
            lb_Warning.Text = "Something went wrong while trying to get the server from our inventory. " + ex;
        }
        finally
        {
            SQLConn.Close();
        }
        #endregion
    }

    private void HideDynamicFields()
    {
        div_hide1.Visible = false;
        div_hide2.Visible = false;
    }

    private void ShowDynamicFieds()
    {
        div_hide1.Visible = true;
        div_hide2.Visible = true;
    }

}