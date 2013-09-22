/**
 * PaymentIF.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package eshop.payment.saman;

public interface PaymentIF extends java.rmi.Remote {
    public eshop.payment.saman.ReverseResult reverseTransResult(String string_1, String string_2, String string_3, double double_4) throws java.rmi.RemoteException;
    public int reverseTransaction(String string_1, String string_2, String string_3, double double_4) throws java.rmi.RemoteException;
    public double verifyTransaction(String string_1, String string_2) throws java.rmi.RemoteException;
    public String verifyTransaction2(String string_1, String string_2, String string_3, String string_4) throws java.rmi.RemoteException;
    public String verifyTransaction3(String string_1, String string_2, String string_3, String string_4, String string_5, String string_6) throws java.rmi.RemoteException;
    public String verifyTransaction4(String string_1, String string_2, String string_3, String string_4, String string_5, String string_6, String string_7, String string_8) throws java.rmi.RemoteException;
    public eshop.payment.saman.TransResult viewTransaction(String string_1, String string_2, eshop.payment.saman.FilterBean filterBean_3) throws java.rmi.RemoteException;
}
