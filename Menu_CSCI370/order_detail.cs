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
    public partial class order_detail : Form
    {
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-G24DGR5;Initial Catalog=Menu_detail;Integrated Security=True");
        SqlCommand cmd = new SqlCommand();

        public order_detail()
        {
            InitializeComponent();
        }

        private void btn_exit_Click(object sender, EventArgs e)
        {
           
        }

        private void btn_goBack_Click(object sender, EventArgs e)
        {
           
        }

        private void order_detail_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'cSCI370_FinalProjectDataSet1.Foods' table. You can move, or remove it, as needed.
            this.foodsTableAdapter1.Fill(this.cSCI370_FinalProjectDataSet1.Foods);
            dtOrderDate.MinDate = DateTime.Today;
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void listView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void btn_exit_Click_1(object sender, EventArgs e)
        {
            new Form1().Show();
            this.Hide();
        }

        private void btn_goBack_Click_1(object sender, EventArgs e)
        {
            new menu().Show();
            this.Hide();
        }

        private void btnOrder_Click(object sender, EventArgs e)
        {
            if (tb_username.Text == "" )
            {
                MessageBox.Show("Enter your name");
                return;

            }
            if (nudQuantity.Value == 0) {
                MessageBox.Show("Select quantity");
                return;

            }
            if (dataGridView1.SelectedRows.Count == 0) {
                MessageBox.Show("Select a food");
                return;
            }

            cmd.CommandText = "insert into [Order] values (" + tb_username.Text + "," +
                int.Parse(dataGridView1.SelectedRows[0].Cells[0].Value.ToString())+","+
                (int)nudQuantity.Value+","+ dtOrderDate.Value.Date+")";

            cmd.Connection = con;
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                MessageBox.Show("Order completed Successfully");
                tb_username.Text ="";
                nudQuantity.Value = 0;
                dtOrderDate.Value = dtOrderDate.MinDate;
                getOrders();
            }
            catch { }
            finally { con.Close(); }
        }

        void getOrders() {
            cmd.CommandText = "select CustName as Customer , f.name as Food , o.orderDate as Date , f.price*o.Quantity as Total_Price "
                    + "from [Order] o join Foods f on f.id=o.FoodID";
            cmd.Connection = con;
            try
            {
                SqlDataReader reader = cmd.ExecuteReader();
                DataTable orderDetails = new DataTable();
                orderDetails.Load(reader);
                reader.Close();
                dataGridView2.DataSource = orderDetails;

            }
            catch { }
            finally { con.Close(); }
        }
    }
}
