
namespace MonChuyenDe
{
    partial class TEST
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.cHUNGKHOANDataSet = new MonChuyenDe.CHUNGKHOANDataSet();
            this.bANG_GIA_TRUC_TUYENBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.bANG_GIA_TRUC_TUYENTableAdapter = new MonChuyenDe.CHUNGKHOANDataSetTableAdapters.BANG_GIA_TRUC_TUYENTableAdapter();
            this.tableAdapterManager = new MonChuyenDe.CHUNGKHOANDataSetTableAdapters.TableAdapterManager();
            this.bANG_GIA_TRUC_TUYENGridControl = new DevExpress.XtraGrid.GridControl();
            this.gridView1 = new DevExpress.XtraGrid.Views.Grid.GridView();
            this.colMACP = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colDM_GIA3 = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colDM_KL3 = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colDM_GIA2 = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colDM_KL2 = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colDM_GIA1 = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colDM_KL1 = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colKL_GIA = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colKL_KL = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colDB_GIA1 = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colDB_KL1 = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colDB_GIA2 = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colDB_KL2 = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colDB_GIA3 = new DevExpress.XtraGrid.Columns.GridColumn();
            this.colDB_KL3 = new DevExpress.XtraGrid.Columns.GridColumn();
            ((System.ComponentModel.ISupportInitialize)(this.cHUNGKHOANDataSet)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.bANG_GIA_TRUC_TUYENBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.bANG_GIA_TRUC_TUYENGridControl)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // cHUNGKHOANDataSet
            // 
            this.cHUNGKHOANDataSet.DataSetName = "CHUNGKHOANDataSet";
            this.cHUNGKHOANDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // bANG_GIA_TRUC_TUYENBindingSource
            // 
            this.bANG_GIA_TRUC_TUYENBindingSource.DataMember = "BANG_GIA_TRUC_TUYEN";
            this.bANG_GIA_TRUC_TUYENBindingSource.DataSource = this.cHUNGKHOANDataSet;
            // 
            // bANG_GIA_TRUC_TUYENTableAdapter
            // 
            this.bANG_GIA_TRUC_TUYENTableAdapter.ClearBeforeFill = true;
            // 
            // tableAdapterManager
            // 
            this.tableAdapterManager.BackupDataSetBeforeUpdate = false;
            this.tableAdapterManager.BANG_GIA_TRUC_TUYENTableAdapter = this.bANG_GIA_TRUC_TUYENTableAdapter;
            this.tableAdapterManager.UpdateOrder = MonChuyenDe.CHUNGKHOANDataSetTableAdapters.TableAdapterManager.UpdateOrderOption.InsertUpdateDelete;
            // 
            // bANG_GIA_TRUC_TUYENGridControl
            // 
            this.bANG_GIA_TRUC_TUYENGridControl.DataSource = this.bANG_GIA_TRUC_TUYENBindingSource;
            this.bANG_GIA_TRUC_TUYENGridControl.Dock = System.Windows.Forms.DockStyle.Top;
            this.bANG_GIA_TRUC_TUYENGridControl.Location = new System.Drawing.Point(0, 0);
            this.bANG_GIA_TRUC_TUYENGridControl.MainView = this.gridView1;
            this.bANG_GIA_TRUC_TUYENGridControl.Name = "bANG_GIA_TRUC_TUYENGridControl";
            this.bANG_GIA_TRUC_TUYENGridControl.Size = new System.Drawing.Size(1207, 336);
            this.bANG_GIA_TRUC_TUYENGridControl.TabIndex = 1;
            this.bANG_GIA_TRUC_TUYENGridControl.ViewCollection.AddRange(new DevExpress.XtraGrid.Views.Base.BaseView[] {
            this.gridView1});
            this.bANG_GIA_TRUC_TUYENGridControl.Click += new System.EventHandler(this.bANG_GIA_TRUC_TUYENGridControl_Click);
            // 
            // gridView1
            // 
            this.gridView1.Columns.AddRange(new DevExpress.XtraGrid.Columns.GridColumn[] {
            this.colMACP,
            this.colDM_GIA3,
            this.colDM_KL3,
            this.colDM_GIA2,
            this.colDM_KL2,
            this.colDM_GIA1,
            this.colDM_KL1,
            this.colKL_GIA,
            this.colKL_KL,
            this.colDB_GIA1,
            this.colDB_KL1,
            this.colDB_GIA2,
            this.colDB_KL2,
            this.colDB_GIA3,
            this.colDB_KL3});
            this.gridView1.GridControl = this.bANG_GIA_TRUC_TUYENGridControl;
            this.gridView1.Name = "gridView1";
            // 
            // colMACP
            // 
            this.colMACP.FieldName = "MACP";
            this.colMACP.Name = "colMACP";
            this.colMACP.Visible = true;
            this.colMACP.VisibleIndex = 0;
            // 
            // colDM_GIA3
            // 
            this.colDM_GIA3.FieldName = "DM_GIA3";
            this.colDM_GIA3.Name = "colDM_GIA3";
            this.colDM_GIA3.Visible = true;
            this.colDM_GIA3.VisibleIndex = 1;
            // 
            // colDM_KL3
            // 
            this.colDM_KL3.FieldName = "DM_KL3";
            this.colDM_KL3.Name = "colDM_KL3";
            this.colDM_KL3.Visible = true;
            this.colDM_KL3.VisibleIndex = 2;
            // 
            // colDM_GIA2
            // 
            this.colDM_GIA2.FieldName = "DM_GIA2";
            this.colDM_GIA2.Name = "colDM_GIA2";
            this.colDM_GIA2.Visible = true;
            this.colDM_GIA2.VisibleIndex = 3;
            // 
            // colDM_KL2
            // 
            this.colDM_KL2.FieldName = "DM_KL2";
            this.colDM_KL2.Name = "colDM_KL2";
            this.colDM_KL2.Visible = true;
            this.colDM_KL2.VisibleIndex = 4;
            // 
            // colDM_GIA1
            // 
            this.colDM_GIA1.FieldName = "DM_GIA1";
            this.colDM_GIA1.Name = "colDM_GIA1";
            this.colDM_GIA1.Visible = true;
            this.colDM_GIA1.VisibleIndex = 5;
            // 
            // colDM_KL1
            // 
            this.colDM_KL1.FieldName = "DM_KL1";
            this.colDM_KL1.Name = "colDM_KL1";
            this.colDM_KL1.Visible = true;
            this.colDM_KL1.VisibleIndex = 6;
            // 
            // colKL_GIA
            // 
            this.colKL_GIA.FieldName = "KL_GIA";
            this.colKL_GIA.Name = "colKL_GIA";
            this.colKL_GIA.Visible = true;
            this.colKL_GIA.VisibleIndex = 7;
            // 
            // colKL_KL
            // 
            this.colKL_KL.FieldName = "KL_KL";
            this.colKL_KL.Name = "colKL_KL";
            this.colKL_KL.Visible = true;
            this.colKL_KL.VisibleIndex = 8;
            // 
            // colDB_GIA1
            // 
            this.colDB_GIA1.FieldName = "DB_GIA1";
            this.colDB_GIA1.Name = "colDB_GIA1";
            this.colDB_GIA1.Visible = true;
            this.colDB_GIA1.VisibleIndex = 9;
            // 
            // colDB_KL1
            // 
            this.colDB_KL1.FieldName = "DB_KL1";
            this.colDB_KL1.Name = "colDB_KL1";
            this.colDB_KL1.Visible = true;
            this.colDB_KL1.VisibleIndex = 10;
            // 
            // colDB_GIA2
            // 
            this.colDB_GIA2.FieldName = "DB_GIA2";
            this.colDB_GIA2.Name = "colDB_GIA2";
            this.colDB_GIA2.Visible = true;
            this.colDB_GIA2.VisibleIndex = 11;
            // 
            // colDB_KL2
            // 
            this.colDB_KL2.FieldName = "DB_KL2";
            this.colDB_KL2.Name = "colDB_KL2";
            this.colDB_KL2.Visible = true;
            this.colDB_KL2.VisibleIndex = 12;
            // 
            // colDB_GIA3
            // 
            this.colDB_GIA3.FieldName = "DB_GIA3";
            this.colDB_GIA3.Name = "colDB_GIA3";
            this.colDB_GIA3.Visible = true;
            this.colDB_GIA3.VisibleIndex = 13;
            // 
            // colDB_KL3
            // 
            this.colDB_KL3.FieldName = "DB_KL3";
            this.colDB_KL3.Name = "colDB_KL3";
            this.colDB_KL3.Visible = true;
            this.colDB_KL3.VisibleIndex = 14;
            // 
            // TEST
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1207, 492);
            this.Controls.Add(this.bANG_GIA_TRUC_TUYENGridControl);
            this.Name = "TEST";
            this.Text = "TEST";
            this.Load += new System.EventHandler(this.TEST_Load);
            ((System.ComponentModel.ISupportInitialize)(this.cHUNGKHOANDataSet)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.bANG_GIA_TRUC_TUYENBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.bANG_GIA_TRUC_TUYENGridControl)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.gridView1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private CHUNGKHOANDataSet cHUNGKHOANDataSet;
        private System.Windows.Forms.BindingSource bANG_GIA_TRUC_TUYENBindingSource;
        private CHUNGKHOANDataSetTableAdapters.BANG_GIA_TRUC_TUYENTableAdapter bANG_GIA_TRUC_TUYENTableAdapter;
        private CHUNGKHOANDataSetTableAdapters.TableAdapterManager tableAdapterManager;
        private DevExpress.XtraGrid.GridControl bANG_GIA_TRUC_TUYENGridControl;
        private DevExpress.XtraGrid.Views.Grid.GridView gridView1;
        private DevExpress.XtraGrid.Columns.GridColumn colMACP;
        private DevExpress.XtraGrid.Columns.GridColumn colDM_GIA3;
        private DevExpress.XtraGrid.Columns.GridColumn colDM_KL3;
        private DevExpress.XtraGrid.Columns.GridColumn colDM_GIA2;
        private DevExpress.XtraGrid.Columns.GridColumn colDM_KL2;
        private DevExpress.XtraGrid.Columns.GridColumn colDM_GIA1;
        private DevExpress.XtraGrid.Columns.GridColumn colDM_KL1;
        private DevExpress.XtraGrid.Columns.GridColumn colKL_GIA;
        private DevExpress.XtraGrid.Columns.GridColumn colKL_KL;
        private DevExpress.XtraGrid.Columns.GridColumn colDB_GIA1;
        private DevExpress.XtraGrid.Columns.GridColumn colDB_KL1;
        private DevExpress.XtraGrid.Columns.GridColumn colDB_GIA2;
        private DevExpress.XtraGrid.Columns.GridColumn colDB_KL2;
        private DevExpress.XtraGrid.Columns.GridColumn colDB_GIA3;
        private DevExpress.XtraGrid.Columns.GridColumn colDB_KL3;
    }
}