/**
 * PaymentIFBindingLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package eshop.payment.saman;

public class PaymentIFBindingLocator extends org.apache.axis.client.Service implements eshop.payment.saman.PaymentIFBinding {

    public PaymentIFBindingLocator() {
    }


    public PaymentIFBindingLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public PaymentIFBindingLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for PaymentIFBindingSoap
    private java.lang.String PaymentIFBindingSoap_address = "https://acquirer.samanepay.com/payments/referencepayment.asmx";

    public java.lang.String getPaymentIFBindingSoapAddress() {
        return PaymentIFBindingSoap_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String PaymentIFBindingSoapWSDDServiceName = "PaymentIFBindingSoap";

    public java.lang.String getPaymentIFBindingSoapWSDDServiceName() {
        return PaymentIFBindingSoapWSDDServiceName;
    }

    public void setPaymentIFBindingSoapWSDDServiceName(java.lang.String name) {
        PaymentIFBindingSoapWSDDServiceName = name;
    }

    public eshop.payment.saman.PaymentIFBindingSoap_PortType getPaymentIFBindingSoap() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(PaymentIFBindingSoap_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getPaymentIFBindingSoap(endpoint);
    }

    public eshop.payment.saman.PaymentIFBindingSoap_PortType getPaymentIFBindingSoap(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            eshop.payment.saman.PaymentIFBindingSoapStub _stub = new eshop.payment.saman.PaymentIFBindingSoapStub(portAddress, this);
            _stub.setPortName(getPaymentIFBindingSoapWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setPaymentIFBindingSoapEndpointAddress(java.lang.String address) {
        PaymentIFBindingSoap_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (eshop.payment.saman.PaymentIFBindingSoap_PortType.class.isAssignableFrom(serviceEndpointInterface)) {
                eshop.payment.saman.PaymentIFBindingSoapStub _stub = new eshop.payment.saman.PaymentIFBindingSoapStub(new java.net.URL(PaymentIFBindingSoap_address), this);
                _stub.setPortName(getPaymentIFBindingSoapWSDDServiceName());
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
        if ("PaymentIFBindingSoap".equals(inputPortName)) {
            return getPaymentIFBindingSoap();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("urn:Foo", "PaymentIFBinding");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("urn:Foo", "PaymentIFBindingSoap"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("PaymentIFBindingSoap".equals(portName)) {
            setPaymentIFBindingSoapEndpointAddress(address);
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
