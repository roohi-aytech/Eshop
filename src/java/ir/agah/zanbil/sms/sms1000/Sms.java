/**
 * Sms.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package ir.agah.zanbil.sms.sms1000;

public interface Sms extends javax.xml.rpc.Service {
    public String getsmsSoap12Address();

    public ir.agah.zanbil.sms.sms1000.SmsSoap_PortType getsmsSoap12() throws javax.xml.rpc.ServiceException;

    public ir.agah.zanbil.sms.sms1000.SmsSoap_PortType getsmsSoap12(java.net.URL portAddress) throws javax.xml.rpc.ServiceException;
    public String getsmsSoapAddress();

    public ir.agah.zanbil.sms.sms1000.SmsSoap_PortType getsmsSoap() throws javax.xml.rpc.ServiceException;

    public ir.agah.zanbil.sms.sms1000.SmsSoap_PortType getsmsSoap(java.net.URL portAddress) throws javax.xml.rpc.ServiceException;
}
