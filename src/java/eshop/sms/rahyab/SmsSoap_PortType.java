/**
 * SmsSoap_PortType.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package eshop.sms.rahyab;

public interface SmsSoap_PortType extends java.rmi.Remote {
    public java.lang.String helloWorld() throws java.rmi.RemoteException;
    public java.lang.String doGetInfo(java.lang.String uUsername, java.lang.String uPassword) throws java.rmi.RemoteException;
    public java.lang.String doSendSMS(java.lang.String uUsername, java.lang.String uPassword, java.lang.String uNumber, java.lang.String uCellphones, java.lang.String uMessage, boolean uFarsi, boolean uTopic, boolean uFlash, java.lang.String uUDH) throws java.rmi.RemoteException;
    public java.lang.String doSendArraySMS(java.lang.String uUsername, java.lang.String uPassword, java.lang.String[] uNumber, java.lang.String[] uCellphone, java.lang.String[] uMessage, boolean[] uFarsi, boolean[] uTopic, boolean[] uFlash, java.lang.String[] uUDH) throws java.rmi.RemoteException;
    public java.lang.String doGetDelivery(java.lang.String uUsername, java.lang.String uReturnIDs) throws java.rmi.RemoteException;
    public java.lang.String doReceiveSMS(java.lang.String uUsername, java.lang.String uPassword, long uLastRowID) throws java.rmi.RemoteException;
    public eshop.sms.rahyab.MessageReceive[] doReceiveSMSArray(java.lang.String uUsername, java.lang.String uPassword, long uLastRowID) throws java.rmi.RemoteException;
    public java.lang.String getInfoXML(java.lang.String uUsername, java.lang.String uPassword) throws java.rmi.RemoteException;
}
