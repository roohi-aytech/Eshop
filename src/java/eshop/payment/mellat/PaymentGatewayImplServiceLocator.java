/**
 * PaymentGatewayImplServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package eshop.payment.mellat;

public class PaymentGatewayImplServiceLocator extends org.apache.axis.client.Service implements eshop.payment.mellat.PaymentGatewayImplService {

    public PaymentGatewayImplServiceLocator() {
    }


    public PaymentGatewayImplServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public PaymentGatewayImplServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for PaymentGatewayImplPort
    private java.lang.String PaymentGatewayImplPort_address = "https://bpm.shaparak.ir/pgwchannel/services/pgw";

    public java.lang.String getPaymentGatewayImplPortAddress() {
        return PaymentGatewayImplPort_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String PaymentGatewayImplPortWSDDServiceName = "PaymentGatewayImplPort";

    public java.lang.String getPaymentGatewayImplPortWSDDServiceName() {
        return PaymentGatewayImplPortWSDDServiceName;
    }

    public void setPaymentGatewayImplPortWSDDServiceName(java.lang.String name) {
        PaymentGatewayImplPortWSDDServiceName = name;
    }

    public eshop.payment.mellat.IPaymentGateway getPaymentGatewayImplPort() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(PaymentGatewayImplPort_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getPaymentGatewayImplPort(endpoint);
    }

    public eshop.payment.mellat.IPaymentGateway getPaymentGatewayImplPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            eshop.payment.mellat.PaymentGatewayImplServiceSoapBindingStub _stub = new eshop.payment.mellat.PaymentGatewayImplServiceSoapBindingStub(portAddress, this);
            _stub.setPortName(getPaymentGatewayImplPortWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setPaymentGatewayImplPortEndpointAddress(java.lang.String address) {
        PaymentGatewayImplPort_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (eshop.payment.mellat.IPaymentGateway.class.isAssignableFrom(serviceEndpointInterface)) {
                eshop.payment.mellat.PaymentGatewayImplServiceSoapBindingStub _stub = new eshop.payment.mellat.PaymentGatewayImplServiceSoapBindingStub(new java.net.URL(PaymentGatewayImplPort_address), this);
                _stub.setPortName(getPaymentGatewayImplPortWSDDServiceName());
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
        if ("PaymentGatewayImplPort".equals(inputPortName)) {
            return getPaymentGatewayImplPort();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("http://service.pgw.sw.bps.com/", "PaymentGatewayImplService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://service.pgw.sw.bps.com/", "PaymentGatewayImplPort"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("PaymentGatewayImplPort".equals(portName)) {
            setPaymentGatewayImplPortEndpointAddress(address);
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
