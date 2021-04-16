using DevExpress.XtraEditors;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MonChuyenDe
{
    public partial class TEST : DevExpress.XtraEditors.XtraForm
    {
        public TEST()
        {
            InitializeComponent();
        }

        private void bANG_GIA_TRUC_TUYENBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.bANG_GIA_TRUC_TUYENBindingSource.EndEdit();
            this.tableAdapterManager.UpdateAll(this.cHUNGKHOANDataSet);

        }

        private void TEST_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'cHUNGKHOANDataSet.BANG_GIA_TRUC_TUYEN' table. You can move, or remove it, as needed.
            this.bANG_GIA_TRUC_TUYENTableAdapter.Fill(this.cHUNGKHOANDataSet.BANG_GIA_TRUC_TUYEN);

        }

        private void bANG_GIA_TRUC_TUYENGridControl_Click(object sender, EventArgs e)
        {

        }
    }
}