/**
 * IPaymentGateway.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package eshop.payment.mellat;

public interface IPaymentGateway extends java.rmi.Remote {
    public java.lang.String bpVerifyRequest(long terminalId, java.lang.String userName, java.lang.String userPassword, long orderId, long saleOrderId, long saleReferenceId) throws java.rmi.RemoteException;
    public java.lang.String bpRefundInquiryRequest(long terminalId, java.lang.String userName, java.lang.String userPassword, long orderId, long refundOrderId, long refundReferenceId) throws java.rmi.RemoteException;
    public java.lang.String bpRefundVerifyRequest(long terminalId, java.lang.String userName, java.lang.String userPassword, long orderId, long refundOrderId, long refundReferenceId) throws java.rmi.RemoteException;
    public java.lang.String bpSettleRequest(long terminalId, java.lang.String userName, java.lang.String userPassword, long orderId, long saleOrderId, long saleReferenceId) throws java.rmi.RemoteException;
    public java.lang.String bpDynamicPayRequest(long terminalId, java.lang.String userName, java.lang.String userPassword, long orderId, long amount, java.lang.String localDate, java.lang.String localTime, java.lang.String additionalData, java.lang.String callBackUrl, long payerId, long subServiceId) throws java.rmi.RemoteException;
    public java.lang.String bpReversalRequest(long terminalId, java.lang.String userName, java.lang.String userPassword, long orderId, long saleOrderId, long saleReferenceId) throws java.rmi.RemoteException;
    public java.lang.String bpPayRequest(long terminalId, java.lang.String userName, java.lang.String userPassword, long orderId, long amount, java.lang.String localDate, java.lang.String localTime, java.lang.String additionalData, java.lang.String callBackUrl, long payerId) throws java.rmi.RemoteException;
    public java.lang.String bpSaleReferenceIdRequest(long terminalId, java.lang.String userName, java.lang.String userPassword, long orderId, long saleOrderId) throws java.rmi.RemoteException;
    public java.lang.String bpInquiryRequest(long terminalId, java.lang.String userName, java.lang.String userPassword, long orderId, long saleOrderId, long saleReferenceId) throws java.rmi.RemoteException;
    public java.lang.String bpRefundRequest(long terminalId, java.lang.String userName, java.lang.String userPassword, long orderId, long saleOrderId, long saleReferenceId, long refundAmount) throws java.rmi.RemoteException;
}
