/**
 * SmsSoap_PortType.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package ir.agah.zanbil.sms.sms1000;

public interface SmsSoap_PortType extends java.rmi.Remote {
    public String helloWorld() throws java.rmi.RemoteException;
    public String[] doSendArraySMS(String uUsername, String uPassword, String uNumber, String[] uCellphone, String[] uMessage, boolean[] uFarsi) throws java.rmi.RemoteException;
    public String doSendSMS(String uUsername, String uPassword, String uNumber, String uCellphones, String uMessage, boolean uFarsi) throws java.rmi.RemoteException;
    public String doReceiveSMS(String uUsername, String uPassword, long uLastRowID) throws java.rmi.RemoteException;
    public ir.agah.zanbil.sms.sms1000.DoReceiveSMSDSResponseDoReceiveSMSDSResult doReceiveSMSDS(String uUsername, String uPassword, long uLastRowID) throws java.rmi.RemoteException;
    public String doReceiveSMSAll(String uUsername, String uPassword) throws java.rmi.RemoteException;
    public ir.agah.zanbil.sms.sms1000.DoReceiveSMSAllDSResponseDoReceiveSMSAllDSResult doReceiveSMSAllDS(String uUsername, String uPassword) throws java.rmi.RemoteException;
    public String getDelivery(String uUsername, String uReturnIDs) throws java.rmi.RemoteException;
    public String getInfo(String uUsername, String uPassword) throws java.rmi.RemoteException;
}
