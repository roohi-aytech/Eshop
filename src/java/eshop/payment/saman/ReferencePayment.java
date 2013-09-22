/**
 * ReferencePayment.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package eshop.payment.saman;

public interface ReferencePayment extends javax.xml.rpc.Service {
    public String getPaymentIFPortAddress();

    public eshop.payment.saman.PaymentIF getPaymentIFPort() throws javax.xml.rpc.ServiceException;

    public eshop.payment.saman.PaymentIF getPaymentIFPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException;
}
