/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CapaNegocio;

import CapaDatos.clsJDBC;
import static com.sun.org.apache.xalan.internal.lib.ExsltDatetime.date;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author user
 * Bravo Gonzales Anthuaned
 * Castro Fernández Paola 
 * Falla Pisfil Daniel
 * Ruiz Correa Cristhian
 */
public class clsPago {
    clsJDBC objConectar = new clsJDBC();
    String strSQL;
    ResultSet rs = null;
    Connection con;
    Statement sent;
    
    /*
    
      CREATE TABLE TIPOPAGO (
      idTIPOPAGO SERIAL NOT NULL PRIMARY KEY,
      descripcion VARCHAR(45) NOT NULL);
    
      CREATE TABLE PAGO (
      idPAGO SERIAL NOT NULL PRIMARY KEY ,
      numero INT NOT NULL,
      monto_total DECIMAL(8,2) NOT NULL,
      TIPOPAGO_idTIPOPAGO INT NOT NULL REFERENCES TIPOPAGO,
      SERVICIO_idSERVICIO INT NOT NULL REFERENCES SERVICIO);
    
      CREATE TABLE CUOTA (
      idCUOTA SERIAL NOT NULL PRIMARY KEY,
      numero VARCHAR(45) NOT NULL,
      fecha_programada VARCHAR(45) NOT NULL,
      fecha_pago VARCHAR(45) NOT NULL,
      mora FLOAT  NULL,
      monto DECIMAL(8,2) NOT NULL,
      estado BOOLEAN NOT NULL,
      PAGO_idPAGO INT NOT NULL REFERENCES PAGO);
    
    */
    
    public void registrarTipoPago(String descripcion) throws Exception {
        
         strSQL="insert into tipopago(default,'"+descripcion+"')";
        try {
            objConectar.ejecutarBD(strSQL);
        } catch (Exception e) {
            throw new Exception(e);
        }
    }
    
    public void registrarPago(int numero,float monto,int tipopago, int servicio, int numerocuota, String fecha_programada, String fecha_pago, float mora, float monto_cuota, Boolean estado) throws  Exception{
        
        try {
            
            int pago=0;
            strSQL="insert into pago values (default,"+numero+","+monto+","+tipopago+","+servicio+")";
            objConectar.ejecutarBD(strSQL);
            strSQL="select idpago from pago where servicio_idservicio="+servicio+")";
            rs = objConectar.consultarBD(strSQL);
            while(rs.next()){
                pago=rs.getInt("idpago");
            }
            
            for (int i=0;i<numero;i++){
               strSQL="insert into cuota values (default,"+numerocuota+",'"+fecha_programada+"','"+fecha_pago+"',"+mora+","+monto_cuota+","+estado+", "+pago+")"; 
            }
            con.commit();
        } catch (Exception e) {
            con.rollback();
            throw  new Exception(e);
        }
    }
    
    
}
