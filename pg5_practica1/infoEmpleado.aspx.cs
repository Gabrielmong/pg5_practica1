using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using pg5_practica1.Class;
using pg5_practica1.Model;

namespace pg5_practica1 {
    public partial class WebForm1 : System.Web.UI.Page {
        cEmpleado cn = new cEmpleado();
        protected void Page_Load(object sender, EventArgs e) {
            load();
        }
        protected void handleSave(object sender, EventArgs e) {
            if (txtCodigo.Text == "" | txtNombre.Text == "" | txtBruto.Text == "" | txtNeto.Text == "" | txtDeducciones.Text == "") {
                Response.Write("<script>alert('Debe llenar todos los campos');</script>");
            } else {
                cn.addEmpleado(
                    Convert.ToInt32(txtCodigo.Text), 
                    txtNombre.Text, 
                    Convert.ToDecimal(txtBruto.Text), 
                    Convert.ToDecimal(txtNeto.Text), 
                    Convert.ToDecimal(txtDeducciones.Text));
                Response.Write("<script>alert('Empleado agregado');</script>");
                load();
            }

        }
        protected void handleDelete(object sender, EventArgs e) {
            cn.deleteEmpleado(Convert.ToInt32(txtCodigo2.Text));
            Response.Write("<script>alert('Empleado eliminado');</script>");
            load();
        }
        protected void handleClose(object sender, EventArgs e) {
            Panel1.Visible = false;
        }
        private void load() {
            GridView1.DataSource = cn.getEmpleados();
            GridView1.DataBind();
        }
        protected void handleShow(object sender, EventArgs e) {
            load();
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e) {
            hf_Control.Value = Convert.ToString(GridView1.DataKeys[GridView1.SelectedRow.RowIndex].Value);
            Panel1.Visible = true;
            EMPLEADO obj = cn.getEmpleado(Convert.ToInt32(hf_Control.Value));
            txtCodigo2.Text = Convert.ToString(obj.codigo);
            txtNombre2.Text = obj.nombre;
            txtBruto2.Text = Convert.ToString(obj.salario_bruto);
            txtNeto2.Text = Convert.ToString(obj.salario_neto);
            txtDeducciones2.Text = Convert.ToString(obj.deducciones);
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e) {
            if (e.Row.RowType == DataControlRowType.DataRow) {
                e.Row.Attributes.Add("onMouseOver", "this.style.cursor = 'pointer'");
                e.Row.Attributes.Add("onclick", Page.ClientScript.GetPostBackEventReference(GridView1, "select$" + e.Row.RowIndex.ToString()));
            }
        }
    }
}