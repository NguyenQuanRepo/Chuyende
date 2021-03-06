using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Linq;
using System.Security.Permissions;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MonChuyenDe
{
    public partial class frmChungKhoan : Form
    {
        private const string TABLE_NAME = "BANG_GIA_TRUC_TUYEN";
        private SqlConnection _connection = null;
        private SqlCommand _command = null;
    
        private int _vitriRow;
        private int _vitriColumn;

        public frmChungKhoan()
        {
            InitializeComponent();
        }

        private void frmBGTT_Load(object sender, EventArgs e)
        {
            

            this.btnDatlenh1.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.EnableResizing;
            this.btnDatlenh1.ColumnHeadersHeight = this.btnDatlenh1.ColumnHeadersHeight * 2;
            this.btnDatlenh1.ColumnHeadersDefaultCellStyle.Alignment = DataGridViewContentAlignment.BottomCenter;


            // DEPENDENCY
            if (CanRequestNotifications() == true)
                BatDau();
            else
                MessageBox.Show("Bạn chưa kích hoạt dịch vụ Broker", "", MessageBoxButtons.OK);
         
        }
      

        private void BatDau()
        {
            // Remove any existing dependency connection, then create a new one.
            SqlDependency.Stop(GetConnectionString());
            try
            {
                SqlDependency.Start(GetConnectionString());
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Loi", MessageBoxButtons.OK);
                return;
            }
            if (_connection == null)
            {
                _connection = new SqlConnection(GetConnectionString());
                _connection.Open();
            }

            if (_command == null)
            {
                _command = new SqlCommand(GetSQL(), _connection);
                _command.CommandType = CommandType.Text;
                _command.CommandTimeout = 600;

            }



            GetData();
        }

        private void GetData()
        {


            // Make sure the command object does not already have
            // a notification object associated with it.
            _command.Notification = null;

            // Create and bind the SqlDependency object
            // to the command object.

            SqlDependency dependency = new SqlDependency(_command);
            dependency.OnChange += dependency_OnChange;


            // SqlDataReader is then loaded into a DataTable and finally the DataTable is used to populate the DataGridView.
            DataTable dt = new DataTable();
            dt.Load(_command.ExecuteReader());    // vì chỉ đọc thôi nên dùng data Reader. ko cần phải dùng dataset
            this.btnDatlenh1.DataSource = dt;

            // giữ vị trí cursor
            try
            {
                btnDatlenh1.ClearSelection();
                btnDatlenh1.Rows[_vitriRow].Cells[_vitriColumn].Selected = true;

            }
            catch (Exception ex)
            {
                // neu co loi thi reset lai
                this.btnDatlenh1.ClearSelection();
            }

        }
        private string GetSQL()
        {
            return " SELECT MACP AS[    - - - - - - -],DM_GIA3 AS[Giá Mua 3], DM_KL3 AS[KLM 3],  DM_GIA2 AS[Giá Mua 2], DM_KL2 AS[KLM 2], DM_GIA1 AS[Giá Mua 1], DM_KL1 AS[KLM 1], KL_GIA AS[Giá Khớp], "
                    + " KL_KL AS[KL khớp], DB_GIA1 AS[Giá Bán 1], DB_KL1 AS[KLB 1], DB_GIA2 AS[Giá Bán 2], DB_KL2 AS[KLB 2],DB_GIA3 AS[Giá Bán 3], DB_KL3 AS[KLB 3] " +
                    " FROM dbo.BANG_GIA_TRUC_TUYEN ";
        }

        private void dependency_OnChange(object sender, SqlNotificationEventArgs e)
        {
            // This event will occur on a thread pool thread.
            // It is illegal to update the UI from a worker thread
            // The following code checks to see if it is safe update the UI.
            ISynchronizeInvoke i = (ISynchronizeInvoke)this;

            // If InvokeRequired returns True, the code is executing on a worker thread.
            if (i.InvokeRequired)
            {
                // Create a delegate to perform the thread switch
                OnChangeEventHandler tempDelegate = new OnChangeEventHandler(dependency_OnChange);

                object[] args = new[] { sender, e };

                // Marshal the data from the worker thread
                // to the UI thread.
                i.BeginInvoke(tempDelegate, args);

                return;
            }
            // Remove the handler since it's only good
            // for a single notification
            SqlDependency dependency = (SqlDependency)sender;
            dependency.OnChange -= dependency_OnChange;
            // Reload the dataset that's bound to the grid.
            GetData();
        }




        private bool CanRequestNotifications()
        {
            // In order to use the callback feature of the
            // SqlDependency, the application must have
            // the SqlClientPermission permission.
            try
            {
                SqlClientPermission perm = new SqlClientPermission(PermissionState.Unrestricted);

                perm.Demand();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        private string GetConnectionString()
        {
            return @"Data Source=DESKTOP-ERRCLU8; Initial Catalog=CHUNGKHOAN;User ID=sa;Password=123";
        }
        private void dataGridView1_Paint(object sender, PaintEventArgs e)
        {
            // format text
            StringFormat format = new StringFormat();
            format.Alignment = StringAlignment.Center;
            format.LineAlignment = StringAlignment.Center;

            // độ rộng muỗi ô
            int w = this.btnDatlenh1.GetCellDisplayRectangle(3, -1, true).Width;

            // vẽ viền
            Pen pen = new Pen(Color.Brown, 1);
            pen.Alignment = PenAlignment.Inset;

            // ==> ô header Mã cổ phiếu
            // lấy đối tượng rectangle....
            Rectangle r1 = this.btnDatlenh1.GetCellDisplayRectangle(0, -1, true);


            //  chiều dài và rộng...
            r1.Width = r1.Width;
            r1.Height = r1.Height / 3 - 3;

            // vẽ ô header
            e.Graphics.FillRectangle(new SolidBrush(this.btnDatlenh1.ColumnHeadersDefaultCellStyle.BackColor), r1);
            e.Graphics.DrawString("MÃ CỔ PHIẾU", this.btnDatlenh1.ColumnHeadersDefaultCellStyle.Font, new SolidBrush(this.btnDatlenh1.ColumnHeadersDefaultCellStyle.ForeColor),
            r1, format);
            e.Graphics.DrawRectangle(pen, r1);
            //==>  ô header Dư mua

            Rectangle r2 = this.btnDatlenh1.GetCellDisplayRectangle(1, -1, true);
            r2.Width = 4 * w;
            r2.Height = r2.Height / 3 - 3;

            e.Graphics.FillRectangle(new SolidBrush(this.btnDatlenh1.ColumnHeadersDefaultCellStyle.BackColor), r2);
            e.Graphics.DrawString("DƯ MUA", this.btnDatlenh1.ColumnHeadersDefaultCellStyle.Font, new SolidBrush(this.btnDatlenh1.ColumnHeadersDefaultCellStyle.ForeColor),
            r2, format);
            e.Graphics.DrawRectangle(pen, r2);

            Rectangle r3 = this.btnDatlenh1.GetCellDisplayRectangle(5, -1, true);
            r3.Width = 2 * w;
            r3.Height = r3.Height / 3 - 3;

            e.Graphics.FillRectangle(new SolidBrush(this.btnDatlenh1.ColumnHeadersDefaultCellStyle.BackColor), r3);
            e.Graphics.DrawString("KHỚP LỆNH", this.btnDatlenh1.ColumnHeadersDefaultCellStyle.Font, new SolidBrush(this.btnDatlenh1.ColumnHeadersDefaultCellStyle.ForeColor),
            r3, format);
            e.Graphics.DrawRectangle(pen, r3);

            Rectangle r4 = this.btnDatlenh1.GetCellDisplayRectangle(7, -1, true);

            r4.Width = 4 * w;
            r4.Height = r4.Height / 3 - 3;

            e.Graphics.FillRectangle(new SolidBrush(this.btnDatlenh1.ColumnHeadersDefaultCellStyle.BackColor), r4);
            e.Graphics.DrawString("DƯ BÁN", this.btnDatlenh1.ColumnHeadersDefaultCellStyle.Font, new SolidBrush(this.btnDatlenh1.ColumnHeadersDefaultCellStyle.ForeColor),
            r4, format);
            e.Graphics.DrawRectangle(pen, r4);
        }

        private void dataGridView1_Scroll(object sender, ScrollEventArgs e)
        {
            Rectangle rtHeader = this.btnDatlenh1.DisplayRectangle;
            rtHeader.Height = this.btnDatlenh1.ColumnHeadersHeight / 2;
            this.btnDatlenh1.Invalidate(rtHeader);

        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            _vitriColumn = btnDatlenh1.CurrentCell.ColumnIndex;
            _vitriRow = btnDatlenh1.CurrentRow.Index;
        }

        private void dataGridView1_ColumnWidthChanged(object sender, DataGridViewColumnEventArgs e)
        {
            Rectangle rtHeader = this.btnDatlenh1.DisplayRectangle;
            rtHeader.Height = this.btnDatlenh1.ColumnHeadersHeight / 3;
            this.btnDatlenh1.Invalidate(rtHeader);
        }

        private void dataGridView1_CellPainting(object sender, DataGridViewCellPaintingEventArgs e)
        {
            if (e.RowIndex == -1 && e.ColumnIndex > -1)
            {
                Rectangle r2 = e.CellBounds;
                r2.Y += e.CellBounds.Height / 3;
                r2.Height = e.CellBounds.Height / 3;

                e.PaintBackground(r2, true);
                e.PaintContent(r2);
                e.Handled = true;
            }
        }

       

        

        private bool ValidateEmptyString(TextBox txtCK, ComboBox cmbLenhDat, NumericUpDown numSoluong, NumericUpDown numGia)
        {
            errorProvider1.Clear();

            // TODO : Check khoảng trống ở textField
            if (txtCK.Text.Trim().Equals(""))
            {
                errorProvider1.SetError(txtCK, "Mã Cổ Phiếu không được để trống !");
                txtCK.Focus();
                return false;
            }
            if (!(cmbLenhDat.SelectedIndex > -1))
            {
                errorProvider1.SetError(cmbLenhDat, "Bạn chưa chọn lệnh đặt !");
                cmbLenhDat.Focus();
                return false;
            }
            if (numSoluong.Value == 0)
            {
                errorProvider1.SetError(numSoluong, "Bạn chưa điền số lượng Cổ Phiếu !");
                numSoluong.Focus();
                return false;
            }
            if (numGia.Value == 0)
            {
                errorProvider1.SetError(numGia, "Bạn chưa điền giá  !");
                numGia.Focus();
                return false;
            }

            return true;

        }

       

        private void btnDatlenh1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void panel3_Paint(object sender, PaintEventArgs e)
        {

        }

        private void panel2_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
