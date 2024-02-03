using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;


namespace Menu_CSCI370
{
    public partial class Form1 : Form
    {
        public const string con = "Data Source=DESKTOP-G24DGR5;Initial Catalog=Menu_detail;Integrated Security=True";
        public Form1()
        {
            InitializeComponent();
        }


        private void btn_sign_Click(object sender, EventArgs e)
        {

            String username, password;

            username = tb_username.Text;
            password = tb_password.Text;
            if (username == "")
            {
                MessageBox.Show("Enter your username");
                return;

            }
            if (password == "")
            {
                MessageBox.Show("Enter your password");
                return;

            }
            SqlConnection connection = new SqlConnection(con);

            try
            {
                connection.Open();
                String querry = "select * from Sign_In where username = '" + tb_username.Text + "' and password = '" + tb_password.Text + "'";
                SqlDataAdapter sda = new SqlDataAdapter(querry, connection);

                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    username = tb_username.Text;
                    password = tb_password.Text;


                    menu ar = new menu();
                    ar.Show();
                    this.Hide();

                    MessageBox.Show("You are successfully logued in");
                }
                else
                {
                    MessageBox.Show("Invalid Login Details, Please Check Your UserName And Password Again");
                    tb_password.Clear();
                    tb_username.Clear();

                    tb_username.Focus();
                }
            }
            catch (Exception ex) { MessageBox.Show("ERROR: " + ex.Message); }
            finally { connection.Close(); }
        }
    
        private void btn_close_Click(object sender, EventArgs e)
        {
            Application.Exit();

        }

        private void Form1_Load(object sender, EventArgs e)
        {
        }

        private void button1_Click(object sender, EventArgs e)
        {
            tb_username.Clear();
            tb_password.Clear();
            tb_username.Focus();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            new menu().Show();
            this.Hide();
        }
    }
    }
