using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Menu_CSCI370
{
    public partial class menu : Form
    {
        public menu()
        {
            InitializeComponent();
        }

        private void pictureBox6_Click(object sender, EventArgs e)
        {

        }

        private void panel2_Paint(object sender, PaintEventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            panel2.Controls.Clear();
            burger burgerfrm = new burger() { TopLevel = false };
            burgerfrm.FormBorderStyle = FormBorderStyle.None;
            panel2.Controls.Add(burgerfrm);
            burgerfrm.Show();
        }

        private void btn_pizza_Click(object sender, EventArgs e)
        {
            panel3.Controls.Clear();
            pizza pizzafrm = new pizza() { TopLevel = false };
            pizzafrm.FormBorderStyle = FormBorderStyle.None;
            panel3.Controls.Add(pizzafrm);
            pizzafrm.Show();
        }

        private void btn_dessert_Click(object sender, EventArgs e)
        {
            panel4.Controls.Clear();
            dessert dessertfrm = new dessert() { TopLevel = false };
            dessertfrm.FormBorderStyle = FormBorderStyle.None;
            panel4.Controls.Add(dessertfrm);
            dessertfrm.Show();
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            new order_detail().Show();
            this.Hide();
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }
    }
}
