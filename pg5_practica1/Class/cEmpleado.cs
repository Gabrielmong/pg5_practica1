using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Caching;
using pg5_practica1.Model;

namespace pg5_practica1.Class {

    public class cEmpleado {
        PG5_SEMANA2Entities db = new PG5_SEMANA2Entities();
        
        public EMPLEADO getEmpleado(int codigo) {
            return db.EMPLEADOes.Single(x => x.codigo == codigo);
        }

        public List<EMPLEADO> getEmpleados() {
            return db.EMPLEADOes.ToList();
        }

        public void addEmpleado(int codigo, string nombre, decimal salario_bruto, decimal salario_neto, decimal deducciones) {
            EMPLEADO empleado = new EMPLEADO();
            empleado.codigo = codigo;
            empleado.nombre = nombre;
            empleado.salario_bruto = salario_bruto;
            empleado.salario_neto = salario_neto;
            empleado.deducciones = deducciones;
            db.EMPLEADOes.Add(empleado);
            db.SaveChanges();
        }

        public EMPLEADO deleteEmpleado(int codigo) {
            EMPLEADO obj = db.EMPLEADOes.Single(x => x.codigo == codigo);
            db.EMPLEADOes.Remove(obj);
            db.SaveChanges();
            return obj;
        }
    }
}