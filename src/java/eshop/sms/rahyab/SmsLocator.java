/**
 * SmsLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package eshop.sms.rahyab;

public class SmsLocator extends org.apache.axis.client.Service implements eshop.sms.rahyab.Sms {

    public SmsLocator() {
    }


    public SmsLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public SmsLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for smsSoap12
    private java.lang.String smsSoap12_address = "http://rahyabbulk.ir:8020/webservice/sms.asmx";

    public java.lang.String getsmsSoap12Address() {
        return smsSoap12_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String smsSoap12WSDDServiceName = "smsSoap12";

    public java.lang.String getsmsSoap12WSDDServiceName() {
        return smsSoap12WSDDServiceName;
    }

    public void setsmsSoap12WSDDServiceName(java.lang.String name) {
        smsSoap12WSDDServiceName = name;
    }

    public eshop.sms.rahyab.SmsSoap_PortType getsmsSoap12() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(smsSoap12_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getsmsSoap12(endpoint);
    }

    public eshop.sms.rahyab.SmsSoap_PortType getsmsSoap12(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            eshop.sms.rahyab.SmsSoap12Stub _stub = new eshop.sms.rahyab.SmsSoap12Stub(portAddress, this);
            _stub.setPortName(getsmsSoap12WSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setsmsSoap12EndpointAddress(java.lang.String address) {
        smsSoap12_address = address;
    }


    // Use to get a proxy class for smsSoap
    private java.lang.String smsSoap_address = "http://rahyabbulk.ir:8020/webservice/sms.asmx";

    public java.lang.String getsmsSoapAddress() {
        return smsSoap_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String smsSoapWSDDServiceName = "smsSoap";

    public java.lang.String getsmsSoapWSDDServiceName() {
        return smsSoapWSDDServiceName;
    }

    public void setsmsSoapWSDDServiceName(java.lang.String name) {
        smsSoapWSDDServiceName = name;
    }

    public eshop.sms.rahyab.SmsSoap_PortType getsmsSoap() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(smsSoap_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getsmsSoap(endpoint);
    }

    public eshop.sms.rahyab.SmsSoap_PortType getsmsSoap(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            eshop.sms.rahyab.SmsSoap_BindingStub _stub = new eshop.sms.rahyab.SmsSoap_BindingStub(portAddress, this);
            _stub.setPortName(getsmsSoapWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setsmsSoapEndpointAddress(java.lang.String address) {
        smsSoap_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     * This service has multiple ports for a given interface;
     * the proxy implementation returned may be indeterminate.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (eshop.sms.rahyab.SmsSoap_PortType.class.isAssignableFrom(serviceEndpointInterface)) {
                eshop.sms.rahyab.SmsSoap12Stub _stub = new eshop.sms.rahyab.SmsSoap12Stub(new java.net.URL(smsSoap12_address), this);
                _stub.setPortName(getsmsSoap12WSDDServiceName());
                return _stub;
            }
            if (eshop.sms.rahyab.SmsSoap_PortType.class.isAssignableFrom(serviceEndpointInterface)) {
                eshop.sms.rahyab.SmsSoap_BindingStub _stub = new eshop.sms.rahyab.SmsSoap_BindingStub(new java.net.URL(smsSoap_address), this);
                _stub.setPortName(getsmsSoapWSDDServiceName());
                return _stub;
            }
        }
        catch (java.lang.Throwable t) {
            throw new javax.xml.rpc.ServiceException(t);
        }
        throw new javax.xml.rpc.ServiceException("There is no stub implementation for the interface:  " + (serviceEndpointInterface == null ? "null" : serviceEndpointInterface.getName()));
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(javax.xml.namespace.QName portName, Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        if (portName == null) {
            return getPort(serviceEndpointInterface);
        }
        java.lang.String inputPortName = portName.getLocalPart();
        if ("smsSoap12".equals(inputPortName)) {
            return getsmsSoap12();
        }
        else if ("smsSoap".equals(inputPortName)) {
            return getsmsSoap();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("http://srv-pardis.sms1000.ir/", "sms");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://srv-pardis.sms1000.ir/", "smsSoap12"));
            ports.add(new javax.xml.namespace.QName("http://srv-pardis.sms1000.ir/", "smsSoap"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("smsSoap12".equals(portName)) {
            setsmsSoap12EndpointAddress(address);
        }
        else 
if ("smsSoap".equals(portName)) {
            setsmsSoapEndpointAddress(address);
        }
        else 
{ // Unknown Port Name
            throw new javax.xml.rpc.ServiceException(" Cannot set Endpoint Address for Unknown Port" + portName);
        }
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(javax.xml.namespace.QName portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        setEndpointAddress(portName.getLocalPart(), address);
    }

}
